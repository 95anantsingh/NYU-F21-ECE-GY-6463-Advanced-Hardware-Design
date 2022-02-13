
-- Up Counter Resets to 9 counts 9-15

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CounterA is
port(
    clk: in std_logic; 
    reset: in std_logic;
    enable : in std_logic;
    cnt: out unsigned(3 downto 0)
);
end CounterA;

architecture Behavioral of CounterA is
signal i_cnt: unsigned(3 downto 0) := "1001";
begin
    process(clk, reset) 
    begin
     if(reset='1') then
        i_cnt <= "1001";
     elsif (enable='1') then
        if (rising_edge(clk)) then
            if (i_cnt = "1111") then
                i_cnt <="1001";
            else
                i_cnt <= i_cnt + 1;
            end if;
        end if;
     end if;
     end process;
     cnt <= i_cnt;
end Behavioral;