library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity And_Or_Testbench_VHDL is
end And_Or_Testbench_VHDL;

architecture Behavioral of And_Or_Testbench_VHDL is
    -- Component declaration can be skiped if the file to be 
    -- tested is included in Design Sources of the current project.
    
--    component And_Or_Verilog
--        port ( A,B,C: in bit; O : out bit);
--    end component;
    
    component And_Or_VHDL
        port ( A,B,C: in bit; O : out bit);
    end component;
    
    -- signal t_A, t_B, t_C, t_O : bit;
    -- OR
    -- Default value intiation
    signal t_A: bit := '0';
    signal t_B: bit := '0';
    signal t_C: bit := '0';
    signal t_O: bit;
begin
--    DUT:And_Or_Verilog port map(A=>t_A,B=>t_B,C=>t_C,O=>t_O);
    DUT:And_Or_VHDL port map(A=>t_A,B=>t_B,C=>t_C,O=>t_O);
    
    --Process name is optional
    TestProcess:process
        constant PERIOD:time:=1ns;
    begin
        -- 000
        t_A<='0';t_B<='0';t_C<='0';
        wait for PERIOD;
        assert (t_O='0') report "Error in Case 000" severity FAILURE;
        
        -- 001
        t_A<='0';t_B<='0';t_C<='1';
        wait for PERIOD;
        assert (t_O='1') report "Error in Case 001" severity FAILURE;
        
        -- 010
        t_A<='0';t_B<='1';t_C<='0';
        wait for PERIOD;
        assert (t_O='0') report "Error in Case 010" severity FAILURE;
        
        -- 011
        t_A<='0';t_B<='1';t_C<='1';
        wait for PERIOD;
        assert (t_O='1') report "Error in Case 011" severity FAILURE;
        
        -- 100
        t_A<='1';t_B<='0';t_C<='0';
        wait for PERIOD;
        assert (t_O='0') report "Error in Case 100" severity FAILURE;
        
        -- 101
        t_A<='1';t_B<='0';t_C<='1';
        wait for PERIOD;
        assert (t_O='1') report "Error in Case 101" severity FAILURE;
        
        -- 110
        t_A<='1';t_B<='1';t_C<='0';
        wait for PERIOD;
        assert (t_O='1') report "Error in Case 110" severity FAILURE;
        
        -- 111
        t_A<='1';t_B<='1';t_C<='1';
        wait for PERIOD;
        assert (t_O='1') report "Error in Case 111" severity FAILURE;
        
        -- Report All Passed and Halt
        report "All Test Passed" severity NOTE;
        --wait;
        -- OR a more appropriate command w2q1   w2q1    
        std.env.stop;
        
    end process;
end Behavioral;
