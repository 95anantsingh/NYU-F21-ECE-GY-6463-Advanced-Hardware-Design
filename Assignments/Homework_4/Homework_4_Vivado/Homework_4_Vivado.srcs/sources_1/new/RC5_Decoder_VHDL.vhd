
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RC5_Decoder_VHDL is
    port(
        clr: IN STD_LOGIC;                      -- Asynchronous reset
        clk: IN STD_LOGIC;                      -- Clock signal
        din: IN STD_LOGIC_VECTOR(63 DOWNTO 0);  -- 64-bit input
        dout: OUT STD_LOGIC_VECTOR(63 DOWNTO 0) -- 64-bit output
        );
end RC5_Decoder_VHDL;

architecture Behavioral of RC5_Decoder_VHDL is

    --decoded
    signal decoded:STD_LOGIC:='0';
    
    --round counter
    signal i_cnt: UNSIGNED(3 DOWNTO 0):="1100";
    
    --register to store value A
    signal a_reg: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal as_sub: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal a_rot: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal a: STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    --register to store value B
    signal b_reg: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal bs_sub: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal b_rot: STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal b: STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    --skey declration
    TYPE rom IS ARRAY (2 TO 25) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    --skey initiation
    CONSTANT skey: 
    rom:=rom'(X"46F8E8C5", X"460C6085", X"70F83B8A", X"284B8303", 
              X"513E1454", X"F621ED22", X"3125065D", X"11A83A5D",
              X"D427686B", X"713AD82D", X"4B792F99", X"2799A4DD",
              X"A7901C49", X"DEDE871A", X"36C03196", X"A7EFC249",
              X"61A78BB8", X"3B0A1D2B", X"4DBFCA76", X"AE162167",
              X"30D76B0A", X"43192304", X"F6CC1431", X"65046380");

begin

    -- B=((B - S[2i+1])>>>A) xor A
    bs_sub <= STD_LOGIC_VECTOR(UNSIGNED(b_reg)- UNSIGNED(skey(TO_INTEGER(i_cnt & '1')))); 
    WITH a_reg(4 DOWNTO 0) SELECT
        b_rot <= bs_sub(0) & bs_sub(31 DOWNTO 1) WHEN "00001",
                 bs_sub(1 DOWNTO 0) & bs_sub(31 DOWNTO 2) WHEN "00010",
                 bs_sub(2 DOWNTO 0) & bs_sub(31 DOWNTO 3) WHEN "00011",
                 bs_sub(3 DOWNTO 0) & bs_sub(31 DOWNTO 4) WHEN "00100",
                 bs_sub(4 DOWNTO 0) & bs_sub(31 DOWNTO 5) WHEN "00101",
                 bs_sub(5 DOWNTO 0) & bs_sub(31 DOWNTO 6) WHEN "00110",
                 bs_sub(6 DOWNTO 0) & bs_sub(31 DOWNTO 7) WHEN "00111",
                 bs_sub(7 DOWNTO 0) & bs_sub(31 DOWNTO 8) WHEN "01000",
                 bs_sub(8 DOWNTO 0) & bs_sub(31 DOWNTO 9) WHEN "01001",
                 bs_sub(9 DOWNTO 0) & bs_sub(31 DOWNTO 10) WHEN "01010",
                 bs_sub(10 DOWNTO 0) & bs_sub(31 DOWNTO 11) WHEN "01011",
                 bs_sub(11 DOWNTO 0) & bs_sub(31 DOWNTO 12) WHEN "01100",
                 bs_sub(12 DOWNTO 0) & bs_sub(31 DOWNTO 13) WHEN "01101",
                 bs_sub(13 DOWNTO 0) & bs_sub(31 DOWNTO 14) WHEN "01110",
                 bs_sub(14 DOWNTO 0) & bs_sub(31 DOWNTO 15) WHEN "01111",
                 bs_sub(15 DOWNTO 0) & bs_sub(31 DOWNTO 16) WHEN "10000",
                 bs_sub(16 DOWNTO 0) & bs_sub(31 DOWNTO 17) WHEN "10001",
                 bs_sub(17 DOWNTO 0) & bs_sub(31 DOWNTO 18) WHEN "10010",
                 bs_sub(18 DOWNTO 0) & bs_sub(31 DOWNTO 19) WHEN "10011",
                 bs_sub(19 DOWNTO 0) & bs_sub(31 DOWNTO 20) WHEN "10100",
                 bs_sub(20 DOWNTO 0) & bs_sub(31 DOWNTO 21) WHEN "10101",
                 bs_sub(21 DOWNTO 0) & bs_sub(31 DOWNTO 22) WHEN "10110",
                 bs_sub(22 DOWNTO 0) & bs_sub(31 DOWNTO 23) WHEN "10111",
                 bs_sub(23 DOWNTO 0) & bs_sub(31 DOWNTO 24) WHEN "11000",
                 bs_sub(24 DOWNTO 0) & bs_sub(31 DOWNTO 25) WHEN "11001",
                 bs_sub(25 DOWNTO 0) & bs_sub(31 DOWNTO 26) WHEN "11010",
                 bs_sub(26 DOWNTO 0) & bs_sub(31 DOWNTO 27) WHEN "11011",
                 bs_sub(27 DOWNTO 0) & bs_sub(31 DOWNTO 28) WHEN "11100",
                 bs_sub(28 DOWNTO 0) & bs_sub(31 DOWNTO 29) WHEN "11101",
                 bs_sub(29 DOWNTO 0) & bs_sub(31 DOWNTO 30) WHEN "11110",
                 bs_sub(30 DOWNTO 0) & bs_sub(31) WHEN "11111",
                 bs_sub WHEN OTHERS;
    b <= b_rot XOR a_reg;
    
    -- A=((A - S[2i])>>>B) xor B
    as_sub <= STD_LOGIC_VECTOR(UNSIGNED(a_reg)- UNSIGNED(skey(TO_INTEGER(i_cnt & '0')))); 
    WITH b(4 DOWNTO 0) SELECT
        a_rot <= as_sub(0) & as_sub(31 DOWNTO 1) WHEN "00001",
                 as_sub(1 DOWNTO 0) & as_sub(31 DOWNTO 2) WHEN "00010",
                 as_sub(2 DOWNTO 0) & as_sub(31 DOWNTO 3) WHEN "00011",
                 as_sub(3 DOWNTO 0) & as_sub(31 DOWNTO 4) WHEN "00100",
                 as_sub(4 DOWNTO 0) & as_sub(31 DOWNTO 5) WHEN "00101",
                 as_sub(5 DOWNTO 0) & as_sub(31 DOWNTO 6) WHEN "00110",
                 as_sub(6 DOWNTO 0) & as_sub(31 DOWNTO 7) WHEN "00111",
                 as_sub(7 DOWNTO 0) & as_sub(31 DOWNTO 8) WHEN "01000",
                 as_sub(8 DOWNTO 0) & as_sub(31 DOWNTO 9) WHEN "01001",
                 as_sub(9 DOWNTO 0) & as_sub(31 DOWNTO 10) WHEN "01010",
                 as_sub(10 DOWNTO 0) & as_sub(31 DOWNTO 11) WHEN "01011",
                 as_sub(11 DOWNTO 0) & as_sub(31 DOWNTO 12) WHEN "01100",
                 as_sub(12 DOWNTO 0) & as_sub(31 DOWNTO 13) WHEN "01101",
                 as_sub(13 DOWNTO 0) & as_sub(31 DOWNTO 14) WHEN "01110",
                 as_sub(14 DOWNTO 0) & as_sub(31 DOWNTO 15) WHEN "01111",
                 as_sub(15 DOWNTO 0) & as_sub(31 DOWNTO 16) WHEN "10000",
                 as_sub(16 DOWNTO 0) & as_sub(31 DOWNTO 17) WHEN "10001",
                 as_sub(17 DOWNTO 0) & as_sub(31 DOWNTO 18) WHEN "10010",
                 as_sub(18 DOWNTO 0) & as_sub(31 DOWNTO 19) WHEN "10011",
                 as_sub(19 DOWNTO 0) & as_sub(31 DOWNTO 20) WHEN "10100",
                 as_sub(20 DOWNTO 0) & as_sub(31 DOWNTO 21) WHEN "10101",
                 as_sub(21 DOWNTO 0) & as_sub(31 DOWNTO 22) WHEN "10110",
                 as_sub(22 DOWNTO 0) & as_sub(31 DOWNTO 23) WHEN "10111",
                 as_sub(23 DOWNTO 0) & as_sub(31 DOWNTO 24) WHEN "11000",
                 as_sub(24 DOWNTO 0) & as_sub(31 DOWNTO 25) WHEN "11001",
                 as_sub(25 DOWNTO 0) & as_sub(31 DOWNTO 26) WHEN "11010",
                 as_sub(26 DOWNTO 0) & as_sub(31 DOWNTO 27) WHEN "11011",
                 as_sub(27 DOWNTO 0) & as_sub(31 DOWNTO 28) WHEN "11100",
                 as_sub(28 DOWNTO 0) & as_sub(31 DOWNTO 29) WHEN "11101",
                 as_sub(29 DOWNTO 0) & as_sub(31 DOWNTO 30) WHEN "11110",
                 as_sub(30 DOWNTO 0) & as_sub(31) WHEN "11111",
                 as_sub WHEN OTHERS;
    a <= a_rot XOR b;

        -- Update funtion for a_reg
    PROCESS(clr, clk) BEGIN
        IF(clr='0') THEN a_reg <= din(63 DOWNTO 32);
        ELSIF(rising_edge(clk) AND decoded='0') THEN a_reg <= a;
        END IF;
    END PROCESS;
    
    -- Update funtion for b_reg
    PROCESS(clr, clk) BEGIN
        IF(clr='0') THEN b_reg <= din(31 DOWNTO 0);
        ELSIF(rising_edge(clk) AND decoded='0') THEN b_reg <= b;
        END IF;
    END PROCESS;
    
    -- Update funtion for i_cnt counter
    PROCESS(clr, clk) 
    BEGIN
        IF(clr='0') THEN 
            i_cnt <= "1100";
            decoded <= '0';
        ELSIF(rising_edge(clk)) THEN
            IF(i_cnt="0001") THEN
                decoded <= '1';
            ELSE
                i_cnt <= i_cnt-1;
            END IF;
        END IF;
    END PROCESS;
    
    -- Assign decrypted output
    dout <=a_reg & b_reg;
    
end Behavioral;
