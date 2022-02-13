#!/bin/python3

# to use this file, run the following command in the terminal:
# python3 simple_function_rc5.py -i <64-bit hexadecimal input>
# it will print the output in the following format:
# <64-bit hexadecimal input> <64-bit hexadecimal output>

import argparse
import random as r

rom = [
    None,
    None,
	0x46F8E8C5,
	0x460C6085,
	0x70F83B8A,
	0x284B8303,
	0x513E1454,
	0xF621ED22,
	0x3125065D,
	0x11A83A5D,
	0xD427686B,
	0x713AD82D,
	0x4B792F99,
	0x2799A4DD,
    0xA7901C49,
	0xDEDE871A,
	0x36C03196,
	0xA7EFC249,
	0x61A78BB8,
	0x3B0A1D2B,
	0x4DBFCA76,
	0xAE162167,
	0x30D76B0A,
	0x43192304,
	0xF6CC1431,
	0x65046380,    
]

def simple_function_rc5(din):
    i_cnt = 1
    ab_xor = 0
    a_rot = 0
    a = 0
    a_reg = 0
    ba_xor = 0
    b_rot = 0
    b_reg = 0

    a_reg = (din >> 32) & 0xFFFFFFFF
    b_reg = din & 0xFFFFFFFF

    #it's difficult to constrain variable bit lengths in pure python
    #in this function we do it by &-ing things with 0xFFFFFFFF all the time
    #this will keep everything in the 32-bit range
    for i_cnt in range(1, 13):
        ab_xor = a_reg ^ b_reg
        a_rot = ((ab_xor << (b_reg & 0x1F)) | (ab_xor >> (32 - (b_reg & 0x1F)))) & 0xFFFFFFFF
        a = (a_rot + rom[i_cnt << 1 | 0]) & 0xFFFFFFFF

        ba_xor = b_reg ^ a
        b_rot = ((ba_xor << (a & 0x1F)) | (ba_xor >> (32 - (a & 0x1F)))) & 0xFFFFFFFF
        b = (b_rot + rom[i_cnt << 1 | 1]) & 0xFFFFFFFF
        
        a_reg = a & 0xFFFFFFFF
        b_reg = b & 0xFFFFFFFF

    return a_reg << 32 | b_reg

def main():
    # #get the 64-bit input in hexadecimal format from first command line argument
    # input_args = argparse.ArgumentParser()
    # input_args.add_argument("-i", "--input", help="64-bit input in hexadecimal format", required=True)
    # args = input_args.parse_args()

    # #make sure the input is 16 characters long
    # if len(args.input) != 16:
    #     print("The input is not 16 characters (required for a 64-bit hexadecimal number)")
    #     exit()

    # #make sure the input is hexadecimal
    # try:
    #     input_val = int(args.input, 16)
    # except:
    #     print("The input is not hexadecimal")
    #     exit()
    nums =[]
    size=100
    maxLimit = 18446744073709551615
    while(len(nums)<size):
        num = r.randint(0,maxLimit)
        if num not in nums:
            nums.append(num)
    
    print(len(nums))
    # print(nums)
    with open("Homework_4_Vivado\Testcases.txt","w") as f:
        for i in nums:
            f.write("%016x %016x\n"% (i, simple_function_rc5(i)))  
    #print("%016x %016x"% (input_val, simple_function_rc5(input_val)))
    # print("{:064b} {:064b}".format((input_val), (simple_function_rc5(input_val))))

if __name__ == "__main__":
    main()
