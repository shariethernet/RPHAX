-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Fri Feb 11 20:36:41 2022
-- Host        : shriharipc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/RISC-V/Pynq_Proj/Projects/Yun/yun_repo/PYNQ-adder/boards/Pynq-Z1/adds/adds/adds.srcs/sources_1/bd/adds/ip/adds_axis_adder_0_0/adds_axis_adder_0_0_sim_netlist.vhdl
-- Design      : adds_axis_adder_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adds_axis_adder_0_0_axis_adder is
  port (
    DIADI : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DOADO : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adds_axis_adder_0_0_axis_adder : entity is "axis_adder";
end adds_axis_adder_0_0_axis_adder;

architecture STRUCTURE of adds_axis_adder_0_0_axis_adder is
  signal mem_reg_i_9_n_0 : STD_LOGIC;
begin
mem_reg_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => DOADO(7),
      I1 => DOADO(3),
      I2 => mem_reg_i_9_n_0,
      O => DIADI(4)
    );
mem_reg_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => mem_reg_i_9_n_0,
      I1 => DOADO(7),
      I2 => DOADO(3),
      O => DIADI(3)
    );
mem_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F880077F077FF880"
    )
        port map (
      I0 => DOADO(4),
      I1 => DOADO(0),
      I2 => DOADO(1),
      I3 => DOADO(5),
      I4 => DOADO(6),
      I5 => DOADO(2),
      O => DIADI(2)
    );
mem_reg_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8778"
    )
        port map (
      I0 => DOADO(0),
      I1 => DOADO(4),
      I2 => DOADO(5),
      I3 => DOADO(1),
      O => DIADI(1)
    );
mem_reg_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => DOADO(0),
      I1 => DOADO(4),
      O => DIADI(0)
    );
mem_reg_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEE888E8888888"
    )
        port map (
      I0 => DOADO(6),
      I1 => DOADO(2),
      I2 => DOADO(4),
      I3 => DOADO(0),
      I4 => DOADO(1),
      I5 => DOADO(5),
      O => mem_reg_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adds_axis_adder_0_0_axis_adder_v1_0_M00_AXIS is
  port (
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    mem_reg_0 : out STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    axis2pipe_tvalid : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 4 downto 0 );
    DOPADOP : in STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adds_axis_adder_0_0_axis_adder_v1_0_M00_AXIS : entity is "axis_adder_v1_0_M00_AXIS";
end adds_axis_adder_0_0_axis_adder_v1_0_M00_AXIS;

architecture STRUCTURE of adds_axis_adder_0_0_axis_adder_v1_0_M00_AXIS is
  signal axis2pipe_tready : STD_LOGIC;
  signal \empty_carry_i_1__0_n_0\ : STD_LOGIC;
  signal \empty_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \empty_carry_i_3__0_n_0\ : STD_LOGIC;
  signal empty_carry_n_1 : STD_LOGIC;
  signal empty_carry_n_2 : STD_LOGIC;
  signal empty_carry_n_3 : STD_LOGIC;
  signal \^m00_axis_tvalid\ : STD_LOGIC;
  signal mem_read_data_valid_reg : STD_LOGIC;
  signal \mem_read_data_valid_reg_i_1__0_n_0\ : STD_LOGIC;
  signal mem_reg_i_10_n_0 : STD_LOGIC;
  signal \mem_reg_i_2__0_n_0\ : STD_LOGIC;
  signal mem_reg_i_3_n_0 : STD_LOGIC;
  signal mem_reg_i_4_n_0 : STD_LOGIC;
  signal mem_reg_i_5_n_0 : STD_LOGIC;
  signal output_axis_tvalid_reg_i_1_n_0 : STD_LOGIC;
  signal output_axis_tvalid_reg_i_2_n_0 : STD_LOGIC;
  signal rd_addr_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rd_addr_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \rd_ptr_next__0\ : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \rd_ptr_reg[8]_i_2__0_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[8]\ : STD_LOGIC;
  signal read0_out : STD_LOGIC;
  signal wr_addr_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \wr_addr_reg[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal wr_ptr_next : STD_LOGIC_VECTOR ( 7 downto 4 );
  signal \wr_ptr_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \wr_ptr_reg[8]_i_1__0_n_0\ : STD_LOGIC;
  signal wr_ptr_reg_reg : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_empty_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_empty_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mem_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_mem_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mem_read_data_valid_reg_i_1__0\ : label is "soft_lutpair0";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mem_reg : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of mem_reg : label is 8448;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of mem_reg : label is "mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of mem_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of mem_reg : label is 511;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of mem_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of mem_reg : label is 32;
  attribute SOFT_HLUTNM of output_axis_tvalid_reg_i_2 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \rd_addr_reg[0]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rd_addr_reg[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rd_addr_reg[5]_i_1__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \rd_ptr_reg[8]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \wr_addr_reg[1]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_addr_reg[2]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \wr_addr_reg[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \wr_addr_reg[5]_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_addr_reg[6]_i_1__0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \wr_addr_reg[7]_i_1__0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \wr_ptr_reg[4]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \wr_ptr_reg[8]_i_1__0\ : label is "soft_lutpair3";
begin
  m00_axis_tvalid <= \^m00_axis_tvalid\;
empty_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => NLW_empty_carry_CO_UNCONNECTED(3),
      CO(2) => empty_carry_n_1,
      CO(1) => empty_carry_n_2,
      CO(0) => empty_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_empty_carry_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => \empty_carry_i_1__0_n_0\,
      S(1) => \empty_carry_i_2__0_n_0\,
      S(0) => \empty_carry_i_3__0_n_0\
    );
\empty_carry_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[8]\,
      I1 => wr_ptr_reg_reg(8),
      I2 => wr_ptr_reg_reg(6),
      I3 => \rd_ptr_reg_reg_n_0_[6]\,
      I4 => wr_ptr_reg_reg(7),
      I5 => \rd_ptr_reg_reg_n_0_[7]\,
      O => \empty_carry_i_1__0_n_0\
    );
\empty_carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => wr_ptr_reg_reg(5),
      I2 => wr_ptr_reg_reg(3),
      I3 => \rd_ptr_reg_reg_n_0_[3]\,
      I4 => wr_ptr_reg_reg(4),
      I5 => \rd_ptr_reg_reg_n_0_[4]\,
      O => \empty_carry_i_2__0_n_0\
    );
\empty_carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => wr_ptr_reg_reg(1),
      I2 => \rd_ptr_reg_reg_n_0_[2]\,
      I3 => wr_ptr_reg_reg(2),
      I4 => wr_ptr_reg_reg(0),
      I5 => \rd_ptr_reg_reg_n_0_[0]\,
      O => \empty_carry_i_3__0_n_0\
    );
\mem_read_data_valid_reg_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7555"
    )
        port map (
      I0 => empty_carry_n_1,
      I1 => m00_axis_tready,
      I2 => \^m00_axis_tvalid\,
      I3 => mem_read_data_valid_reg,
      O => \mem_read_data_valid_reg_i_1__0_n_0\
    );
mem_read_data_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \mem_read_data_valid_reg_i_1__0_n_0\,
      Q => mem_read_data_valid_reg,
      R => output_axis_tvalid_reg_i_1_n_0
    );
mem_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 1,
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "SDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(13) => '1',
      ADDRARDADDR(12 downto 5) => rd_addr_reg(7 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(13) => '1',
      ADDRBWRADDR(12 downto 5) => wr_addr_reg(7 downto 0),
      ADDRBWRADDR(4 downto 0) => B"11111",
      CLKARDCLK => m00_axis_aclk,
      CLKBWRCLK => m00_axis_aclk,
      DIADI(15 downto 5) => B"00000000000",
      DIADI(4 downto 0) => DIADI(4 downto 0),
      DIBDI(15 downto 0) => B"0000000000000000",
      DIPADIP(1) => '1',
      DIPADIP(0) => DOPADOP(0),
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15 downto 0) => m00_axis_tdata(15 downto 0),
      DOBDO(15 downto 0) => m00_axis_tdata(31 downto 16),
      DOPADOP(1) => NLW_mem_reg_DOPADOP_UNCONNECTED(1),
      DOPADOP(0) => m00_axis_tlast,
      DOPBDOP(1 downto 0) => NLW_mem_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => read0_out,
      ENBWREN => axis2pipe_tvalid,
      REGCEAREGCE => \mem_reg_i_2__0_n_0\,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3) => axis2pipe_tready,
      WEBWE(2) => axis2pipe_tready,
      WEBWE(1) => axis2pipe_tready,
      WEBWE(0) => axis2pipe_tready
    );
mem_reg_i_10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000220"
    )
        port map (
      I0 => mem_reg_i_5_n_0,
      I1 => mem_reg_i_4_n_0,
      I2 => \rd_ptr_reg_reg_n_0_[8]\,
      I3 => wr_ptr_reg_reg(8),
      I4 => mem_reg_i_3_n_0,
      O => mem_reg_i_10_n_0
    );
\mem_reg_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00F7"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => \^m00_axis_tvalid\,
      I2 => m00_axis_tready,
      I3 => empty_carry_n_1,
      O => read0_out
    );
mem_reg_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFDDFFFFFFFFF"
    )
        port map (
      I0 => axis2pipe_tvalid,
      I1 => mem_reg_i_3_n_0,
      I2 => wr_ptr_reg_reg(8),
      I3 => \rd_ptr_reg_reg_n_0_[8]\,
      I4 => mem_reg_i_4_n_0,
      I5 => mem_reg_i_5_n_0,
      O => mem_reg_0
    );
\mem_reg_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => m00_axis_tready,
      I1 => \^m00_axis_tvalid\,
      O => \mem_reg_i_2__0_n_0\
    );
mem_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => wr_ptr_reg_reg(0),
      I2 => wr_ptr_reg_reg(2),
      I3 => \rd_ptr_reg_reg_n_0_[2]\,
      I4 => wr_ptr_reg_reg(1),
      I5 => \rd_ptr_reg_reg_n_0_[1]\,
      O => mem_reg_i_3_n_0
    );
mem_reg_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[7]\,
      I1 => wr_ptr_reg_reg(7),
      I2 => \rd_ptr_reg_reg_n_0_[6]\,
      I3 => wr_ptr_reg_reg(6),
      O => mem_reg_i_4_n_0
    );
mem_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => wr_ptr_reg_reg(5),
      I2 => wr_ptr_reg_reg(3),
      I3 => \rd_ptr_reg_reg_n_0_[3]\,
      I4 => wr_ptr_reg_reg(4),
      I5 => \rd_ptr_reg_reg_n_0_[4]\,
      O => mem_reg_i_5_n_0
    );
mem_reg_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => mem_reg_i_10_n_0,
      O => axis2pipe_tready
    );
output_axis_tvalid_reg_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => m00_axis_aresetn,
      O => output_axis_tvalid_reg_i_1_n_0
    );
output_axis_tvalid_reg_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => m00_axis_tready,
      I2 => \^m00_axis_tvalid\,
      O => output_axis_tvalid_reg_i_2_n_0
    );
output_axis_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => output_axis_tvalid_reg_i_2_n_0,
      Q => \^m00_axis_tvalid\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_addr_reg[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA5595"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => mem_read_data_valid_reg,
      I2 => \^m00_axis_tvalid\,
      I3 => m00_axis_tready,
      I4 => empty_carry_n_1,
      O => \rd_addr_reg[0]_i_1__0_n_0\
    );
\rd_addr_reg[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA5595AAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => mem_read_data_valid_reg,
      I2 => \^m00_axis_tvalid\,
      I3 => m00_axis_tready,
      I4 => empty_carry_n_1,
      I5 => \rd_ptr_reg_reg_n_0_[0]\,
      O => \rd_addr_reg[1]_i_1__0_n_0\
    );
\rd_addr_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAA6A6AAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[2]\,
      I1 => \rd_ptr_reg_reg_n_0_[0]\,
      I2 => empty_carry_n_1,
      I3 => \mem_reg_i_2__0_n_0\,
      I4 => mem_read_data_valid_reg,
      I5 => \rd_ptr_reg_reg_n_0_[1]\,
      O => \rd_addr_reg[2]_i_1_n_0\
    );
\rd_addr_reg[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[3]\,
      I1 => \rd_addr_reg[6]_i_2__0_n_0\,
      I2 => \rd_ptr_reg_reg_n_0_[2]\,
      O => \rd_addr_reg[3]_i_1_n_0\
    );
\rd_addr_reg[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[4]\,
      I1 => \rd_ptr_reg_reg_n_0_[2]\,
      I2 => \rd_addr_reg[6]_i_2__0_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[3]\,
      O => \rd_addr_reg[4]_i_1_n_0\
    );
\rd_addr_reg[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => \rd_ptr_reg_reg_n_0_[3]\,
      I2 => \rd_addr_reg[6]_i_2__0_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[2]\,
      I4 => \rd_ptr_reg_reg_n_0_[4]\,
      O => \rd_addr_reg[5]_i_1__0_n_0\
    );
\rd_addr_reg[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[6]\,
      I1 => \rd_ptr_reg_reg_n_0_[4]\,
      I2 => \rd_ptr_reg_reg_n_0_[2]\,
      I3 => \rd_addr_reg[6]_i_2__0_n_0\,
      I4 => \rd_ptr_reg_reg_n_0_[3]\,
      I5 => \rd_ptr_reg_reg_n_0_[5]\,
      O => \rd_addr_reg[6]_i_1__0_n_0\
    );
\rd_addr_reg[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFDDDDDDFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => empty_carry_n_1,
      I2 => m00_axis_tready,
      I3 => \^m00_axis_tvalid\,
      I4 => mem_read_data_valid_reg,
      I5 => \rd_ptr_reg_reg_n_0_[1]\,
      O => \rd_addr_reg[6]_i_2__0_n_0\
    );
\rd_addr_reg[7]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFF08000000"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => \rd_ptr_reg_reg_n_0_[3]\,
      I2 => \rd_addr_reg[7]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[4]\,
      I4 => \rd_ptr_reg_reg_n_0_[6]\,
      I5 => \rd_ptr_reg_reg_n_0_[7]\,
      O => \rd_addr_reg[7]_i_1__0_n_0\
    );
\rd_addr_reg[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF5DFFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => mem_read_data_valid_reg,
      I2 => \mem_reg_i_2__0_n_0\,
      I3 => empty_carry_n_1,
      I4 => \rd_ptr_reg_reg_n_0_[0]\,
      I5 => \rd_ptr_reg_reg_n_0_[2]\,
      O => \rd_addr_reg[7]_i_2_n_0\
    );
\rd_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1__0_n_0\,
      Q => rd_addr_reg(0),
      R => '0'
    );
\rd_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[1]_i_1__0_n_0\,
      Q => rd_addr_reg(1),
      R => '0'
    );
\rd_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[2]_i_1_n_0\,
      Q => rd_addr_reg(2),
      R => '0'
    );
\rd_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[3]_i_1_n_0\,
      Q => rd_addr_reg(3),
      R => '0'
    );
\rd_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[4]_i_1_n_0\,
      Q => rd_addr_reg(4),
      R => '0'
    );
\rd_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[5]_i_1__0_n_0\,
      Q => rd_addr_reg(5),
      R => '0'
    );
\rd_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[6]_i_1__0_n_0\,
      Q => rd_addr_reg(6),
      R => '0'
    );
\rd_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[7]_i_1__0_n_0\,
      Q => rd_addr_reg(7),
      R => '0'
    );
\rd_ptr_reg[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[8]\,
      I1 => \rd_ptr_reg_reg_n_0_[5]\,
      I2 => \rd_ptr_reg[8]_i_2__0_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[4]\,
      I4 => \rd_ptr_reg_reg_n_0_[6]\,
      I5 => \rd_ptr_reg_reg_n_0_[7]\,
      O => \rd_ptr_next__0\(8)
    );
\rd_ptr_reg[8]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7FFFFFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[2]\,
      I1 => \rd_ptr_reg_reg_n_0_[0]\,
      I2 => empty_carry_n_1,
      I3 => \rd_ptr_reg[8]_i_3_n_0\,
      I4 => \rd_ptr_reg_reg_n_0_[1]\,
      I5 => \rd_ptr_reg_reg_n_0_[3]\,
      O => \rd_ptr_reg[8]_i_2__0_n_0\
    );
\rd_ptr_reg[8]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => \^m00_axis_tvalid\,
      I2 => m00_axis_tready,
      O => \rd_ptr_reg[8]_i_3_n_0\
    );
\rd_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[0]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[1]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[1]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[2]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[2]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[3]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[3]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[4]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[4]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[5]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[5]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[6]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[6]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[7]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[7]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\rd_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \rd_ptr_next__0\(8),
      Q => \rd_ptr_reg_reg_n_0_[8]\,
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_addr_reg[0]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => wr_ptr_reg_reg(0),
      I1 => axis2pipe_tvalid,
      I2 => mem_reg_i_10_n_0,
      O => \wr_addr_reg[0]_i_1__0_n_0\
    );
\wr_addr_reg[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => wr_ptr_reg_reg(1),
      I1 => wr_ptr_reg_reg(0),
      I2 => mem_reg_i_10_n_0,
      I3 => axis2pipe_tvalid,
      O => \wr_addr_reg[1]_i_1__0_n_0\
    );
\wr_addr_reg[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AAAAA"
    )
        port map (
      I0 => wr_ptr_reg_reg(2),
      I1 => wr_ptr_reg_reg(1),
      I2 => axis2pipe_tvalid,
      I3 => mem_reg_i_10_n_0,
      I4 => wr_ptr_reg_reg(0),
      O => \wr_addr_reg[2]_i_1__0_n_0\
    );
\wr_addr_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => wr_ptr_reg_reg(3),
      I1 => wr_ptr_reg_reg(2),
      I2 => wr_ptr_reg_reg(0),
      I3 => mem_reg_i_10_n_0,
      I4 => axis2pipe_tvalid,
      I5 => wr_ptr_reg_reg(1),
      O => \wr_addr_reg[3]_i_1_n_0\
    );
\wr_addr_reg[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \wr_addr_reg[6]_i_2_n_0\,
      I1 => wr_ptr_reg_reg(4),
      O => wr_ptr_next(4)
    );
\wr_addr_reg[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => wr_ptr_reg_reg(5),
      I1 => wr_ptr_reg_reg(4),
      I2 => \wr_addr_reg[6]_i_2_n_0\,
      O => \wr_addr_reg[5]_i_1__0_n_0\
    );
\wr_addr_reg[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => wr_ptr_reg_reg(4),
      I1 => \wr_addr_reg[6]_i_2_n_0\,
      I2 => wr_ptr_reg_reg(5),
      I3 => wr_ptr_reg_reg(6),
      O => wr_ptr_next(6)
    );
\wr_addr_reg[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => wr_ptr_reg_reg(2),
      I1 => wr_ptr_reg_reg(0),
      I2 => mem_reg_i_10_n_0,
      I3 => axis2pipe_tvalid,
      I4 => wr_ptr_reg_reg(1),
      I5 => wr_ptr_reg_reg(3),
      O => \wr_addr_reg[6]_i_2_n_0\
    );
\wr_addr_reg[7]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => wr_ptr_reg_reg(7),
      I1 => \wr_addr_reg[7]_i_2__0_n_0\,
      O => wr_ptr_next(7)
    );
\wr_addr_reg[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => wr_ptr_reg_reg(6),
      I1 => wr_ptr_reg_reg(5),
      I2 => wr_ptr_reg_reg(3),
      I3 => \wr_addr_reg[7]_i_3_n_0\,
      I4 => wr_ptr_reg_reg(2),
      I5 => wr_ptr_reg_reg(4),
      O => \wr_addr_reg[7]_i_2__0_n_0\
    );
\wr_addr_reg[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5755FFFFFFFFFFFF"
    )
        port map (
      I0 => wr_ptr_reg_reg(0),
      I1 => mem_reg_i_3_n_0,
      I2 => \wr_addr_reg[7]_i_4_n_0\,
      I3 => mem_reg_i_5_n_0,
      I4 => axis2pipe_tvalid,
      I5 => wr_ptr_reg_reg(1),
      O => \wr_addr_reg[7]_i_3_n_0\
    );
\wr_addr_reg[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF6FF66FF6FFFF"
    )
        port map (
      I0 => wr_ptr_reg_reg(6),
      I1 => \rd_ptr_reg_reg_n_0_[6]\,
      I2 => wr_ptr_reg_reg(7),
      I3 => \rd_ptr_reg_reg_n_0_[7]\,
      I4 => \rd_ptr_reg_reg_n_0_[8]\,
      I5 => wr_ptr_reg_reg(8),
      O => \wr_addr_reg[7]_i_4_n_0\
    );
\wr_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1__0_n_0\,
      Q => wr_addr_reg(0),
      R => '0'
    );
\wr_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[1]_i_1__0_n_0\,
      Q => wr_addr_reg(1),
      R => '0'
    );
\wr_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[2]_i_1__0_n_0\,
      Q => wr_addr_reg(2),
      R => '0'
    );
\wr_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[3]_i_1_n_0\,
      Q => wr_addr_reg(3),
      R => '0'
    );
\wr_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(4),
      Q => wr_addr_reg(4),
      R => '0'
    );
\wr_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[5]_i_1__0_n_0\,
      Q => wr_addr_reg(5),
      R => '0'
    );
\wr_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(6),
      Q => wr_addr_reg(6),
      R => '0'
    );
\wr_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(7),
      Q => wr_addr_reg(7),
      R => '0'
    );
\wr_ptr_reg[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"82"
    )
        port map (
      I0 => m00_axis_aresetn,
      I1 => \wr_addr_reg[6]_i_2_n_0\,
      I2 => wr_ptr_reg_reg(4),
      O => \wr_ptr_reg[4]_i_1_n_0\
    );
\wr_ptr_reg[8]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2A80"
    )
        port map (
      I0 => m00_axis_aresetn,
      I1 => wr_ptr_reg_reg(7),
      I2 => \wr_addr_reg[7]_i_2__0_n_0\,
      I3 => wr_ptr_reg_reg(8),
      O => \wr_ptr_reg[8]_i_1__0_n_0\
    );
\wr_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1__0_n_0\,
      Q => wr_ptr_reg_reg(0),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[1]_i_1__0_n_0\,
      Q => wr_ptr_reg_reg(1),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[2]_i_1__0_n_0\,
      Q => wr_ptr_reg_reg(2),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[3]_i_1_n_0\,
      Q => wr_ptr_reg_reg(3),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_ptr_reg[4]_i_1_n_0\,
      Q => wr_ptr_reg_reg(4),
      R => '0'
    );
\wr_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[5]_i_1__0_n_0\,
      Q => wr_ptr_reg_reg(5),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(6),
      Q => wr_ptr_reg_reg(6),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(7),
      Q => wr_ptr_reg_reg(7),
      R => output_axis_tvalid_reg_i_1_n_0
    );
\wr_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => m00_axis_aclk,
      CE => '1',
      D => \wr_ptr_reg[8]_i_1__0_n_0\,
      Q => wr_ptr_reg_reg(8),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adds_axis_adder_0_0_axis_adder_v1_0_S00_AXIS is
  port (
    DOADO : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DOPADOP : out STD_LOGIC_VECTOR ( 0 to 0 );
    WEBWE : out STD_LOGIC_VECTOR ( 0 to 0 );
    axis2pipe_tvalid : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    output_axis_tvalid_reg_reg_0 : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adds_axis_adder_0_0_axis_adder_v1_0_S00_AXIS : entity is "axis_adder_v1_0_S00_AXIS";
end adds_axis_adder_0_0_axis_adder_v1_0_S00_AXIS;

architecture STRUCTURE of adds_axis_adder_0_0_axis_adder_v1_0_S00_AXIS is
  signal \^webwe\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^axis2pipe_tvalid\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal empty : STD_LOGIC;
  signal empty_carry_i_1_n_0 : STD_LOGIC;
  signal empty_carry_i_2_n_0 : STD_LOGIC;
  signal empty_carry_i_3_n_0 : STD_LOGIC;
  signal empty_carry_n_2 : STD_LOGIC;
  signal empty_carry_n_3 : STD_LOGIC;
  signal mem_read_data_valid_reg : STD_LOGIC;
  signal mem_read_data_valid_reg_i_1_n_0 : STD_LOGIC;
  signal mem_reg_n_0 : STD_LOGIC;
  signal mem_reg_n_1 : STD_LOGIC;
  signal mem_reg_n_16 : STD_LOGIC;
  signal mem_reg_n_17 : STD_LOGIC;
  signal mem_reg_n_18 : STD_LOGIC;
  signal mem_reg_n_19 : STD_LOGIC;
  signal mem_reg_n_2 : STD_LOGIC;
  signal mem_reg_n_20 : STD_LOGIC;
  signal mem_reg_n_21 : STD_LOGIC;
  signal mem_reg_n_22 : STD_LOGIC;
  signal mem_reg_n_23 : STD_LOGIC;
  signal mem_reg_n_24 : STD_LOGIC;
  signal mem_reg_n_25 : STD_LOGIC;
  signal mem_reg_n_26 : STD_LOGIC;
  signal mem_reg_n_27 : STD_LOGIC;
  signal mem_reg_n_28 : STD_LOGIC;
  signal mem_reg_n_29 : STD_LOGIC;
  signal mem_reg_n_3 : STD_LOGIC;
  signal mem_reg_n_30 : STD_LOGIC;
  signal mem_reg_n_31 : STD_LOGIC;
  signal mem_reg_n_4 : STD_LOGIC;
  signal mem_reg_n_5 : STD_LOGIC;
  signal mem_reg_n_6 : STD_LOGIC;
  signal mem_reg_n_7 : STD_LOGIC;
  signal \output_axis_tvalid_reg_i_1__0_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal rd_addr_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rd_addr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \rd_addr_reg[7]_i_2__0_n_0\ : STD_LOGIC;
  signal rd_ptr_next : STD_LOGIC_VECTOR ( 8 to 8 );
  signal \rd_ptr_reg[8]_i_3__0_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \rd_ptr_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal read0_out : STD_LOGIC;
  signal s00_axis_tready_INST_0_i_1_n_0 : STD_LOGIC;
  signal s00_axis_tready_INST_0_i_2_n_0 : STD_LOGIC;
  signal s00_axis_tready_INST_0_i_3_n_0 : STD_LOGIC;
  signal wr_addr_reg : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \wr_addr_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \wr_addr_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal wr_ptr_next : STD_LOGIC_VECTOR ( 8 to 8 );
  signal wr_ptr_next_0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \wr_ptr_reg_reg_n_0_[0]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[1]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[2]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[3]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[4]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[5]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[6]\ : STD_LOGIC;
  signal \wr_ptr_reg_reg_n_0_[7]\ : STD_LOGIC;
  signal NLW_empty_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_empty_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mem_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 to 1 );
  signal NLW_mem_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of mem_read_data_valid_reg_i_1 : label is "soft_lutpair11";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of mem_reg : label is "p1_d32";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mem_reg : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of mem_reg : label is 8448;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of mem_reg : label is "mem";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of mem_reg : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of mem_reg : label is 511;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of mem_reg : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of mem_reg : label is 32;
  attribute SOFT_HLUTNM of \rd_addr_reg[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rd_addr_reg[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rd_addr_reg[3]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \rd_addr_reg[6]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \rd_ptr_reg[8]_i_4\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \wr_addr_reg[0]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \wr_addr_reg[1]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \wr_addr_reg[2]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \wr_addr_reg[3]_i_1__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \wr_addr_reg[4]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \wr_addr_reg[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \wr_addr_reg[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \wr_addr_reg[7]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \wr_addr_reg[7]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \wr_ptr_reg[8]_i_1\ : label is "soft_lutpair9";
begin
  WEBWE(0) <= \^webwe\(0);
  axis2pipe_tvalid <= \^axis2pipe_tvalid\;
empty_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => NLW_empty_carry_CO_UNCONNECTED(3),
      CO(2) => empty,
      CO(1) => empty_carry_n_2,
      CO(0) => empty_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_empty_carry_O_UNCONNECTED(3 downto 0),
      S(3) => '0',
      S(2) => empty_carry_i_1_n_0,
      S(1) => empty_carry_i_2_n_0,
      S(0) => empty_carry_i_3_n_0
    );
empty_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => p_0_in,
      I1 => p_1_in,
      I2 => \wr_ptr_reg_reg_n_0_[6]\,
      I3 => \rd_ptr_reg_reg_n_0_[6]\,
      I4 => \wr_ptr_reg_reg_n_0_[7]\,
      I5 => \rd_ptr_reg_reg_n_0_[7]\,
      O => empty_carry_i_1_n_0
    );
empty_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => \wr_ptr_reg_reg_n_0_[5]\,
      I2 => \wr_ptr_reg_reg_n_0_[4]\,
      I3 => \rd_ptr_reg_reg_n_0_[4]\,
      I4 => \wr_ptr_reg_reg_n_0_[3]\,
      I5 => \rd_ptr_reg_reg_n_0_[3]\,
      O => empty_carry_i_2_n_0
    );
empty_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => \wr_ptr_reg_reg_n_0_[1]\,
      I2 => \rd_ptr_reg_reg_n_0_[2]\,
      I3 => \wr_ptr_reg_reg_n_0_[2]\,
      I4 => \wr_ptr_reg_reg_n_0_[0]\,
      I5 => \rd_ptr_reg_reg_n_0_[0]\,
      O => empty_carry_i_3_n_0
    );
mem_read_data_valid_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"75"
    )
        port map (
      I0 => empty,
      I1 => output_axis_tvalid_reg_reg_0,
      I2 => mem_read_data_valid_reg,
      O => mem_read_data_valid_reg_i_1_n_0
    );
mem_read_data_valid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => mem_read_data_valid_reg_i_1_n_0,
      Q => mem_read_data_valid_reg,
      R => clear
    );
mem_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 1,
      DOB_REG => 1,
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "SDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "READ_FIRST",
      WRITE_WIDTH_A => 0,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(13) => '1',
      ADDRARDADDR(12 downto 5) => rd_addr_reg(7 downto 0),
      ADDRARDADDR(4 downto 0) => B"11111",
      ADDRBWRADDR(13) => '1',
      ADDRBWRADDR(12 downto 5) => wr_addr_reg(7 downto 0),
      ADDRBWRADDR(4 downto 0) => B"11111",
      CLKARDCLK => s00_axis_aclk,
      CLKBWRCLK => s00_axis_aclk,
      DIADI(15 downto 0) => s00_axis_tdata(15 downto 0),
      DIBDI(15 downto 0) => s00_axis_tdata(31 downto 16),
      DIPADIP(1) => '1',
      DIPADIP(0) => s00_axis_tlast,
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15) => mem_reg_n_0,
      DOADO(14) => mem_reg_n_1,
      DOADO(13) => mem_reg_n_2,
      DOADO(12) => mem_reg_n_3,
      DOADO(11) => mem_reg_n_4,
      DOADO(10) => mem_reg_n_5,
      DOADO(9) => mem_reg_n_6,
      DOADO(8) => mem_reg_n_7,
      DOADO(7 downto 0) => DOADO(7 downto 0),
      DOBDO(15) => mem_reg_n_16,
      DOBDO(14) => mem_reg_n_17,
      DOBDO(13) => mem_reg_n_18,
      DOBDO(12) => mem_reg_n_19,
      DOBDO(11) => mem_reg_n_20,
      DOBDO(10) => mem_reg_n_21,
      DOBDO(9) => mem_reg_n_22,
      DOBDO(8) => mem_reg_n_23,
      DOBDO(7) => mem_reg_n_24,
      DOBDO(6) => mem_reg_n_25,
      DOBDO(5) => mem_reg_n_26,
      DOBDO(4) => mem_reg_n_27,
      DOBDO(3) => mem_reg_n_28,
      DOBDO(2) => mem_reg_n_29,
      DOBDO(1) => mem_reg_n_30,
      DOBDO(0) => mem_reg_n_31,
      DOPADOP(1) => NLW_mem_reg_DOPADOP_UNCONNECTED(1),
      DOPADOP(0) => DOPADOP(0),
      DOPBDOP(1 downto 0) => NLW_mem_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => read0_out,
      ENBWREN => s00_axis_tvalid,
      REGCEAREGCE => output_axis_tvalid_reg_reg_0,
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3) => \^webwe\(0),
      WEBWE(2) => \^webwe\(0),
      WEBWE(1) => \^webwe\(0),
      WEBWE(0) => \^webwe\(0)
    );
mem_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => output_axis_tvalid_reg_reg_0,
      I2 => empty,
      O => read0_out
    );
\output_axis_tvalid_reg_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => output_axis_tvalid_reg_reg_0,
      I2 => \^axis2pipe_tvalid\,
      O => \output_axis_tvalid_reg_i_1__0_n_0\
    );
output_axis_tvalid_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \output_axis_tvalid_reg_i_1__0_n_0\,
      Q => \^axis2pipe_tvalid\,
      R => clear
    );
\rd_addr_reg[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9A99"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => empty,
      I2 => output_axis_tvalid_reg_reg_0,
      I3 => mem_read_data_valid_reg,
      O => \rd_addr_reg[0]_i_1_n_0\
    );
\rd_addr_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAA6A6"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => \rd_ptr_reg_reg_n_0_[0]\,
      I2 => empty,
      I3 => output_axis_tvalid_reg_reg_0,
      I4 => mem_read_data_valid_reg,
      O => \rd_addr_reg[1]_i_1_n_0\
    );
\rd_addr_reg[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA59AAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[2]\,
      I1 => mem_read_data_valid_reg,
      I2 => output_axis_tvalid_reg_reg_0,
      I3 => empty,
      I4 => \rd_ptr_reg_reg_n_0_[1]\,
      I5 => \rd_ptr_reg_reg_n_0_[0]\,
      O => \rd_addr_reg[2]_i_1__0_n_0\
    );
\rd_addr_reg[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[3]\,
      I1 => \rd_ptr_reg_reg_n_0_[2]\,
      I2 => \rd_ptr_reg_reg_n_0_[0]\,
      I3 => \rd_ptr_reg_reg_n_0_[1]\,
      I4 => read0_out,
      O => \rd_addr_reg[3]_i_1__0_n_0\
    );
\rd_addr_reg[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[4]\,
      I1 => \rd_ptr_reg_reg_n_0_[3]\,
      I2 => read0_out,
      I3 => \rd_ptr_reg_reg_n_0_[1]\,
      I4 => \rd_ptr_reg_reg_n_0_[0]\,
      I5 => \rd_ptr_reg_reg_n_0_[2]\,
      O => \rd_addr_reg[4]_i_1__0_n_0\
    );
\rd_addr_reg[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => \rd_ptr_reg_reg_n_0_[3]\,
      I2 => \rd_addr_reg[6]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[2]\,
      I4 => \rd_ptr_reg_reg_n_0_[4]\,
      O => \rd_addr_reg[5]_i_1_n_0\
    );
\rd_addr_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[6]\,
      I1 => \rd_ptr_reg_reg_n_0_[3]\,
      I2 => \rd_addr_reg[6]_i_2_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[2]\,
      I4 => \rd_ptr_reg_reg_n_0_[4]\,
      I5 => \rd_ptr_reg_reg_n_0_[5]\,
      O => \rd_addr_reg[6]_i_1_n_0\
    );
\rd_addr_reg[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7FFF7F7"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => \rd_ptr_reg_reg_n_0_[1]\,
      I2 => empty,
      I3 => output_axis_tvalid_reg_reg_0,
      I4 => mem_read_data_valid_reg,
      O => \rd_addr_reg[6]_i_2_n_0\
    );
\rd_addr_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[7]\,
      I1 => \rd_ptr_reg_reg_n_0_[5]\,
      I2 => \rd_ptr_reg_reg_n_0_[4]\,
      I3 => \rd_addr_reg[7]_i_2__0_n_0\,
      I4 => \rd_ptr_reg_reg_n_0_[3]\,
      I5 => \rd_ptr_reg_reg_n_0_[6]\,
      O => \rd_addr_reg[7]_i_1_n_0\
    );
\rd_addr_reg[7]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F2FFFFFFFFFFFFFF"
    )
        port map (
      I0 => mem_read_data_valid_reg,
      I1 => output_axis_tvalid_reg_reg_0,
      I2 => empty,
      I3 => \rd_ptr_reg_reg_n_0_[1]\,
      I4 => \rd_ptr_reg_reg_n_0_[0]\,
      I5 => \rd_ptr_reg_reg_n_0_[2]\,
      O => \rd_addr_reg[7]_i_2__0_n_0\
    );
\rd_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => rd_addr_reg(0),
      R => '0'
    );
\rd_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[1]_i_1_n_0\,
      Q => rd_addr_reg(1),
      R => '0'
    );
\rd_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[2]_i_1__0_n_0\,
      Q => rd_addr_reg(2),
      R => '0'
    );
\rd_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[3]_i_1__0_n_0\,
      Q => rd_addr_reg(3),
      R => '0'
    );
\rd_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[4]_i_1__0_n_0\,
      Q => rd_addr_reg(4),
      R => '0'
    );
\rd_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[5]_i_1_n_0\,
      Q => rd_addr_reg(5),
      R => '0'
    );
\rd_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[6]_i_1_n_0\,
      Q => rd_addr_reg(6),
      R => '0'
    );
\rd_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[7]_i_1_n_0\,
      Q => rd_addr_reg(7),
      R => '0'
    );
\rd_ptr_reg[8]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s00_axis_aresetn,
      O => clear
    );
\rd_ptr_reg[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => p_0_in,
      I1 => \rd_ptr_reg_reg_n_0_[6]\,
      I2 => \rd_ptr_reg[8]_i_3__0_n_0\,
      I3 => \rd_ptr_reg_reg_n_0_[4]\,
      I4 => \rd_ptr_reg_reg_n_0_[5]\,
      I5 => \rd_ptr_reg_reg_n_0_[7]\,
      O => rd_ptr_next(8)
    );
\rd_ptr_reg[8]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFDFDFFFFFFFF"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[2]\,
      I1 => \rd_ptr_reg[8]_i_4_n_0\,
      I2 => empty,
      I3 => output_axis_tvalid_reg_reg_0,
      I4 => mem_read_data_valid_reg,
      I5 => \rd_ptr_reg_reg_n_0_[3]\,
      O => \rd_ptr_reg[8]_i_3__0_n_0\
    );
\rd_ptr_reg[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[1]\,
      I1 => \rd_ptr_reg_reg_n_0_[0]\,
      O => \rd_ptr_reg[8]_i_4_n_0\
    );
\rd_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[0]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[0]\,
      R => clear
    );
\rd_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[1]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[1]\,
      R => clear
    );
\rd_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[2]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[2]\,
      R => clear
    );
\rd_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[3]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[3]\,
      R => clear
    );
\rd_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[4]_i_1__0_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[4]\,
      R => clear
    );
\rd_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[5]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[5]\,
      R => clear
    );
\rd_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[6]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[6]\,
      R => clear
    );
\rd_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \rd_addr_reg[7]_i_1_n_0\,
      Q => \rd_ptr_reg_reg_n_0_[7]\,
      R => clear
    );
\rd_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => rd_ptr_next(8),
      Q => p_0_in,
      R => clear
    );
s00_axis_tready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFDDF"
    )
        port map (
      I0 => s00_axis_tready_INST_0_i_1_n_0,
      I1 => s00_axis_tready_INST_0_i_2_n_0,
      I2 => p_0_in,
      I3 => p_1_in,
      I4 => s00_axis_tready_INST_0_i_3_n_0,
      O => \^webwe\(0)
    );
s00_axis_tready_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[5]\,
      I1 => \wr_ptr_reg_reg_n_0_[5]\,
      I2 => \wr_ptr_reg_reg_n_0_[4]\,
      I3 => \rd_ptr_reg_reg_n_0_[4]\,
      I4 => \wr_ptr_reg_reg_n_0_[3]\,
      I5 => \rd_ptr_reg_reg_n_0_[3]\,
      O => s00_axis_tready_INST_0_i_1_n_0
    );
s00_axis_tready_INST_0_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[7]\,
      I1 => \wr_ptr_reg_reg_n_0_[7]\,
      I2 => \rd_ptr_reg_reg_n_0_[6]\,
      I3 => \wr_ptr_reg_reg_n_0_[6]\,
      O => s00_axis_tready_INST_0_i_2_n_0
    );
s00_axis_tready_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FF6FFFFFFFF6FF6"
    )
        port map (
      I0 => \rd_ptr_reg_reg_n_0_[0]\,
      I1 => \wr_ptr_reg_reg_n_0_[0]\,
      I2 => \wr_ptr_reg_reg_n_0_[2]\,
      I3 => \rd_ptr_reg_reg_n_0_[2]\,
      I4 => \wr_ptr_reg_reg_n_0_[1]\,
      I5 => \rd_ptr_reg_reg_n_0_[1]\,
      O => s00_axis_tready_INST_0_i_3_n_0
    );
\wr_addr_reg[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[0]\,
      I1 => \wr_addr_reg[1]_i_2_n_0\,
      O => \wr_addr_reg[0]_i_1_n_0\
    );
\wr_addr_reg[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[1]\,
      I1 => \wr_addr_reg[1]_i_2_n_0\,
      I2 => \wr_ptr_reg_reg_n_0_[0]\,
      O => wr_ptr_next_0(1)
    );
\wr_addr_reg[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00140000FFFFFFFF"
    )
        port map (
      I0 => s00_axis_tready_INST_0_i_3_n_0,
      I1 => p_1_in,
      I2 => p_0_in,
      I3 => s00_axis_tready_INST_0_i_2_n_0,
      I4 => s00_axis_tready_INST_0_i_1_n_0,
      I5 => s00_axis_tvalid,
      O => \wr_addr_reg[1]_i_2_n_0\
    );
\wr_addr_reg[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[2]\,
      I1 => \wr_addr_reg[4]_i_2_n_0\,
      O => wr_ptr_next_0(2)
    );
\wr_addr_reg[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \wr_addr_reg[4]_i_2_n_0\,
      I1 => \wr_ptr_reg_reg_n_0_[2]\,
      I2 => \wr_ptr_reg_reg_n_0_[3]\,
      O => wr_ptr_next_0(3)
    );
\wr_addr_reg[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF20"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[2]\,
      I1 => \wr_addr_reg[4]_i_2_n_0\,
      I2 => \wr_ptr_reg_reg_n_0_[3]\,
      I3 => \wr_ptr_reg_reg_n_0_[4]\,
      O => wr_ptr_next_0(4)
    );
\wr_addr_reg[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5755FFFFFFFFFFFF"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[0]\,
      I1 => s00_axis_tready_INST_0_i_3_n_0,
      I2 => \wr_addr_reg[4]_i_3_n_0\,
      I3 => s00_axis_tready_INST_0_i_1_n_0,
      I4 => s00_axis_tvalid,
      I5 => \wr_ptr_reg_reg_n_0_[1]\,
      O => \wr_addr_reg[4]_i_2_n_0\
    );
\wr_addr_reg[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF6FF66FF6FFFF"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[6]\,
      I1 => \rd_ptr_reg_reg_n_0_[6]\,
      I2 => \wr_ptr_reg_reg_n_0_[7]\,
      I3 => \rd_ptr_reg_reg_n_0_[7]\,
      I4 => p_0_in,
      I5 => p_1_in,
      O => \wr_addr_reg[4]_i_3_n_0\
    );
\wr_addr_reg[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[5]\,
      I1 => \wr_addr_reg[7]_i_2_n_0\,
      O => \wr_addr_reg[5]_i_1_n_0\
    );
\wr_addr_reg[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[6]\,
      I1 => \wr_addr_reg[7]_i_2_n_0\,
      I2 => \wr_ptr_reg_reg_n_0_[5]\,
      O => wr_ptr_next_0(6)
    );
\wr_addr_reg[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[7]\,
      I1 => \wr_ptr_reg_reg_n_0_[5]\,
      I2 => \wr_addr_reg[7]_i_2_n_0\,
      I3 => \wr_ptr_reg_reg_n_0_[6]\,
      O => wr_ptr_next_0(7)
    );
\wr_addr_reg[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => \wr_ptr_reg_reg_n_0_[3]\,
      I1 => \wr_addr_reg[4]_i_2_n_0\,
      I2 => \wr_ptr_reg_reg_n_0_[2]\,
      I3 => \wr_ptr_reg_reg_n_0_[4]\,
      O => \wr_addr_reg[7]_i_2_n_0\
    );
\wr_addr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1_n_0\,
      Q => wr_addr_reg(0),
      R => '0'
    );
\wr_addr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(1),
      Q => wr_addr_reg(1),
      R => '0'
    );
\wr_addr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(2),
      Q => wr_addr_reg(2),
      R => '0'
    );
\wr_addr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(3),
      Q => wr_addr_reg(3),
      R => '0'
    );
\wr_addr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(4),
      Q => wr_addr_reg(4),
      R => '0'
    );
\wr_addr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[5]_i_1_n_0\,
      Q => wr_addr_reg(5),
      R => '0'
    );
\wr_addr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(6),
      Q => wr_addr_reg(6),
      R => '0'
    );
\wr_addr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(7),
      Q => wr_addr_reg(7),
      R => '0'
    );
\wr_ptr_reg[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A6AAAAAA"
    )
        port map (
      I0 => p_1_in,
      I1 => \wr_ptr_reg_reg_n_0_[6]\,
      I2 => \wr_addr_reg[7]_i_2_n_0\,
      I3 => \wr_ptr_reg_reg_n_0_[5]\,
      I4 => \wr_ptr_reg_reg_n_0_[7]\,
      O => wr_ptr_next(8)
    );
\wr_ptr_reg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[0]_i_1_n_0\,
      Q => \wr_ptr_reg_reg_n_0_[0]\,
      R => clear
    );
\wr_ptr_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(1),
      Q => \wr_ptr_reg_reg_n_0_[1]\,
      R => clear
    );
\wr_ptr_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(2),
      Q => \wr_ptr_reg_reg_n_0_[2]\,
      R => clear
    );
\wr_ptr_reg_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(3),
      Q => \wr_ptr_reg_reg_n_0_[3]\,
      R => clear
    );
\wr_ptr_reg_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(4),
      Q => \wr_ptr_reg_reg_n_0_[4]\,
      R => clear
    );
\wr_ptr_reg_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => \wr_addr_reg[5]_i_1_n_0\,
      Q => \wr_ptr_reg_reg_n_0_[5]\,
      R => clear
    );
\wr_ptr_reg_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(6),
      Q => \wr_ptr_reg_reg_n_0_[6]\,
      R => clear
    );
\wr_ptr_reg_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next_0(7),
      Q => \wr_ptr_reg_reg_n_0_[7]\,
      R => clear
    );
\wr_ptr_reg_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s00_axis_aclk,
      CE => '1',
      D => wr_ptr_next(8),
      Q => p_1_in,
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adds_axis_adder_0_0_axis_adder_v1_0 is
  port (
    m00_axis_tvalid : out STD_LOGIC;
    WEBWE : out STD_LOGIC_VECTOR ( 0 to 0 );
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of adds_axis_adder_0_0_axis_adder_v1_0 : entity is "axis_adder_v1_0";
end adds_axis_adder_0_0_axis_adder_v1_0;

architecture STRUCTURE of adds_axis_adder_0_0_axis_adder_v1_0 is
  signal axis2pipe_tlast : STD_LOGIC;
  signal axis2pipe_tvalid : STD_LOGIC;
  signal axis_adder_v1_0_M00_AXIS_inst_n_34 : STD_LOGIC;
  signal b : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal mem_read_data_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal pipe2axis_data : STD_LOGIC_VECTOR ( 4 downto 0 );
begin
axis_adder_inst: entity work.adds_axis_adder_0_0_axis_adder
     port map (
      DIADI(4 downto 0) => pipe2axis_data(4 downto 0),
      DOADO(7 downto 4) => b(3 downto 0),
      DOADO(3 downto 0) => mem_read_data_reg(3 downto 0)
    );
axis_adder_v1_0_M00_AXIS_inst: entity work.adds_axis_adder_0_0_axis_adder_v1_0_M00_AXIS
     port map (
      DIADI(4 downto 0) => pipe2axis_data(4 downto 0),
      DOPADOP(0) => axis2pipe_tlast,
      axis2pipe_tvalid => axis2pipe_tvalid,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      mem_reg_0 => axis_adder_v1_0_M00_AXIS_inst_n_34
    );
axis_adder_v1_0_S00_AXIS_inst: entity work.adds_axis_adder_0_0_axis_adder_v1_0_S00_AXIS
     port map (
      DOADO(7 downto 4) => b(3 downto 0),
      DOADO(3 downto 0) => mem_read_data_reg(3 downto 0),
      DOPADOP(0) => axis2pipe_tlast,
      WEBWE(0) => WEBWE(0),
      axis2pipe_tvalid => axis2pipe_tvalid,
      output_axis_tvalid_reg_reg_0 => axis_adder_v1_0_M00_AXIS_inst_n_34,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity adds_axis_adder_0_0 is
  port (
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axis_tstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axis_tlast : in STD_LOGIC;
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    s00_axis_aclk : in STD_LOGIC;
    s00_axis_aresetn : in STD_LOGIC;
    m00_axis_tdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m00_axis_tstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m00_axis_tlast : out STD_LOGIC;
    m00_axis_tvalid : out STD_LOGIC;
    m00_axis_tready : in STD_LOGIC;
    m00_axis_aclk : in STD_LOGIC;
    m00_axis_aresetn : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of adds_axis_adder_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of adds_axis_adder_0_0 : entity is "adds_axis_adder_0_0,axis_adder_v1_0,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of adds_axis_adder_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of adds_axis_adder_0_0 : entity is "axis_adder_v1_0,Vivado 2018.2";
end adds_axis_adder_0_0;

architecture STRUCTURE of adds_axis_adder_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 M00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m00_axis_aclk : signal is "XIL_INTERFACENAME M00_AXIS_CLK, ASSOCIATED_BUSIF M00_AXIS, ASSOCIATED_RESET m00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN adds_ps7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of m00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 M00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of m00_axis_aresetn : signal is "XIL_INTERFACENAME M00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TLAST";
  attribute X_INTERFACE_INFO of m00_axis_tready : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of m00_axis_tready : signal is "XIL_INTERFACENAME M00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN adds_ps7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TVALID";
  attribute X_INTERFACE_INFO of s00_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S00_AXIS_CLK CLK";
  attribute X_INTERFACE_PARAMETER of s00_axis_aclk : signal is "XIL_INTERFACENAME S00_AXIS_CLK, ASSOCIATED_BUSIF S00_AXIS, ASSOCIATED_RESET s00_axis_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN adds_ps7_0_0_FCLK_CLK0";
  attribute X_INTERFACE_INFO of s00_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S00_AXIS_RST RST";
  attribute X_INTERFACE_PARAMETER of s00_axis_aresetn : signal is "XIL_INTERFACENAME S00_AXIS_RST, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s00_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TLAST";
  attribute X_INTERFACE_INFO of s00_axis_tready : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TREADY";
  attribute X_INTERFACE_PARAMETER of s00_axis_tready : signal is "XIL_INTERFACENAME S00_AXIS, WIZ_DATA_WIDTH 32, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 1, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN adds_ps7_0_0_FCLK_CLK0, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of s00_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TVALID";
  attribute X_INTERFACE_INFO of m00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TDATA";
  attribute X_INTERFACE_INFO of m00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 M00_AXIS TSTRB";
  attribute X_INTERFACE_INFO of s00_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TDATA";
  attribute X_INTERFACE_INFO of s00_axis_tstrb : signal is "xilinx.com:interface:axis:1.0 S00_AXIS TSTRB";
begin
  m00_axis_tstrb(0) <= 'Z';
  m00_axis_tstrb(1) <= 'Z';
  m00_axis_tstrb(2) <= 'Z';
  m00_axis_tstrb(3) <= 'Z';
inst: entity work.adds_axis_adder_0_0_axis_adder_v1_0
     port map (
      WEBWE(0) => s00_axis_tready,
      m00_axis_aclk => m00_axis_aclk,
      m00_axis_aresetn => m00_axis_aresetn,
      m00_axis_tdata(31 downto 0) => m00_axis_tdata(31 downto 0),
      m00_axis_tlast => m00_axis_tlast,
      m00_axis_tready => m00_axis_tready,
      m00_axis_tvalid => m00_axis_tvalid,
      s00_axis_aclk => s00_axis_aclk,
      s00_axis_aresetn => s00_axis_aresetn,
      s00_axis_tdata(31 downto 0) => s00_axis_tdata(31 downto 0),
      s00_axis_tlast => s00_axis_tlast,
      s00_axis_tvalid => s00_axis_tvalid
    );
end STRUCTURE;
