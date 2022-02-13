

def lfsr(seed, taps, time):
    sr, xor = seed, 0
    i=1
    print("%08x"% (int(seed,2)))
    while 1:
        for t in taps:
            xor += int(sr[t-1])
        if xor%2 == 0.0:
            xor = 0
        else:
            xor = 1
        #print(xor)
        sr, xor = str(xor) + sr[:-1], 0
        #print(sr)
        print("%08x"% (int(sr,2)))
        if sr == seed:
            print(i)
            break
        if(i==time):
            break
        i=i+1

# lfsr('00000010010001101000101011001101', (32,14,12,10,6,5,1),0) 
# lfsr('11001101', (8,4,3,2),0) 
lfsr(str(bin(int("4E807D6B", 16))[2:].zfill(32)), (32,14,12,10,6,5,1),1000)