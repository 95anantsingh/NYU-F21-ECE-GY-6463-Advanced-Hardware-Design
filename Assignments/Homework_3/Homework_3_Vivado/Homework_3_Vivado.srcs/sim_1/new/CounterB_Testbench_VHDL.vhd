
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity CounterB_Testbench_VHDL is
end CounterB_Testbench_VHDL;

architecture Behavioral of CounterB_Testbench_VHDL is

-- component CounterD
--        port(
--            clk: in std_logic; 
--            reset: in std_logic;
--            enable : in std_logic;
--            cnt: out unsigned(3 downto 0)
--            );
--    end component;

    component CounterB
        port(
            clk: in std_logic; 
            reset: in std_logic;
            enable : in std_logic;
            cnt: out unsigned(3 downto 0)
            );
    end component;
    
    signal t_clk: std_logic := '1';
    signal t_reset: std_logic := '0';
    signal t_enable: std_logic := '0';
    signal t_cnt:  unsigned(3 downto 0);
    
begin
    
    --DUT DUT:CounterB port....
    --As per VHDL test bench
     
    --As per class tutorial
    --Diff ? dont know yet
    
--    DUT:entity work.CounterD 
--        port map(clk=>t_clk, reset=>t_reset, 
--                 enable=>t_enable, cnt=>t_cnt
--                 );
    
    DUT:entity work.CounterB 
        port map(clk=>t_clk, reset=>t_reset, 
                 enable=>t_enable, cnt=>t_cnt
                 );
    
    --Name of Process is Optional
    CLK_GEN:process begin
        t_clk<='1';
        wait for 0.5ns;
        t_clk<='0';
        wait for 0.5ns;      
    end process;

    Test_Process:process 
        constant PERIOD:time:=1ns;
    begin
                             
        wait for PERIOD;
        t_enable<='1';
        assert (t_cnt = "0100") report "Error in Case 0100" severity FAILURE;
                
        wait for PERIOD;
        assert (t_cnt = "0011") report "Error in Case 0011" severity FAILURE;
        
        wait for PERIOD;
        assert (t_cnt = "0010") report "Error in Case 0010" severity FAILURE;
        
        wait for PERIOD;
        assert (t_cnt = "0001") report "Error in Case 0001" severity FAILURE;
        
        wait for PERIOD;
        assert (t_cnt = "0000") report "Error in Case 0000" severity FAILURE;
        
        wait for PERIOD;
        assert (t_cnt = "0100") report "Error in Case 2nd 0100" severity FAILURE;
        
        wait for PERIOD;
        assert (t_cnt = "0011") report "Error in Case 2nd 0011" severity FAILURE;
        
        t_reset<='1';
        wait for 0.5ns;
        assert (t_cnt = "0100") report "Error in Reset" severity FAILURE;
        t_reset<='0';

        
        wait for PERIOD;
        t_enable<='0';
        wait for 0.5ns;
        assert (t_cnt = "0011") report "Error in Enable" severity FAILURE;
        
        wait for PERIOD;
        t_reset<='1';
        wait for PERIOD;
        assert (t_cnt = "0100") report "Error in 2nd Reset" severity FAILURE;
        
        
        -- Default severiy is NOTE and is optional to expicitly define
        report "All Test Passed" severity NOTE;
        std.env.stop;
    end process;
end Behavioral;
