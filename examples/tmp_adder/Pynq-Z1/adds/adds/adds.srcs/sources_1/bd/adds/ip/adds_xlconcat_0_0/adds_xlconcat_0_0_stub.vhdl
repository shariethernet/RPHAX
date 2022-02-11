-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Fri Feb 11 20:36:41 2022
-- Host        : shriharipc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/RISC-V/Pynq_Proj/Projects/Yun/yun_repo/PYNQ-adder/boards/Pynq-Z1/adds/adds/adds.srcs/sources_1/bd/adds/ip/adds_xlconcat_0_0/adds_xlconcat_0_0_stub.vhdl
-- Design      : adds_xlconcat_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adds_xlconcat_0_0 is
  Port ( 
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end adds_xlconcat_0_0;

architecture stub of adds_xlconcat_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "In0[0:0],dout[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconcat_v2_1_1_xlconcat,Vivado 2018.2";
begin
end;
