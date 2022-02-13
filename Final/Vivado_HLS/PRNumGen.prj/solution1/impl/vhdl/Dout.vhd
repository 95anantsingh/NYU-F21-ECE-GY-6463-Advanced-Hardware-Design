-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.3
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Dout is
port (
    ap_ready : OUT STD_LOGIC;
    data_out : OUT STD_LOGIC_VECTOR (7 downto 0);
    data_out_ap_vld : OUT STD_LOGIC;
    out_cnt : IN STD_LOGIC_VECTOR (2 downto 0);
    d_out : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of Dout is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_lv3_3 : STD_LOGIC_VECTOR (2 downto 0) := "011";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";

    signal tmp_fu_41_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_fu_51_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_57_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_2_fu_63_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_15_fu_102_p1 : STD_LOGIC_VECTOR (7 downto 0);


begin



    ap_ready <= ap_const_logic_1;

    data_out_assign_proc : process(d_out, tmp_fu_41_p2, tmp_5_fu_51_p2, tmp_8_fu_57_p2, tmp_2_fu_63_p2, tmp_15_fu_102_p1)
    begin
        if ((tmp_fu_41_p2 = ap_const_lv1_1)) then 
            data_out <= tmp_15_fu_102_p1;
        elsif (((tmp_5_fu_51_p2 = ap_const_lv1_1) and (tmp_fu_41_p2 = ap_const_lv1_0))) then 
            data_out <= d_out(15 downto 8);
        elsif (((tmp_8_fu_57_p2 = ap_const_lv1_1) and (tmp_5_fu_51_p2 = ap_const_lv1_0) and (tmp_fu_41_p2 = ap_const_lv1_0))) then 
            data_out <= d_out(23 downto 16);
        elsif (((tmp_2_fu_63_p2 = ap_const_lv1_1) and (tmp_8_fu_57_p2 = ap_const_lv1_0) and (tmp_5_fu_51_p2 = ap_const_lv1_0) and (tmp_fu_41_p2 = ap_const_lv1_0))) then 
            data_out <= d_out(31 downto 24);
        else 
            data_out <= "XXXXXXXX";
        end if; 
    end process;


    data_out_ap_vld_assign_proc : process(tmp_fu_41_p2, tmp_5_fu_51_p2, tmp_8_fu_57_p2, tmp_2_fu_63_p2)
    begin
        if (((tmp_fu_41_p2 = ap_const_lv1_1) or ((tmp_5_fu_51_p2 = ap_const_lv1_1) and (tmp_fu_41_p2 = ap_const_lv1_0)) or ((tmp_8_fu_57_p2 = ap_const_lv1_1) and (tmp_5_fu_51_p2 = ap_const_lv1_0) and (tmp_fu_41_p2 = ap_const_lv1_0)) or ((tmp_2_fu_63_p2 = ap_const_lv1_1) and (tmp_8_fu_57_p2 = ap_const_lv1_0) and (tmp_5_fu_51_p2 = ap_const_lv1_0) and (tmp_fu_41_p2 = ap_const_lv1_0)))) then 
            data_out_ap_vld <= ap_const_logic_1;
        else 
            data_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    tmp_15_fu_102_p1 <= d_out(8 - 1 downto 0);
    tmp_2_fu_63_p2 <= "1" when (out_cnt = ap_const_lv3_3) else "0";
    tmp_5_fu_51_p2 <= "1" when (out_cnt = ap_const_lv3_1) else "0";
    tmp_8_fu_57_p2 <= "1" when (out_cnt = ap_const_lv3_2) else "0";
    tmp_fu_41_p2 <= "1" when (out_cnt = ap_const_lv3_0) else "0";
end behav;
