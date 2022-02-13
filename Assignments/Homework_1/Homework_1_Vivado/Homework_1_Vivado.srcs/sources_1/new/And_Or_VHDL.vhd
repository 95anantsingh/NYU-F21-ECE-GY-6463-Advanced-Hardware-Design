
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_Or_VHDL is
    Port ( A : in bit;
           B : in bit;
           C : in bit;
           O : out bit);
end And_Or_VHDL;

architecture Behavioral of And_Or_VHDL is
signal D : bit;
begin

D <= A and B;
O <= D or C;

end Behavioral;