
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.ALL;

library STD;
use STD.TEXTIO.ALL;

entity RC5_Testbench_VHDL is
end RC5_Testbench_VHDL;

architecture Behavioral of RC5_Testbench_VHDL is

    signal t_clr:STD_LOGIC;
    signal t_clk:STD_LOGIC;
    signal t_din:STD_LOGIC_VECTOR(63 DOWNTO 0);
    signal t_dout:STD_LOGIC_VECTOR(63 DOWNTO 0);

    file file_pointer:text;
    
    function to_hstring( input : std_logic_vector ) return string is
        variable rline : line;
    begin
        hwrite( rline, input );
        return rline.all;
    end to_hstring;
    
begin

--    DUT:entity work.RC5_Decoder
--    DUT:entity work.RC5_Encoder
--    DUT:entity work.RC5_Decoder_VHDL
    DUT:entity work.RC5_Encoder_VHDL
    
        port map(
                 clr=>t_clr, clk=>t_clk,
                 din=>t_din, dout=>t_dout
                );
    
    process 
        variable f_line:line;
        variable f_din:STD_LOGIC_VECTOR(63 DOWNTO 0);
        variable f_dout:STD_LOGIC_VECTOR(63 DOWNTO 0);
        variable f_space:character;
        
    begin
        file_open(file_pointer, "Testcases.txt",read_mode);
        
        -- Test for Values
        while not endfile(file_pointer) loop
            readline(file_pointer,f_line);
            
            --Uncomment for Encoder Testing
            hread(f_line,f_din);
            read(f_line,f_space);
            hread(f_line,f_dout);
            
            -- Uncomment for Decoder Testing
--            hread(f_line,f_dout);
--            read(f_line,f_space);
--            hread(f_line,f_din);
        
            t_din<=f_din;
            t_clr<='0';
            wait for 1ns;
            t_clr<='1';
            wait for 12ns;
            assert(t_dout = f_dout) Report "Test Failed" severity FAILURE;
        end loop;
        
        --Test for holding value
        wait for 5ns;
        assert(t_dout = f_dout) Report "Test Failed for Holding value" severity FAILURE;
        
        -- Test for Clear in between of a Cycle
        t_clr<='0';
        wait for 1ns;
        t_clr<='1';
        wait for 5ns;
        t_clr<='0';
        wait for 1ns;
        assert(t_din = f_din and f_din = t_dout) Report "Test Failed for Clear in between" severity FAILURE;
        wait for 1ns;
        
        -- Test for Continuous Clear during a Cycle
        t_clr<='1';
        wait for 2ns;
        t_clr<='0';
        wait for 3ns;
        assert(t_din = f_din and f_din = t_dout) Report "Test Failed for Continuous Clear" severity FAILURE;
        
        
        report "All Test Passed" severity NOTE;
        std.env.stop;
        
    end process;
    
    
    --Name of Process is Optional
    CLK_GEN:process begin
        t_clk<='1';
        wait for 0.5ns;
        t_clk<='0';
        wait for 0.5ns;      
    end process;
end Behavioral;