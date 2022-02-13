
-- Down Counter Resets to 4 counts 4-0

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity CounterB is
port(
    clk: in std_logic; 
    reset: in std_logic;
    enable : in std_logic;
    cnt: out unsigned(3 downto 0)
);
end CounterB;

architecture Behavioral of CounterB is
signal i_cnt: unsigned(3 downto 0) := "0100";
begin
    process(clk, reset) 
    begin
     if(reset='1') then
        i_cnt <= "0100";
     elsif (enable='1') then
        if (rising_edge(clk)) then
            if (i_cnt = "0000") then
                i_cnt <="0100";
            else
                i_cnt <= i_cnt - 1;
            end if;
        end if;
     end if;
     end process;
     cnt <= i_cnt;
end Behavioral;