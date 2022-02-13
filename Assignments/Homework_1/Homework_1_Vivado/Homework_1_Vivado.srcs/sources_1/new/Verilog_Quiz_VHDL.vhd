
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Verilog_Quiz_VHDL is
    Port ( A : in bit;
           B : in bit;
           O_E : in bit;
           X : out bit;
           Y : out bit;
           Z : out bit);
end Verilog_Quiz_VHDL;

architecture Behavioral of Verilog_Quiz_VHDL is
signal T : bit;
signal YT : bit;
begin

T <= not A or B;
X <= O_E and (A nand B);
YT <= O_E and (A xor B);
Y <= YT;
Z <= O_E and (YT or T); 

end Behavioral;