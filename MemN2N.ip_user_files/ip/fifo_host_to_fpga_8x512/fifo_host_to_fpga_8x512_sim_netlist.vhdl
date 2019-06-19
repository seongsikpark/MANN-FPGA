-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Aug 21 15:53:04 2017
-- Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               D:/00_work/00_project/01_MemN2N/02_HW/MemN2N/MemN2N.runs/fifo_host_to_fpga_8x512_synth_1/fifo_host_to_fpga_8x512_sim_netlist.vhdl
-- Design      : fifo_host_to_fpga_8x512
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcvu095-ffva2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_builtin_prim is
  port (
    RST : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    WR_CLK : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 35 downto 0 );
    WR_EN : in STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    FULL : out STD_LOGIC;
    PROG_FULL : out STD_LOGIC;
    OVERFLOW : out STD_LOGIC;
    WR_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 );
    RD_CLK : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 35 downto 0 );
    EMPTY : out STD_LOGIC;
    PROG_EMPTY : out STD_LOGIC;
    UNDERFLOW : out STD_LOGIC;
    RD_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 );
    INJECTDBITERR : in STD_LOGIC;
    INJECTSBITERR : in STD_LOGIC;
    SBITERR : out STD_LOGIC;
    DBITERR : out STD_LOGIC;
    ECCPARITY : out STD_LOGIC_VECTOR ( 7 downto 0 );
    CASCADE_DIN : in STD_LOGIC_VECTOR ( 35 downto 0 );
    CASCADE_NEXT_RD_EN : in STD_LOGIC;
    CASCADE_PREV_EMPTY : in STD_LOGIC;
    CASCADE_DOUT : out STD_LOGIC_VECTOR ( 35 downto 0 );
    CASCADE_NEXT_EMPTY : out STD_LOGIC;
    CASCADE_PREV_RD_EN : out STD_LOGIC
  );
  attribute C_CASCADE_ORDER : string;
  attribute C_CASCADE_ORDER of fifo_host_to_fpga_8x512_builtin_prim : entity is "NONE";
  attribute C_CLOCK_DOMAINS : string;
  attribute C_CLOCK_DOMAINS of fifo_host_to_fpga_8x512_builtin_prim : entity is "INDEPENDENT";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_builtin_prim : entity is "000000000";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 8;
  attribute C_EN_ECC_PIPE : string;
  attribute C_EN_ECC_PIPE of fifo_host_to_fpga_8x512_builtin_prim : entity is "FALSE";
  attribute C_EN_ECC_READ : string;
  attribute C_EN_ECC_READ of fifo_host_to_fpga_8x512_builtin_prim : entity is "FALSE";
  attribute C_EN_ECC_WRITE : string;
  attribute C_EN_ECC_WRITE of fifo_host_to_fpga_8x512_builtin_prim : entity is "FALSE";
  attribute C_FWFT : string;
  attribute C_FWFT of fifo_host_to_fpga_8x512_builtin_prim : entity is "FALSE";
  attribute C_IS_ASYMMETRIC : integer;
  attribute C_IS_ASYMMETRIC of fifo_host_to_fpga_8x512_builtin_prim : entity is 0;
  attribute C_PRIM_FIFO36 : integer;
  attribute C_PRIM_FIFO36 of fifo_host_to_fpga_8x512_builtin_prim : entity is 0;
  attribute C_PRIM_WIDTH : integer;
  attribute C_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 36;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of fifo_host_to_fpga_8x512_builtin_prim : entity is 5;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of fifo_host_to_fpga_8x512_builtin_prim : entity is 511;
  attribute C_RDCOUNT_TYPE : string;
  attribute C_RDCOUNT_TYPE of fifo_host_to_fpga_8x512_builtin_prim : entity is "EXTENDED_DATACOUNT";
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 13;
  attribute C_RD_PRIM_WIDTH : integer;
  attribute C_RD_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 36;
  attribute C_READ_WIDTH : integer;
  attribute C_READ_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 36;
  attribute C_REGISTER_MODE : string;
  attribute C_REGISTER_MODE of fifo_host_to_fpga_8x512_builtin_prim : entity is "REGISTERED";
  attribute C_RSTREG_PRIORITY : string;
  attribute C_RSTREG_PRIORITY of fifo_host_to_fpga_8x512_builtin_prim : entity is "REGCE";
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_builtin_prim : entity is 1;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_builtin_prim : entity is 1;
  attribute C_WRCOUNT_TYPE : string;
  attribute C_WRCOUNT_TYPE of fifo_host_to_fpga_8x512_builtin_prim : entity is "EXTENDED_DATACOUNT";
  attribute C_WRITE_WIDTH : integer;
  attribute C_WRITE_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 36;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 13;
  attribute C_WR_PRIM_WIDTH : integer;
  attribute C_WR_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_prim : entity is 36;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_builtin_prim : entity is "builtin_prim";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_builtin_prim : entity is "yes";
end fifo_host_to_fpga_8x512_builtin_prim;

architecture STRUCTURE of fifo_host_to_fpga_8x512_builtin_prim is
  signal \<const0>\ : STD_LOGIC;
  signal \^dout\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \gf18e2_inst.sngfifo18e2_n_0\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_1\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_10\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_100\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_101\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_102\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_103\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_104\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_105\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_106\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_107\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_11\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_12\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_13\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_14\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_15\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_16\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_17\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_18\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_19\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_20\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_21\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_22\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_23\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_24\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_25\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_26\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_27\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_28\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_29\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_30\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_31\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_32\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_33\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_34\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_35\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_36\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_37\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_38\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_39\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_4\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_40\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_41\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_42\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_43\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_44\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_45\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_46\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_47\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_48\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_49\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_5\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_50\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_51\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_52\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_53\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_54\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_55\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_56\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_57\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_58\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_59\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_6\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_60\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_61\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_62\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_63\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_64\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_65\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_66\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_67\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_68\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_69\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_70\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_71\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_72\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_73\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_74\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_75\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_76\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_77\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_78\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_79\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_8\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_80\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_81\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_82\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_83\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_84\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_85\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_86\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_87\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_88\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_89\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_90\ : STD_LOGIC;
  signal \gf18e2_inst.sngfifo18e2_n_91\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \gf18e2_inst.sngfifo18e2\ : label is "PRIMITIVE";
begin
  CASCADE_DOUT(35) <= \<const0>\;
  CASCADE_DOUT(34) <= \<const0>\;
  CASCADE_DOUT(33) <= \<const0>\;
  CASCADE_DOUT(32) <= \<const0>\;
  CASCADE_DOUT(31) <= \<const0>\;
  CASCADE_DOUT(30) <= \<const0>\;
  CASCADE_DOUT(29) <= \<const0>\;
  CASCADE_DOUT(28) <= \<const0>\;
  CASCADE_DOUT(27) <= \<const0>\;
  CASCADE_DOUT(26) <= \<const0>\;
  CASCADE_DOUT(25) <= \<const0>\;
  CASCADE_DOUT(24) <= \<const0>\;
  CASCADE_DOUT(23) <= \<const0>\;
  CASCADE_DOUT(22) <= \<const0>\;
  CASCADE_DOUT(21) <= \<const0>\;
  CASCADE_DOUT(20) <= \<const0>\;
  CASCADE_DOUT(19) <= \<const0>\;
  CASCADE_DOUT(18) <= \<const0>\;
  CASCADE_DOUT(17) <= \<const0>\;
  CASCADE_DOUT(16) <= \<const0>\;
  CASCADE_DOUT(15) <= \<const0>\;
  CASCADE_DOUT(14) <= \<const0>\;
  CASCADE_DOUT(13) <= \<const0>\;
  CASCADE_DOUT(12) <= \<const0>\;
  CASCADE_DOUT(11) <= \<const0>\;
  CASCADE_DOUT(10) <= \<const0>\;
  CASCADE_DOUT(9) <= \<const0>\;
  CASCADE_DOUT(8) <= \<const0>\;
  CASCADE_DOUT(7) <= \<const0>\;
  CASCADE_DOUT(6) <= \<const0>\;
  CASCADE_DOUT(5) <= \<const0>\;
  CASCADE_DOUT(4) <= \<const0>\;
  CASCADE_DOUT(3) <= \<const0>\;
  CASCADE_DOUT(2) <= \<const0>\;
  CASCADE_DOUT(1) <= \<const0>\;
  CASCADE_DOUT(0) <= \<const0>\;
  CASCADE_NEXT_EMPTY <= \<const0>\;
  CASCADE_PREV_RD_EN <= \<const0>\;
  DBITERR <= \<const0>\;
  DOUT(35) <= \<const0>\;
  DOUT(34) <= \<const0>\;
  DOUT(33) <= \<const0>\;
  DOUT(32) <= \<const0>\;
  DOUT(31) <= \<const0>\;
  DOUT(30) <= \<const0>\;
  DOUT(29) <= \<const0>\;
  DOUT(28) <= \<const0>\;
  DOUT(27) <= \<const0>\;
  DOUT(26) <= \<const0>\;
  DOUT(25) <= \<const0>\;
  DOUT(24) <= \<const0>\;
  DOUT(23) <= \<const0>\;
  DOUT(22) <= \<const0>\;
  DOUT(21) <= \<const0>\;
  DOUT(20) <= \<const0>\;
  DOUT(19) <= \<const0>\;
  DOUT(18) <= \<const0>\;
  DOUT(17) <= \<const0>\;
  DOUT(16) <= \<const0>\;
  DOUT(15) <= \<const0>\;
  DOUT(14) <= \<const0>\;
  DOUT(13) <= \<const0>\;
  DOUT(12) <= \<const0>\;
  DOUT(11) <= \<const0>\;
  DOUT(10) <= \<const0>\;
  DOUT(9) <= \<const0>\;
  DOUT(8) <= \<const0>\;
  DOUT(7 downto 0) <= \^dout\(7 downto 0);
  ECCPARITY(7) <= \<const0>\;
  ECCPARITY(6) <= \<const0>\;
  ECCPARITY(5) <= \<const0>\;
  ECCPARITY(4) <= \<const0>\;
  ECCPARITY(3) <= \<const0>\;
  ECCPARITY(2) <= \<const0>\;
  ECCPARITY(1) <= \<const0>\;
  ECCPARITY(0) <= \<const0>\;
  OVERFLOW <= \<const0>\;
  PROG_EMPTY <= \<const0>\;
  PROG_FULL <= \<const0>\;
  RD_DATA_COUNT(12) <= \<const0>\;
  RD_DATA_COUNT(11) <= \<const0>\;
  RD_DATA_COUNT(10) <= \<const0>\;
  RD_DATA_COUNT(9) <= \<const0>\;
  RD_DATA_COUNT(8) <= \<const0>\;
  RD_DATA_COUNT(7) <= \<const0>\;
  RD_DATA_COUNT(6) <= \<const0>\;
  RD_DATA_COUNT(5) <= \<const0>\;
  RD_DATA_COUNT(4) <= \<const0>\;
  RD_DATA_COUNT(3) <= \<const0>\;
  RD_DATA_COUNT(2) <= \<const0>\;
  RD_DATA_COUNT(1) <= \<const0>\;
  RD_DATA_COUNT(0) <= \<const0>\;
  SBITERR <= \<const0>\;
  UNDERFLOW <= \<const0>\;
  WR_DATA_COUNT(12) <= \<const0>\;
  WR_DATA_COUNT(11) <= \<const0>\;
  WR_DATA_COUNT(10) <= \<const0>\;
  WR_DATA_COUNT(9) <= \<const0>\;
  WR_DATA_COUNT(8) <= \<const0>\;
  WR_DATA_COUNT(7) <= \<const0>\;
  WR_DATA_COUNT(6) <= \<const0>\;
  WR_DATA_COUNT(5) <= \<const0>\;
  WR_DATA_COUNT(4) <= \<const0>\;
  WR_DATA_COUNT(3) <= \<const0>\;
  WR_DATA_COUNT(2) <= \<const0>\;
  WR_DATA_COUNT(1) <= \<const0>\;
  WR_DATA_COUNT(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gf18e2_inst.sngfifo18e2\: unisim.vcomponents.FIFO18E2
    generic map(
      CASCADE_ORDER => "NONE",
      CLOCK_DOMAINS => "INDEPENDENT",
      FIRST_WORD_FALL_THROUGH => "FALSE",
      INIT => X"000000000",
      IS_RDCLK_INVERTED => '0',
      IS_RDEN_INVERTED => '0',
      IS_RSTREG_INVERTED => '0',
      IS_RST_INVERTED => '0',
      IS_WRCLK_INVERTED => '0',
      IS_WREN_INVERTED => '0',
      PROG_EMPTY_THRESH => 5,
      PROG_FULL_THRESH => 511,
      RDCOUNT_TYPE => "EXTENDED_DATACOUNT",
      READ_WIDTH => 36,
      REGISTER_MODE => "REGISTERED",
      RSTREG_PRIORITY => "REGCE",
      SLEEP_ASYNC => "FALSE",
      SRVAL => X"000000000",
      WRCOUNT_TYPE => "EXTENDED_DATACOUNT",
      WRITE_WIDTH => 36
    )
        port map (
      CASDIN(31 downto 0) => B"00000000000000000000000000000000",
      CASDINP(3 downto 0) => B"0000",
      CASDOMUX => '0',
      CASDOMUXEN => '1',
      CASDOUT(31) => \gf18e2_inst.sngfifo18e2_n_36\,
      CASDOUT(30) => \gf18e2_inst.sngfifo18e2_n_37\,
      CASDOUT(29) => \gf18e2_inst.sngfifo18e2_n_38\,
      CASDOUT(28) => \gf18e2_inst.sngfifo18e2_n_39\,
      CASDOUT(27) => \gf18e2_inst.sngfifo18e2_n_40\,
      CASDOUT(26) => \gf18e2_inst.sngfifo18e2_n_41\,
      CASDOUT(25) => \gf18e2_inst.sngfifo18e2_n_42\,
      CASDOUT(24) => \gf18e2_inst.sngfifo18e2_n_43\,
      CASDOUT(23) => \gf18e2_inst.sngfifo18e2_n_44\,
      CASDOUT(22) => \gf18e2_inst.sngfifo18e2_n_45\,
      CASDOUT(21) => \gf18e2_inst.sngfifo18e2_n_46\,
      CASDOUT(20) => \gf18e2_inst.sngfifo18e2_n_47\,
      CASDOUT(19) => \gf18e2_inst.sngfifo18e2_n_48\,
      CASDOUT(18) => \gf18e2_inst.sngfifo18e2_n_49\,
      CASDOUT(17) => \gf18e2_inst.sngfifo18e2_n_50\,
      CASDOUT(16) => \gf18e2_inst.sngfifo18e2_n_51\,
      CASDOUT(15) => \gf18e2_inst.sngfifo18e2_n_52\,
      CASDOUT(14) => \gf18e2_inst.sngfifo18e2_n_53\,
      CASDOUT(13) => \gf18e2_inst.sngfifo18e2_n_54\,
      CASDOUT(12) => \gf18e2_inst.sngfifo18e2_n_55\,
      CASDOUT(11) => \gf18e2_inst.sngfifo18e2_n_56\,
      CASDOUT(10) => \gf18e2_inst.sngfifo18e2_n_57\,
      CASDOUT(9) => \gf18e2_inst.sngfifo18e2_n_58\,
      CASDOUT(8) => \gf18e2_inst.sngfifo18e2_n_59\,
      CASDOUT(7) => \gf18e2_inst.sngfifo18e2_n_60\,
      CASDOUT(6) => \gf18e2_inst.sngfifo18e2_n_61\,
      CASDOUT(5) => \gf18e2_inst.sngfifo18e2_n_62\,
      CASDOUT(4) => \gf18e2_inst.sngfifo18e2_n_63\,
      CASDOUT(3) => \gf18e2_inst.sngfifo18e2_n_64\,
      CASDOUT(2) => \gf18e2_inst.sngfifo18e2_n_65\,
      CASDOUT(1) => \gf18e2_inst.sngfifo18e2_n_66\,
      CASDOUT(0) => \gf18e2_inst.sngfifo18e2_n_67\,
      CASDOUTP(3) => \gf18e2_inst.sngfifo18e2_n_100\,
      CASDOUTP(2) => \gf18e2_inst.sngfifo18e2_n_101\,
      CASDOUTP(1) => \gf18e2_inst.sngfifo18e2_n_102\,
      CASDOUTP(0) => \gf18e2_inst.sngfifo18e2_n_103\,
      CASNXTEMPTY => \gf18e2_inst.sngfifo18e2_n_0\,
      CASNXTRDEN => '0',
      CASOREGIMUX => '0',
      CASOREGIMUXEN => '1',
      CASPRVEMPTY => '0',
      CASPRVRDEN => \gf18e2_inst.sngfifo18e2_n_1\,
      DIN(31 downto 8) => B"000000000000000000000000",
      DIN(7 downto 0) => DIN(7 downto 0),
      DINP(3 downto 0) => B"0000",
      DOUT(31) => \gf18e2_inst.sngfifo18e2_n_68\,
      DOUT(30) => \gf18e2_inst.sngfifo18e2_n_69\,
      DOUT(29) => \gf18e2_inst.sngfifo18e2_n_70\,
      DOUT(28) => \gf18e2_inst.sngfifo18e2_n_71\,
      DOUT(27) => \gf18e2_inst.sngfifo18e2_n_72\,
      DOUT(26) => \gf18e2_inst.sngfifo18e2_n_73\,
      DOUT(25) => \gf18e2_inst.sngfifo18e2_n_74\,
      DOUT(24) => \gf18e2_inst.sngfifo18e2_n_75\,
      DOUT(23) => \gf18e2_inst.sngfifo18e2_n_76\,
      DOUT(22) => \gf18e2_inst.sngfifo18e2_n_77\,
      DOUT(21) => \gf18e2_inst.sngfifo18e2_n_78\,
      DOUT(20) => \gf18e2_inst.sngfifo18e2_n_79\,
      DOUT(19) => \gf18e2_inst.sngfifo18e2_n_80\,
      DOUT(18) => \gf18e2_inst.sngfifo18e2_n_81\,
      DOUT(17) => \gf18e2_inst.sngfifo18e2_n_82\,
      DOUT(16) => \gf18e2_inst.sngfifo18e2_n_83\,
      DOUT(15) => \gf18e2_inst.sngfifo18e2_n_84\,
      DOUT(14) => \gf18e2_inst.sngfifo18e2_n_85\,
      DOUT(13) => \gf18e2_inst.sngfifo18e2_n_86\,
      DOUT(12) => \gf18e2_inst.sngfifo18e2_n_87\,
      DOUT(11) => \gf18e2_inst.sngfifo18e2_n_88\,
      DOUT(10) => \gf18e2_inst.sngfifo18e2_n_89\,
      DOUT(9) => \gf18e2_inst.sngfifo18e2_n_90\,
      DOUT(8) => \gf18e2_inst.sngfifo18e2_n_91\,
      DOUT(7 downto 0) => \^dout\(7 downto 0),
      DOUTP(3) => \gf18e2_inst.sngfifo18e2_n_104\,
      DOUTP(2) => \gf18e2_inst.sngfifo18e2_n_105\,
      DOUTP(1) => \gf18e2_inst.sngfifo18e2_n_106\,
      DOUTP(0) => \gf18e2_inst.sngfifo18e2_n_107\,
      EMPTY => EMPTY,
      FULL => FULL,
      PROGEMPTY => \gf18e2_inst.sngfifo18e2_n_4\,
      PROGFULL => \gf18e2_inst.sngfifo18e2_n_5\,
      RDCLK => RD_CLK,
      RDCOUNT(12) => \gf18e2_inst.sngfifo18e2_n_10\,
      RDCOUNT(11) => \gf18e2_inst.sngfifo18e2_n_11\,
      RDCOUNT(10) => \gf18e2_inst.sngfifo18e2_n_12\,
      RDCOUNT(9) => \gf18e2_inst.sngfifo18e2_n_13\,
      RDCOUNT(8) => \gf18e2_inst.sngfifo18e2_n_14\,
      RDCOUNT(7) => \gf18e2_inst.sngfifo18e2_n_15\,
      RDCOUNT(6) => \gf18e2_inst.sngfifo18e2_n_16\,
      RDCOUNT(5) => \gf18e2_inst.sngfifo18e2_n_17\,
      RDCOUNT(4) => \gf18e2_inst.sngfifo18e2_n_18\,
      RDCOUNT(3) => \gf18e2_inst.sngfifo18e2_n_19\,
      RDCOUNT(2) => \gf18e2_inst.sngfifo18e2_n_20\,
      RDCOUNT(1) => \gf18e2_inst.sngfifo18e2_n_21\,
      RDCOUNT(0) => \gf18e2_inst.sngfifo18e2_n_22\,
      RDEN => RD_EN,
      RDERR => \gf18e2_inst.sngfifo18e2_n_6\,
      RDRSTBUSY => RDRSTBUSY,
      REGCE => RD_EN,
      RST => RST,
      RSTREG => RST,
      SLEEP => '0',
      WRCLK => WR_CLK,
      WRCOUNT(12) => \gf18e2_inst.sngfifo18e2_n_23\,
      WRCOUNT(11) => \gf18e2_inst.sngfifo18e2_n_24\,
      WRCOUNT(10) => \gf18e2_inst.sngfifo18e2_n_25\,
      WRCOUNT(9) => \gf18e2_inst.sngfifo18e2_n_26\,
      WRCOUNT(8) => \gf18e2_inst.sngfifo18e2_n_27\,
      WRCOUNT(7) => \gf18e2_inst.sngfifo18e2_n_28\,
      WRCOUNT(6) => \gf18e2_inst.sngfifo18e2_n_29\,
      WRCOUNT(5) => \gf18e2_inst.sngfifo18e2_n_30\,
      WRCOUNT(4) => \gf18e2_inst.sngfifo18e2_n_31\,
      WRCOUNT(3) => \gf18e2_inst.sngfifo18e2_n_32\,
      WRCOUNT(2) => \gf18e2_inst.sngfifo18e2_n_33\,
      WRCOUNT(1) => \gf18e2_inst.sngfifo18e2_n_34\,
      WRCOUNT(0) => \gf18e2_inst.sngfifo18e2_n_35\,
      WREN => WR_EN,
      WRERR => \gf18e2_inst.sngfifo18e2_n_8\,
      WRRSTBUSY => WRRSTBUSY
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_builtin_extdepth is
  port (
    WR_CLK : in STD_LOGIC;
    RD_CLK : in STD_LOGIC;
    INT_CLK : in STD_LOGIC;
    WR_RST : in STD_LOGIC;
    RD_RST : in STD_LOGIC;
    RST : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 35 downto 0 );
    WR_EN : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 35 downto 0 );
    FULL : out STD_LOGIC;
    EMPTY : out STD_LOGIC;
    OVERFLOW : out STD_LOGIC;
    UNDERFLOW : out STD_LOGIC;
    PROG_FULL : out STD_LOGIC;
    PROG_EMPTY : out STD_LOGIC;
    SBITERR : out STD_LOGIC;
    DBITERR : out STD_LOGIC;
    INJECTDBITERR : in STD_LOGIC;
    INJECTSBITERR : in STD_LOGIC;
    WR_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 );
    RD_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 );
    WRRSTBUSY : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC
  );
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is "000000000";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 8;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_builtin_extdepth : entity is "8SERIES";
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 6;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_IS_ASYMMETRIC : integer;
  attribute C_IS_ASYMMETRIC of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 1;
  attribute C_NUM_PRIM_DEEP : integer;
  attribute C_NUM_PRIM_DEEP of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 1;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 2;
  attribute C_PRIM_DEPTH : integer;
  attribute C_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 512;
  attribute C_PRIM_FIFO36 : integer;
  attribute C_PRIM_FIFO36 of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_PRIM_WIDTH : integer;
  attribute C_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 36;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 13;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 9;
  attribute C_RD_PRIM_DEPTH : integer;
  attribute C_RD_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 512;
  attribute C_RD_PRIM_WIDTH : integer;
  attribute C_RD_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 36;
  attribute C_READ_FASTER : integer;
  attribute C_READ_FASTER of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_READ_WIDTH : integer;
  attribute C_READ_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 36;
  attribute C_USE_BI_CASCADE : integer;
  attribute C_USE_BI_CASCADE of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 1;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO : integer;
  attribute C_USE_LOW_LATENCY_BI_FIFO of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 0;
  attribute C_WRITE_WIDTH : integer;
  attribute C_WRITE_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 36;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 13;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 9;
  attribute C_WR_PRIM_DEPTH : integer;
  attribute C_WR_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 512;
  attribute C_WR_PRIM_WIDTH : integer;
  attribute C_WR_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_extdepth : entity is 36;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_builtin_extdepth : entity is "builtin_extdepth";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_builtin_extdepth : entity is "yes";
end fifo_host_to_fpga_8x512_builtin_extdepth;

architecture STRUCTURE of fifo_host_to_fpga_8x512_builtin_extdepth is
  signal \<const0>\ : STD_LOGIC;
  signal \^dout\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal srst_qr : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute async_reg : string;
  attribute async_reg of srst_qr : signal is "true";
  attribute msgon : string;
  attribute msgon of srst_qr : signal is "true";
  signal \NLW_gonep.inst_prim_CASCADE_NEXT_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_CASCADE_PREV_RD_EN_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_PROG_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_PROG_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gonep.inst_prim_CASCADE_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 35 downto 0 );
  signal \NLW_gonep.inst_prim_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 35 downto 8 );
  signal \NLW_gonep.inst_prim_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gonep.inst_prim_RD_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \NLW_gonep.inst_prim_WR_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute C_CASCADE_ORDER : string;
  attribute C_CASCADE_ORDER of \gonep.inst_prim\ : label is "NONE";
  attribute C_CLOCK_DOMAINS : string;
  attribute C_CLOCK_DOMAINS of \gonep.inst_prim\ : label is "INDEPENDENT";
  attribute C_DIN_WIDTH of \gonep.inst_prim\ : label is 8;
  attribute C_DOUT_RST_VAL of \gonep.inst_prim\ : label is "000000000";
  attribute C_DOUT_WIDTH of \gonep.inst_prim\ : label is 8;
  attribute C_EN_ECC_PIPE : string;
  attribute C_EN_ECC_PIPE of \gonep.inst_prim\ : label is "FALSE";
  attribute C_EN_ECC_READ : string;
  attribute C_EN_ECC_READ of \gonep.inst_prim\ : label is "FALSE";
  attribute C_EN_ECC_WRITE : string;
  attribute C_EN_ECC_WRITE of \gonep.inst_prim\ : label is "FALSE";
  attribute C_FWFT : string;
  attribute C_FWFT of \gonep.inst_prim\ : label is "FALSE";
  attribute C_IS_ASYMMETRIC of \gonep.inst_prim\ : label is 0;
  attribute C_PRIM_FIFO36 of \gonep.inst_prim\ : label is 0;
  attribute C_PRIM_WIDTH of \gonep.inst_prim\ : label is 36;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of \gonep.inst_prim\ : label is 5;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of \gonep.inst_prim\ : label is 511;
  attribute C_RDCOUNT_TYPE : string;
  attribute C_RDCOUNT_TYPE of \gonep.inst_prim\ : label is "EXTENDED_DATACOUNT";
  attribute C_RD_DATA_COUNT_WIDTH of \gonep.inst_prim\ : label is 13;
  attribute C_RD_PRIM_WIDTH of \gonep.inst_prim\ : label is 36;
  attribute C_READ_WIDTH of \gonep.inst_prim\ : label is 36;
  attribute C_REGISTER_MODE : string;
  attribute C_REGISTER_MODE of \gonep.inst_prim\ : label is "REGISTERED";
  attribute C_RSTREG_PRIORITY : string;
  attribute C_RSTREG_PRIORITY of \gonep.inst_prim\ : label is "REGCE";
  attribute C_USE_DOUT_RST of \gonep.inst_prim\ : label is 1;
  attribute C_USE_EMBEDDED_REG of \gonep.inst_prim\ : label is 1;
  attribute C_WRCOUNT_TYPE : string;
  attribute C_WRCOUNT_TYPE of \gonep.inst_prim\ : label is "EXTENDED_DATACOUNT";
  attribute C_WRITE_WIDTH of \gonep.inst_prim\ : label is 36;
  attribute C_WR_DATA_COUNT_WIDTH of \gonep.inst_prim\ : label is 13;
  attribute C_WR_PRIM_WIDTH of \gonep.inst_prim\ : label is 36;
  attribute downgradeipidentifiedwarnings of \gonep.inst_prim\ : label is "yes";
begin
  DBITERR <= \<const0>\;
  DOUT(35) <= \<const0>\;
  DOUT(34) <= \<const0>\;
  DOUT(33) <= \<const0>\;
  DOUT(32) <= \<const0>\;
  DOUT(31) <= \<const0>\;
  DOUT(30) <= \<const0>\;
  DOUT(29) <= \<const0>\;
  DOUT(28) <= \<const0>\;
  DOUT(27) <= \<const0>\;
  DOUT(26) <= \<const0>\;
  DOUT(25) <= \<const0>\;
  DOUT(24) <= \<const0>\;
  DOUT(23) <= \<const0>\;
  DOUT(22) <= \<const0>\;
  DOUT(21) <= \<const0>\;
  DOUT(20) <= \<const0>\;
  DOUT(19) <= \<const0>\;
  DOUT(18) <= \<const0>\;
  DOUT(17) <= \<const0>\;
  DOUT(16) <= \<const0>\;
  DOUT(15) <= \<const0>\;
  DOUT(14) <= \<const0>\;
  DOUT(13) <= \<const0>\;
  DOUT(12) <= \<const0>\;
  DOUT(11) <= \<const0>\;
  DOUT(10) <= \<const0>\;
  DOUT(9) <= \<const0>\;
  DOUT(8) <= \<const0>\;
  DOUT(7 downto 0) <= \^dout\(7 downto 0);
  OVERFLOW <= \<const0>\;
  PROG_EMPTY <= \<const0>\;
  PROG_FULL <= \<const0>\;
  RD_DATA_COUNT(12) <= \<const0>\;
  RD_DATA_COUNT(11) <= \<const0>\;
  RD_DATA_COUNT(10) <= \<const0>\;
  RD_DATA_COUNT(9) <= \<const0>\;
  RD_DATA_COUNT(8) <= \<const0>\;
  RD_DATA_COUNT(7) <= \<const0>\;
  RD_DATA_COUNT(6) <= \<const0>\;
  RD_DATA_COUNT(5) <= \<const0>\;
  RD_DATA_COUNT(4) <= \<const0>\;
  RD_DATA_COUNT(3) <= \<const0>\;
  RD_DATA_COUNT(2) <= \<const0>\;
  RD_DATA_COUNT(1) <= \<const0>\;
  RD_DATA_COUNT(0) <= \<const0>\;
  SBITERR <= \<const0>\;
  UNDERFLOW <= \<const0>\;
  WR_DATA_COUNT(12) <= \<const0>\;
  WR_DATA_COUNT(11) <= \<const0>\;
  WR_DATA_COUNT(10) <= \<const0>\;
  WR_DATA_COUNT(9) <= \<const0>\;
  WR_DATA_COUNT(8) <= \<const0>\;
  WR_DATA_COUNT(7) <= \<const0>\;
  WR_DATA_COUNT(6) <= \<const0>\;
  WR_DATA_COUNT(5) <= \<const0>\;
  WR_DATA_COUNT(4) <= \<const0>\;
  WR_DATA_COUNT(3) <= \<const0>\;
  WR_DATA_COUNT(2) <= \<const0>\;
  WR_DATA_COUNT(1) <= \<const0>\;
  WR_DATA_COUNT(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gonep.inst_prim\: entity work.fifo_host_to_fpga_8x512_builtin_prim
     port map (
      CASCADE_DIN(35 downto 0) => B"000000000000000000000000000000000000",
      CASCADE_DOUT(35 downto 0) => \NLW_gonep.inst_prim_CASCADE_DOUT_UNCONNECTED\(35 downto 0),
      CASCADE_NEXT_EMPTY => \NLW_gonep.inst_prim_CASCADE_NEXT_EMPTY_UNCONNECTED\,
      CASCADE_NEXT_RD_EN => '0',
      CASCADE_PREV_EMPTY => '0',
      CASCADE_PREV_RD_EN => \NLW_gonep.inst_prim_CASCADE_PREV_RD_EN_UNCONNECTED\,
      DBITERR => \NLW_gonep.inst_prim_DBITERR_UNCONNECTED\,
      DIN(35 downto 8) => B"0000000000000000000000000000",
      DIN(7 downto 0) => DIN(7 downto 0),
      DOUT(35 downto 8) => \NLW_gonep.inst_prim_DOUT_UNCONNECTED\(35 downto 8),
      DOUT(7 downto 0) => \^dout\(7 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gonep.inst_prim_ECCPARITY_UNCONNECTED\(7 downto 0),
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      OVERFLOW => \NLW_gonep.inst_prim_OVERFLOW_UNCONNECTED\,
      PROG_EMPTY => \NLW_gonep.inst_prim_PROG_EMPTY_UNCONNECTED\,
      PROG_FULL => \NLW_gonep.inst_prim_PROG_FULL_UNCONNECTED\,
      RDRSTBUSY => RDRSTBUSY,
      RD_CLK => RD_CLK,
      RD_DATA_COUNT(12 downto 0) => \NLW_gonep.inst_prim_RD_DATA_COUNT_UNCONNECTED\(12 downto 0),
      RD_EN => RD_EN,
      RST => RST,
      SBITERR => \NLW_gonep.inst_prim_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      UNDERFLOW => \NLW_gonep.inst_prim_UNDERFLOW_UNCONNECTED\,
      WRRSTBUSY => WRRSTBUSY,
      WR_CLK => WR_CLK,
      WR_DATA_COUNT(12 downto 0) => \NLW_gonep.inst_prim_WR_DATA_COUNT_UNCONNECTED\(12 downto 0),
      WR_EN => WR_EN
    );
i_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(1)
    );
i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => '1',
      O => srst_qr(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_builtin_top is
  port (
    WR_CLK : in STD_LOGIC;
    RD_CLK : in STD_LOGIC;
    INT_CLK : in STD_LOGIC;
    RD_RST : in STD_LOGIC;
    WR_RST : in STD_LOGIC;
    RST : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    WR_EN : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FULL : out STD_LOGIC;
    EMPTY : out STD_LOGIC;
    OVERFLOW : out STD_LOGIC;
    UNDERFLOW : out STD_LOGIC;
    PROG_FULL : out STD_LOGIC;
    PROG_EMPTY : out STD_LOGIC;
    SBITERR : out STD_LOGIC;
    DBITERR : out STD_LOGIC;
    WR_ACK : out STD_LOGIC;
    VALID : out STD_LOGIC;
    INJECTDBITERR : in STD_LOGIC;
    INJECTSBITERR : in STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WR_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 );
    RD_DATA_COUNT : out STD_LOGIC_VECTOR ( 12 downto 0 )
  );
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 8;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_builtin_top : entity is "8SERIES";
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_builtin_top : entity is 6;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_NUM_PRIM_DEEP : integer;
  attribute C_NUM_PRIM_DEEP of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_NUM_PRIM_WIDE : integer;
  attribute C_NUM_PRIM_WIDE of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_builtin_top : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_PRIM_DEPTH : integer;
  attribute C_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_top : entity is 512;
  attribute C_PRIM_FIFO36 : integer;
  attribute C_PRIM_FIFO36 of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_host_to_fpga_8x512_builtin_top : entity is "512x36";
  attribute C_PRIM_WIDTH : integer;
  attribute C_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 36;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_builtin_top : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 13;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_host_to_fpga_8x512_builtin_top : entity is 512;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 9;
  attribute C_RD_PRIM_DEPTH : integer;
  attribute C_RD_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_top : entity is 512;
  attribute C_RD_PRIM_WIDTH : integer;
  attribute C_RD_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 36;
  attribute C_READ_FASTER : integer;
  attribute C_READ_FASTER of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_builtin_top : entity is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO : integer;
  attribute C_USE_LOW_LATENCY_BI_FIFO of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_host_to_fpga_8x512_builtin_top : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 13;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_host_to_fpga_8x512_builtin_top : entity is 512;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 9;
  attribute C_WR_PRIM_DEPTH : integer;
  attribute C_WR_PRIM_DEPTH of fifo_host_to_fpga_8x512_builtin_top : entity is 512;
  attribute C_WR_PRIM_WIDTH : integer;
  attribute C_WR_PRIM_WIDTH of fifo_host_to_fpga_8x512_builtin_top : entity is 36;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_builtin_top : entity is "builtin_top";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_builtin_top : entity is "yes";
end fifo_host_to_fpga_8x512_builtin_top;

architecture STRUCTURE of fifo_host_to_fpga_8x512_builtin_top is
  signal \<const0>\ : STD_LOGIC;
  signal \^empty\ : STD_LOGIC;
  signal \gv.gv3.VALID_i_1_n_0\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_DOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 35 downto 8 );
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_RD_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \NLW_rst_val_sym.gextw_sym[1].inst_extd_WR_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute C_COMMON_CLOCK of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_DIN_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 8;
  attribute C_DOUT_RST_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is "000000000";
  attribute C_DOUT_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 8;
  attribute C_FAMILY of \rst_val_sym.gextw_sym[1].inst_extd\ : label is "8SERIES";
  attribute C_HAS_INT_CLK of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_IMPLEMENTATION_TYPE of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 6;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_IS_ASYMMETRIC : integer;
  attribute C_IS_ASYMMETRIC of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_MSGON_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 1;
  attribute C_NUM_PRIM_DEEP of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 1;
  attribute C_PRELOAD_LATENCY of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 2;
  attribute C_PRIM_DEPTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 512;
  attribute C_PRIM_FIFO36 of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_PRIM_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 36;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 6;
  attribute C_PROG_EMPTY_TYPE of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 510;
  attribute C_PROG_FULL_TYPE of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 13;
  attribute C_RD_PNTR_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 9;
  attribute C_RD_PRIM_DEPTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 512;
  attribute C_RD_PRIM_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 36;
  attribute C_READ_FASTER of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_READ_WIDTH : integer;
  attribute C_READ_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 36;
  attribute C_USE_BI_CASCADE : integer;
  attribute C_USE_BI_CASCADE of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 1;
  attribute C_USE_DOUT_RST of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 1;
  attribute C_USE_ECC of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_USE_EMBEDDED_REG of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_USE_PIPELINE_REG of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 0;
  attribute C_WRITE_WIDTH : integer;
  attribute C_WRITE_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 36;
  attribute C_WR_DATA_COUNT_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 13;
  attribute C_WR_PNTR_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 9;
  attribute C_WR_PRIM_DEPTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 512;
  attribute C_WR_PRIM_WIDTH of \rst_val_sym.gextw_sym[1].inst_extd\ : label is 36;
  attribute downgradeipidentifiedwarnings of \rst_val_sym.gextw_sym[1].inst_extd\ : label is "yes";
begin
  DBITERR <= \<const0>\;
  EMPTY <= \^empty\;
  OVERFLOW <= \<const0>\;
  PROG_EMPTY <= \<const0>\;
  PROG_FULL <= \<const0>\;
  RD_DATA_COUNT(12) <= \<const0>\;
  RD_DATA_COUNT(11) <= \<const0>\;
  RD_DATA_COUNT(10) <= \<const0>\;
  RD_DATA_COUNT(9) <= \<const0>\;
  RD_DATA_COUNT(8) <= \<const0>\;
  RD_DATA_COUNT(7) <= \<const0>\;
  RD_DATA_COUNT(6) <= \<const0>\;
  RD_DATA_COUNT(5) <= \<const0>\;
  RD_DATA_COUNT(4) <= \<const0>\;
  RD_DATA_COUNT(3) <= \<const0>\;
  RD_DATA_COUNT(2) <= \<const0>\;
  RD_DATA_COUNT(1) <= \<const0>\;
  RD_DATA_COUNT(0) <= \<const0>\;
  SBITERR <= \<const0>\;
  UNDERFLOW <= \<const0>\;
  WR_ACK <= \<const0>\;
  WR_DATA_COUNT(12) <= \<const0>\;
  WR_DATA_COUNT(11) <= \<const0>\;
  WR_DATA_COUNT(10) <= \<const0>\;
  WR_DATA_COUNT(9) <= \<const0>\;
  WR_DATA_COUNT(8) <= \<const0>\;
  WR_DATA_COUNT(7) <= \<const0>\;
  WR_DATA_COUNT(6) <= \<const0>\;
  WR_DATA_COUNT(5) <= \<const0>\;
  WR_DATA_COUNT(4) <= \<const0>\;
  WR_DATA_COUNT(3) <= \<const0>\;
  WR_DATA_COUNT(2) <= \<const0>\;
  WR_DATA_COUNT(1) <= \<const0>\;
  WR_DATA_COUNT(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gv.gv3.VALID_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => RD_EN,
      I1 => \^empty\,
      O => \gv.gv3.VALID_i_1_n_0\
    );
\gv.gv3.VALID_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => RD_CLK,
      CE => '1',
      D => \gv.gv3.VALID_i_1_n_0\,
      Q => VALID,
      R => '0'
    );
\rst_val_sym.gextw_sym[1].inst_extd\: entity work.fifo_host_to_fpga_8x512_builtin_extdepth
     port map (
      DBITERR => \NLW_rst_val_sym.gextw_sym[1].inst_extd_DBITERR_UNCONNECTED\,
      DIN(35 downto 8) => B"0000000000000000000000000000",
      DIN(7 downto 0) => DIN(7 downto 0),
      DOUT(35 downto 8) => \NLW_rst_val_sym.gextw_sym[1].inst_extd_DOUT_UNCONNECTED\(35 downto 8),
      DOUT(7 downto 0) => DOUT(7 downto 0),
      EMPTY => \^empty\,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      INT_CLK => '0',
      OVERFLOW => \NLW_rst_val_sym.gextw_sym[1].inst_extd_OVERFLOW_UNCONNECTED\,
      PROG_EMPTY => \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_EMPTY_UNCONNECTED\,
      PROG_FULL => \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_FULL_UNCONNECTED\,
      RDRSTBUSY => RDRSTBUSY,
      RD_CLK => RD_CLK,
      RD_DATA_COUNT(12 downto 0) => \NLW_rst_val_sym.gextw_sym[1].inst_extd_RD_DATA_COUNT_UNCONNECTED\(12 downto 0),
      RD_EN => RD_EN,
      RD_RST => '0',
      RST => RST,
      SBITERR => \NLW_rst_val_sym.gextw_sym[1].inst_extd_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      UNDERFLOW => \NLW_rst_val_sym.gextw_sym[1].inst_extd_UNDERFLOW_UNCONNECTED\,
      WRRSTBUSY => WRRSTBUSY,
      WR_CLK => WR_CLK,
      WR_DATA_COUNT(12 downto 0) => \NLW_rst_val_sym.gextw_sym[1].inst_extd_WR_DATA_COUNT_UNCONNECTED\(12 downto 0),
      WR_EN => WR_EN,
      WR_RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin is
  port (
    CLK : in STD_LOGIC;
    WR_CLK : in STD_LOGIC;
    RD_CLK : in STD_LOGIC;
    INT_CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    WR_EN : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    PROG_FULL_THRESH : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL_THRESH_ASSERT : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL_THRESH_NEGATE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_EMPTY_THRESH : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_EMPTY_THRESH_ASSERT : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_EMPTY_THRESH_NEGATE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    INJECTDBITERR : in STD_LOGIC;
    INJECTSBITERR : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FULL : out STD_LOGIC;
    EMPTY : out STD_LOGIC;
    ALMOST_FULL : out STD_LOGIC;
    ALMOST_EMPTY : out STD_LOGIC;
    WR_ACK : out STD_LOGIC;
    VALID : out STD_LOGIC;
    OVERFLOW : out STD_LOGIC;
    UNDERFLOW : out STD_LOGIC;
    PROG_FULL : out STD_LOGIC;
    PROG_EMPTY : out STD_LOGIC;
    SBITERR : out STD_LOGIC;
    DBITERR : out STD_LOGIC;
    WRRSTBUSY : out STD_LOGIC;
    RDRSTBUSY : out STD_LOGIC;
    WR_DATA_COUNT : out STD_LOGIC_VECTOR ( 8 downto 0 );
    RD_DATA_COUNT : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 8;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is "virtexu";
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 6;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_RATIO_DEPTH_RD : integer;
  attribute C_RATIO_DEPTH_RD of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_RATIO_DEPTH_WR : integer;
  attribute C_RATIO_DEPTH_WR of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 50;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 9;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO : integer;
  attribute C_USE_LOW_LATENCY_BI_FIFO of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 512;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is 9;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is "fifo_generator_v13_1_1_builtin";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin : entity is "yes";
end fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin;

architecture STRUCTURE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin is
  signal \<const0>\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_PROG_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_PROG_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_WR_ACK_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_v8_fifo.fblk_RD_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \NLW_v8_fifo.fblk_WR_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 12 downto 0 );
  attribute C_COMMON_CLOCK of \v8_fifo.fblk\ : label is 0;
  attribute C_DIN_WIDTH of \v8_fifo.fblk\ : label is 8;
  attribute C_DOUT_RST_VAL of \v8_fifo.fblk\ : label is "0";
  attribute C_DOUT_WIDTH of \v8_fifo.fblk\ : label is 8;
  attribute C_FAMILY of \v8_fifo.fblk\ : label is "8SERIES";
  attribute C_HAS_INT_CLK of \v8_fifo.fblk\ : label is 0;
  attribute C_HAS_OVERFLOW of \v8_fifo.fblk\ : label is 1;
  attribute C_HAS_UNDERFLOW of \v8_fifo.fblk\ : label is 1;
  attribute C_HAS_VALID of \v8_fifo.fblk\ : label is 1;
  attribute C_HAS_WR_ACK of \v8_fifo.fblk\ : label is 1;
  attribute C_IMPLEMENTATION_TYPE of \v8_fifo.fblk\ : label is 6;
  attribute C_MSGON_VAL of \v8_fifo.fblk\ : label is 1;
  attribute C_NUM_PRIM_DEEP : integer;
  attribute C_NUM_PRIM_DEEP of \v8_fifo.fblk\ : label is 1;
  attribute C_NUM_PRIM_WIDE : integer;
  attribute C_NUM_PRIM_WIDE of \v8_fifo.fblk\ : label is 1;
  attribute C_OVERFLOW_LOW of \v8_fifo.fblk\ : label is 0;
  attribute C_PRELOAD_LATENCY of \v8_fifo.fblk\ : label is 2;
  attribute C_PRELOAD_REGS of \v8_fifo.fblk\ : label is 1;
  attribute C_PRIM_DEPTH : integer;
  attribute C_PRIM_DEPTH of \v8_fifo.fblk\ : label is 512;
  attribute C_PRIM_FIFO36 : integer;
  attribute C_PRIM_FIFO36 of \v8_fifo.fblk\ : label is 0;
  attribute C_PRIM_FIFO_TYPE of \v8_fifo.fblk\ : label is "512x36";
  attribute C_PRIM_WIDTH : integer;
  attribute C_PRIM_WIDTH of \v8_fifo.fblk\ : label is 36;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \v8_fifo.fblk\ : label is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \v8_fifo.fblk\ : label is 6;
  attribute C_PROG_EMPTY_TYPE of \v8_fifo.fblk\ : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \v8_fifo.fblk\ : label is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \v8_fifo.fblk\ : label is 510;
  attribute C_PROG_FULL_TYPE of \v8_fifo.fblk\ : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH of \v8_fifo.fblk\ : label is 13;
  attribute C_RD_DEPTH of \v8_fifo.fblk\ : label is 512;
  attribute C_RD_PNTR_WIDTH of \v8_fifo.fblk\ : label is 9;
  attribute C_RD_PRIM_DEPTH : integer;
  attribute C_RD_PRIM_DEPTH of \v8_fifo.fblk\ : label is 512;
  attribute C_RD_PRIM_WIDTH : integer;
  attribute C_RD_PRIM_WIDTH of \v8_fifo.fblk\ : label is 36;
  attribute C_READ_FASTER : integer;
  attribute C_READ_FASTER of \v8_fifo.fblk\ : label is 0;
  attribute C_UNDERFLOW_LOW of \v8_fifo.fblk\ : label is 0;
  attribute C_USE_DOUT_RST of \v8_fifo.fblk\ : label is 1;
  attribute C_USE_ECC of \v8_fifo.fblk\ : label is 0;
  attribute C_USE_EMBEDDED_REG of \v8_fifo.fblk\ : label is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO of \v8_fifo.fblk\ : label is 0;
  attribute C_USE_PIPELINE_REG of \v8_fifo.fblk\ : label is 0;
  attribute C_VALID_LOW of \v8_fifo.fblk\ : label is 0;
  attribute C_WR_ACK_LOW of \v8_fifo.fblk\ : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH of \v8_fifo.fblk\ : label is 13;
  attribute C_WR_DEPTH of \v8_fifo.fblk\ : label is 512;
  attribute C_WR_PNTR_WIDTH of \v8_fifo.fblk\ : label is 9;
  attribute C_WR_PRIM_DEPTH : integer;
  attribute C_WR_PRIM_DEPTH of \v8_fifo.fblk\ : label is 512;
  attribute C_WR_PRIM_WIDTH : integer;
  attribute C_WR_PRIM_WIDTH of \v8_fifo.fblk\ : label is 36;
  attribute downgradeipidentifiedwarnings of \v8_fifo.fblk\ : label is "yes";
begin
  ALMOST_EMPTY <= \<const0>\;
  ALMOST_FULL <= \<const0>\;
  DBITERR <= \<const0>\;
  OVERFLOW <= \<const0>\;
  PROG_EMPTY <= \<const0>\;
  PROG_FULL <= \<const0>\;
  RD_DATA_COUNT(8) <= \<const0>\;
  RD_DATA_COUNT(7) <= \<const0>\;
  RD_DATA_COUNT(6) <= \<const0>\;
  RD_DATA_COUNT(5) <= \<const0>\;
  RD_DATA_COUNT(4) <= \<const0>\;
  RD_DATA_COUNT(3) <= \<const0>\;
  RD_DATA_COUNT(2) <= \<const0>\;
  RD_DATA_COUNT(1) <= \<const0>\;
  RD_DATA_COUNT(0) <= \<const0>\;
  SBITERR <= \<const0>\;
  UNDERFLOW <= \<const0>\;
  WR_ACK <= \<const0>\;
  WR_DATA_COUNT(8) <= \<const0>\;
  WR_DATA_COUNT(7) <= \<const0>\;
  WR_DATA_COUNT(6) <= \<const0>\;
  WR_DATA_COUNT(5) <= \<const0>\;
  WR_DATA_COUNT(4) <= \<const0>\;
  WR_DATA_COUNT(3) <= \<const0>\;
  WR_DATA_COUNT(2) <= \<const0>\;
  WR_DATA_COUNT(1) <= \<const0>\;
  WR_DATA_COUNT(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\v8_fifo.fblk\: entity work.fifo_host_to_fpga_8x512_builtin_top
     port map (
      DBITERR => \NLW_v8_fifo.fblk_DBITERR_UNCONNECTED\,
      DIN(7 downto 0) => DIN(7 downto 0),
      DOUT(7 downto 0) => DOUT(7 downto 0),
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      INT_CLK => '0',
      OVERFLOW => \NLW_v8_fifo.fblk_OVERFLOW_UNCONNECTED\,
      PROG_EMPTY => \NLW_v8_fifo.fblk_PROG_EMPTY_UNCONNECTED\,
      PROG_FULL => \NLW_v8_fifo.fblk_PROG_FULL_UNCONNECTED\,
      RDRSTBUSY => RDRSTBUSY,
      RD_CLK => RD_CLK,
      RD_DATA_COUNT(12 downto 0) => \NLW_v8_fifo.fblk_RD_DATA_COUNT_UNCONNECTED\(12 downto 0),
      RD_EN => RD_EN,
      RD_RST => '0',
      RST => RST,
      SBITERR => \NLW_v8_fifo.fblk_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      UNDERFLOW => \NLW_v8_fifo.fblk_UNDERFLOW_UNCONNECTED\,
      VALID => VALID,
      WRRSTBUSY => WRRSTBUSY,
      WR_ACK => \NLW_v8_fifo.fblk_WR_ACK_UNCONNECTED\,
      WR_CLK => WR_CLK,
      WR_DATA_COUNT(12 downto 0) => \NLW_v8_fifo.fblk_WR_DATA_COUNT_UNCONNECTED\(12 downto 0),
      WR_EN => WR_EN,
      WR_RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_fifo_generator_top is
  port (
    BACKUP : in STD_LOGIC;
    BACKUP_MARKER : in STD_LOGIC;
    INT_CLK : in STD_LOGIC;
    SLEEP : in STD_LOGIC;
    CLK : in STD_LOGIC;
    WR_CLK : in STD_LOGIC;
    RD_CLK : in STD_LOGIC;
    RST : in STD_LOGIC;
    SRST : in STD_LOGIC;
    WR_RST : in STD_LOGIC;
    RD_RST : in STD_LOGIC;
    DIN : in STD_LOGIC_VECTOR ( 7 downto 0 );
    WR_EN : in STD_LOGIC;
    RD_EN : in STD_LOGIC;
    PROG_EMPTY_THRESH : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_EMPTY_THRESH_ASSERT : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_EMPTY_THRESH_NEGATE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL_THRESH : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL_THRESH_ASSERT : in STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL_THRESH_NEGATE : in STD_LOGIC_VECTOR ( 8 downto 0 );
    INJECTDBITERR : in STD_LOGIC;
    INJECTSBITERR : in STD_LOGIC;
    INPUT_CE : in STD_LOGIC;
    OUTPUT_CE : in STD_LOGIC;
    END_OF_PACKET : in STD_LOGIC;
    DOUT : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FULL : out STD_LOGIC;
    ALMOST_FULL : out STD_LOGIC;
    WR_ACK : out STD_LOGIC;
    OVERFLOW : out STD_LOGIC;
    EMPTY : out STD_LOGIC;
    ALMOST_EMPTY : out STD_LOGIC;
    VALID : out STD_LOGIC;
    UNDERFLOW : out STD_LOGIC;
    DATA_COUNT : out STD_LOGIC_VECTOR ( 8 downto 0 );
    RD_DATA_COUNT : out STD_LOGIC_VECTOR ( 8 downto 0 );
    WR_DATA_COUNT : out STD_LOGIC_VECTOR ( 8 downto 0 );
    PROG_FULL : out STD_LOGIC;
    PROG_EMPTY : out STD_LOGIC;
    SBITERR : out STD_LOGIC;
    DBITERR : out STD_LOGIC;
    WR_RST_BUSY : out STD_LOGIC;
    RD_RST_BUSY : out STD_LOGIC
  );
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_BYTE_STRB_WIDTH : integer;
  attribute C_BYTE_STRB_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 8;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 8;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "virtexu";
  attribute C_FIFO_TYPE : integer;
  attribute C_FIFO_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 6;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 50;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 9;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_INPUT_CE : integer;
  attribute C_USE_INPUT_CE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_OUTPUT_CE : integer;
  attribute C_USE_OUTPUT_CE of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_USE_SYNC_CLK : integer;
  attribute C_USE_SYNC_CLK of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 512;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 9;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_top : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "fifo_generator_top";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_fifo_generator_top : entity is "yes";
end fifo_host_to_fpga_8x512_fifo_generator_top;

architecture STRUCTURE of fifo_host_to_fpga_8x512_fifo_generator_top is
  signal \<const0>\ : STD_LOGIC;
  signal \NLW_gbi.bi_ALMOST_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_ALMOST_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_PROG_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_PROG_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_WR_ACK_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gbi.bi_RD_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gbi.bi_WR_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute C_COMMON_CLOCK of \gbi.bi\ : label is 0;
  attribute C_DIN_WIDTH of \gbi.bi\ : label is 8;
  attribute C_DOUT_RST_VAL of \gbi.bi\ : label is "0";
  attribute C_DOUT_WIDTH of \gbi.bi\ : label is 8;
  attribute C_ENABLE_RST_SYNC of \gbi.bi\ : label is 1;
  attribute C_ERROR_INJECTION_TYPE of \gbi.bi\ : label is 0;
  attribute C_FAMILY of \gbi.bi\ : label is "virtexu";
  attribute C_HAS_ALMOST_EMPTY of \gbi.bi\ : label is 0;
  attribute C_HAS_ALMOST_FULL of \gbi.bi\ : label is 0;
  attribute C_HAS_DATA_COUNT of \gbi.bi\ : label is 0;
  attribute C_HAS_INT_CLK of \gbi.bi\ : label is 0;
  attribute C_HAS_OVERFLOW of \gbi.bi\ : label is 0;
  attribute C_HAS_RD_DATA_COUNT of \gbi.bi\ : label is 0;
  attribute C_HAS_UNDERFLOW of \gbi.bi\ : label is 0;
  attribute C_HAS_VALID of \gbi.bi\ : label is 1;
  attribute C_HAS_WR_ACK of \gbi.bi\ : label is 0;
  attribute C_HAS_WR_DATA_COUNT of \gbi.bi\ : label is 0;
  attribute C_IMPLEMENTATION_TYPE of \gbi.bi\ : label is 6;
  attribute C_INTERFACE_TYPE of \gbi.bi\ : label is 0;
  attribute C_MSGON_VAL of \gbi.bi\ : label is 1;
  attribute C_OVERFLOW_LOW of \gbi.bi\ : label is 0;
  attribute C_PRELOAD_LATENCY of \gbi.bi\ : label is 2;
  attribute C_PRELOAD_REGS of \gbi.bi\ : label is 1;
  attribute C_PRIM_FIFO_TYPE of \gbi.bi\ : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \gbi.bi\ : label is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \gbi.bi\ : label is 6;
  attribute C_PROG_EMPTY_TYPE of \gbi.bi\ : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \gbi.bi\ : label is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \gbi.bi\ : label is 510;
  attribute C_PROG_FULL_TYPE of \gbi.bi\ : label is 0;
  attribute C_RATIO_DEPTH_RD : integer;
  attribute C_RATIO_DEPTH_RD of \gbi.bi\ : label is 1;
  attribute C_RATIO_DEPTH_WR : integer;
  attribute C_RATIO_DEPTH_WR of \gbi.bi\ : label is 1;
  attribute C_RD_DATA_COUNT_WIDTH of \gbi.bi\ : label is 9;
  attribute C_RD_DEPTH of \gbi.bi\ : label is 512;
  attribute C_RD_FREQ of \gbi.bi\ : label is 50;
  attribute C_RD_PNTR_WIDTH of \gbi.bi\ : label is 9;
  attribute C_UNDERFLOW_LOW of \gbi.bi\ : label is 0;
  attribute C_USE_DOUT_RST of \gbi.bi\ : label is 1;
  attribute C_USE_ECC of \gbi.bi\ : label is 0;
  attribute C_USE_EMBEDDED_REG of \gbi.bi\ : label is 1;
  attribute C_USE_LOW_LATENCY_BI_FIFO : integer;
  attribute C_USE_LOW_LATENCY_BI_FIFO of \gbi.bi\ : label is 0;
  attribute C_USE_PIPELINE_REG of \gbi.bi\ : label is 0;
  attribute C_VALID_LOW of \gbi.bi\ : label is 0;
  attribute C_WR_ACK_LOW of \gbi.bi\ : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH of \gbi.bi\ : label is 9;
  attribute C_WR_DEPTH of \gbi.bi\ : label is 512;
  attribute C_WR_FREQ of \gbi.bi\ : label is 100;
  attribute C_WR_PNTR_WIDTH of \gbi.bi\ : label is 9;
  attribute downgradeipidentifiedwarnings of \gbi.bi\ : label is "yes";
begin
  ALMOST_EMPTY <= \<const0>\;
  ALMOST_FULL <= \<const0>\;
  DATA_COUNT(8) <= \<const0>\;
  DATA_COUNT(7) <= \<const0>\;
  DATA_COUNT(6) <= \<const0>\;
  DATA_COUNT(5) <= \<const0>\;
  DATA_COUNT(4) <= \<const0>\;
  DATA_COUNT(3) <= \<const0>\;
  DATA_COUNT(2) <= \<const0>\;
  DATA_COUNT(1) <= \<const0>\;
  DATA_COUNT(0) <= \<const0>\;
  DBITERR <= \<const0>\;
  OVERFLOW <= \<const0>\;
  PROG_EMPTY <= \<const0>\;
  PROG_FULL <= \<const0>\;
  RD_DATA_COUNT(8) <= \<const0>\;
  RD_DATA_COUNT(7) <= \<const0>\;
  RD_DATA_COUNT(6) <= \<const0>\;
  RD_DATA_COUNT(5) <= \<const0>\;
  RD_DATA_COUNT(4) <= \<const0>\;
  RD_DATA_COUNT(3) <= \<const0>\;
  RD_DATA_COUNT(2) <= \<const0>\;
  RD_DATA_COUNT(1) <= \<const0>\;
  RD_DATA_COUNT(0) <= \<const0>\;
  SBITERR <= \<const0>\;
  UNDERFLOW <= \<const0>\;
  WR_ACK <= \<const0>\;
  WR_DATA_COUNT(8) <= \<const0>\;
  WR_DATA_COUNT(7) <= \<const0>\;
  WR_DATA_COUNT(6) <= \<const0>\;
  WR_DATA_COUNT(5) <= \<const0>\;
  WR_DATA_COUNT(4) <= \<const0>\;
  WR_DATA_COUNT(3) <= \<const0>\;
  WR_DATA_COUNT(2) <= \<const0>\;
  WR_DATA_COUNT(1) <= \<const0>\;
  WR_DATA_COUNT(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gbi.bi\: entity work.fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin
     port map (
      ALMOST_EMPTY => \NLW_gbi.bi_ALMOST_EMPTY_UNCONNECTED\,
      ALMOST_FULL => \NLW_gbi.bi_ALMOST_FULL_UNCONNECTED\,
      CLK => '0',
      DBITERR => \NLW_gbi.bi_DBITERR_UNCONNECTED\,
      DIN(7 downto 0) => DIN(7 downto 0),
      DOUT(7 downto 0) => DOUT(7 downto 0),
      EMPTY => EMPTY,
      FULL => FULL,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      INT_CLK => '0',
      OVERFLOW => \NLW_gbi.bi_OVERFLOW_UNCONNECTED\,
      PROG_EMPTY => \NLW_gbi.bi_PROG_EMPTY_UNCONNECTED\,
      PROG_EMPTY_THRESH(8 downto 0) => B"000000000",
      PROG_EMPTY_THRESH_ASSERT(8 downto 0) => B"000000000",
      PROG_EMPTY_THRESH_NEGATE(8 downto 0) => B"000000000",
      PROG_FULL => \NLW_gbi.bi_PROG_FULL_UNCONNECTED\,
      PROG_FULL_THRESH(8 downto 0) => B"000000000",
      PROG_FULL_THRESH_ASSERT(8 downto 0) => B"000000000",
      PROG_FULL_THRESH_NEGATE(8 downto 0) => B"000000000",
      RDRSTBUSY => RD_RST_BUSY,
      RD_CLK => RD_CLK,
      RD_DATA_COUNT(8 downto 0) => \NLW_gbi.bi_RD_DATA_COUNT_UNCONNECTED\(8 downto 0),
      RD_EN => RD_EN,
      RST => SRST,
      SBITERR => \NLW_gbi.bi_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      UNDERFLOW => \NLW_gbi.bi_UNDERFLOW_UNCONNECTED\,
      VALID => VALID,
      WRRSTBUSY => WR_RST_BUSY,
      WR_ACK => \NLW_gbi.bi_WR_ACK_UNCONNECTED\,
      WR_CLK => WR_CLK,
      WR_DATA_COUNT(8 downto 0) => \NLW_gbi.bi_WR_DATA_COUNT_UNCONNECTED\(8 downto 0),
      WR_EN => WR_EN
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    sleep : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 8;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "virtexu";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "8kx4";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "8kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 50;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "fifo_generator_v13_1_1_synth";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth : entity is "yes";
end fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth;

architecture STRUCTURE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth is
  signal \<const0>\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_ALMOST_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_ALMOST_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_PROG_EMPTY_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_PROG_FULL_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_WR_ACK_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gconvfifo.rf_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gconvfifo.rf_RD_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gconvfifo.rf_WR_DATA_COUNT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute C_AXI_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_BYTE_STRB_WIDTH : integer;
  attribute C_BYTE_STRB_WIDTH of \gconvfifo.rf\ : label is 8;
  attribute C_COMMON_CLOCK of \gconvfifo.rf\ : label is 0;
  attribute C_COUNT_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_DATA_COUNT_WIDTH of \gconvfifo.rf\ : label is 9;
  attribute C_DEFAULT_VALUE of \gconvfifo.rf\ : label is "BlankString";
  attribute C_DIN_WIDTH of \gconvfifo.rf\ : label is 8;
  attribute C_DOUT_RST_VAL of \gconvfifo.rf\ : label is "0";
  attribute C_DOUT_WIDTH of \gconvfifo.rf\ : label is 8;
  attribute C_ENABLE_RLOCS of \gconvfifo.rf\ : label is 0;
  attribute C_ENABLE_RST_SYNC of \gconvfifo.rf\ : label is 1;
  attribute C_EN_SAFETY_CKT of \gconvfifo.rf\ : label is 0;
  attribute C_ERROR_INJECTION_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_FAMILY of \gconvfifo.rf\ : label is "virtexu";
  attribute C_FIFO_TYPE : integer;
  attribute C_FIFO_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_FULL_FLAGS_RST_VAL of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_ALMOST_EMPTY of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_ALMOST_FULL of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_BACKUP of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_DATA_COUNT of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_INT_CLK of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_MEMINIT_FILE of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_OVERFLOW of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_RD_DATA_COUNT of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_RD_RST of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_RST of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_SRST of \gconvfifo.rf\ : label is 1;
  attribute C_HAS_UNDERFLOW of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_VALID of \gconvfifo.rf\ : label is 1;
  attribute C_HAS_WR_ACK of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_WR_DATA_COUNT of \gconvfifo.rf\ : label is 0;
  attribute C_HAS_WR_RST of \gconvfifo.rf\ : label is 0;
  attribute C_IMPLEMENTATION_TYPE of \gconvfifo.rf\ : label is 6;
  attribute C_INIT_WR_PNTR_VAL of \gconvfifo.rf\ : label is 0;
  attribute C_INTERFACE_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_MEMORY_TYPE of \gconvfifo.rf\ : label is 4;
  attribute C_MIF_FILE_NAME of \gconvfifo.rf\ : label is "BlankString";
  attribute C_MSGON_VAL of \gconvfifo.rf\ : label is 1;
  attribute C_OPTIMIZATION_MODE of \gconvfifo.rf\ : label is 0;
  attribute C_OVERFLOW_LOW of \gconvfifo.rf\ : label is 0;
  attribute C_POWER_SAVING_MODE of \gconvfifo.rf\ : label is 0;
  attribute C_PRELOAD_LATENCY of \gconvfifo.rf\ : label is 2;
  attribute C_PRELOAD_REGS of \gconvfifo.rf\ : label is 1;
  attribute C_PRIM_FIFO_TYPE of \gconvfifo.rf\ : label is "512x36";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of \gconvfifo.rf\ : label is 5;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of \gconvfifo.rf\ : label is 6;
  attribute C_PROG_EMPTY_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of \gconvfifo.rf\ : label is 511;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of \gconvfifo.rf\ : label is 510;
  attribute C_PROG_FULL_TYPE of \gconvfifo.rf\ : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH of \gconvfifo.rf\ : label is 9;
  attribute C_RD_DEPTH of \gconvfifo.rf\ : label is 512;
  attribute C_RD_FREQ of \gconvfifo.rf\ : label is 50;
  attribute C_RD_PNTR_WIDTH of \gconvfifo.rf\ : label is 9;
  attribute C_SELECT_XPM of \gconvfifo.rf\ : label is 0;
  attribute C_SYNCHRONIZER_STAGE of \gconvfifo.rf\ : label is 2;
  attribute C_UNDERFLOW_LOW of \gconvfifo.rf\ : label is 0;
  attribute C_USE_DOUT_RST of \gconvfifo.rf\ : label is 1;
  attribute C_USE_ECC of \gconvfifo.rf\ : label is 0;
  attribute C_USE_EMBEDDED_REG of \gconvfifo.rf\ : label is 1;
  attribute C_USE_FIFO16_FLAGS of \gconvfifo.rf\ : label is 0;
  attribute C_USE_FWFT_DATA_COUNT of \gconvfifo.rf\ : label is 0;
  attribute C_USE_INPUT_CE : integer;
  attribute C_USE_INPUT_CE of \gconvfifo.rf\ : label is 0;
  attribute C_USE_OUTPUT_CE : integer;
  attribute C_USE_OUTPUT_CE of \gconvfifo.rf\ : label is 0;
  attribute C_USE_PIPELINE_REG of \gconvfifo.rf\ : label is 0;
  attribute C_USE_SYNC_CLK : integer;
  attribute C_USE_SYNC_CLK of \gconvfifo.rf\ : label is 0;
  attribute C_VALID_LOW of \gconvfifo.rf\ : label is 0;
  attribute C_WR_ACK_LOW of \gconvfifo.rf\ : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH of \gconvfifo.rf\ : label is 9;
  attribute C_WR_DEPTH of \gconvfifo.rf\ : label is 512;
  attribute C_WR_FREQ of \gconvfifo.rf\ : label is 100;
  attribute C_WR_PNTR_WIDTH of \gconvfifo.rf\ : label is 9;
  attribute C_WR_RESPONSE_LATENCY of \gconvfifo.rf\ : label is 1;
  attribute downgradeipidentifiedwarnings of \gconvfifo.rf\ : label is "yes";
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const0>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const0>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const0>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const0>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const0>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const0>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gconvfifo.rf\: entity work.fifo_host_to_fpga_8x512_fifo_generator_top
     port map (
      ALMOST_EMPTY => \NLW_gconvfifo.rf_ALMOST_EMPTY_UNCONNECTED\,
      ALMOST_FULL => \NLW_gconvfifo.rf_ALMOST_FULL_UNCONNECTED\,
      BACKUP => '0',
      BACKUP_MARKER => '0',
      CLK => '0',
      DATA_COUNT(8 downto 0) => \NLW_gconvfifo.rf_DATA_COUNT_UNCONNECTED\(8 downto 0),
      DBITERR => \NLW_gconvfifo.rf_DBITERR_UNCONNECTED\,
      DIN(7 downto 0) => din(7 downto 0),
      DOUT(7 downto 0) => dout(7 downto 0),
      EMPTY => empty,
      END_OF_PACKET => '0',
      FULL => full,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      INPUT_CE => '0',
      INT_CLK => '0',
      OUTPUT_CE => '0',
      OVERFLOW => \NLW_gconvfifo.rf_OVERFLOW_UNCONNECTED\,
      PROG_EMPTY => \NLW_gconvfifo.rf_PROG_EMPTY_UNCONNECTED\,
      PROG_EMPTY_THRESH(8 downto 0) => B"000000000",
      PROG_EMPTY_THRESH_ASSERT(8 downto 0) => B"000000000",
      PROG_EMPTY_THRESH_NEGATE(8 downto 0) => B"000000000",
      PROG_FULL => \NLW_gconvfifo.rf_PROG_FULL_UNCONNECTED\,
      PROG_FULL_THRESH(8 downto 0) => B"000000000",
      PROG_FULL_THRESH_ASSERT(8 downto 0) => B"000000000",
      PROG_FULL_THRESH_NEGATE(8 downto 0) => B"000000000",
      RD_CLK => rd_clk,
      RD_DATA_COUNT(8 downto 0) => \NLW_gconvfifo.rf_RD_DATA_COUNT_UNCONNECTED\(8 downto 0),
      RD_EN => rd_en,
      RD_RST => '0',
      RD_RST_BUSY => rd_rst_busy,
      RST => '0',
      SBITERR => \NLW_gconvfifo.rf_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      SRST => srst,
      UNDERFLOW => \NLW_gconvfifo.rf_UNDERFLOW_UNCONNECTED\,
      VALID => valid,
      WR_ACK => \NLW_gconvfifo.rf_WR_ACK_UNCONNECTED\,
      WR_CLK => wr_clk,
      WR_DATA_COUNT(8 downto 0) => \NLW_gconvfifo.rf_WR_DATA_COUNT_UNCONNECTED\(8 downto 0),
      WR_EN => wr_en,
      WR_RST => '0',
      WR_RST_BUSY => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 is
  port (
    backup : in STD_LOGIC;
    backup_marker : in STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_rst : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_rst : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    prog_empty_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_assert : in STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full_thresh_negate : in STD_LOGIC_VECTOR ( 8 downto 0 );
    int_clk : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    sleep : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    overflow : out STD_LOGIC;
    empty : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    underflow : out STD_LOGIC;
    data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    rd_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    wr_data_count : out STD_LOGIC_VECTOR ( 8 downto 0 );
    prog_full : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    s_aresetn : in STD_LOGIC;
    m_aclk_en : in STD_LOGIC;
    s_aclk_en : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_buser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    m_axi_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_awuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_wuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_buser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arlock : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arqos : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arregion : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_ruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m_axi_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_aruser : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_ruser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_injectsbiterr : in STD_LOGIC;
    axi_aw_injectdbiterr : in STD_LOGIC;
    axi_aw_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_aw_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_aw_sbiterr : out STD_LOGIC;
    axi_aw_dbiterr : out STD_LOGIC;
    axi_aw_overflow : out STD_LOGIC;
    axi_aw_underflow : out STD_LOGIC;
    axi_aw_prog_full : out STD_LOGIC;
    axi_aw_prog_empty : out STD_LOGIC;
    axi_w_injectsbiterr : in STD_LOGIC;
    axi_w_injectdbiterr : in STD_LOGIC;
    axi_w_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_w_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_w_sbiterr : out STD_LOGIC;
    axi_w_dbiterr : out STD_LOGIC;
    axi_w_overflow : out STD_LOGIC;
    axi_w_underflow : out STD_LOGIC;
    axi_w_prog_full : out STD_LOGIC;
    axi_w_prog_empty : out STD_LOGIC;
    axi_b_injectsbiterr : in STD_LOGIC;
    axi_b_injectdbiterr : in STD_LOGIC;
    axi_b_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_b_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_b_sbiterr : out STD_LOGIC;
    axi_b_dbiterr : out STD_LOGIC;
    axi_b_overflow : out STD_LOGIC;
    axi_b_underflow : out STD_LOGIC;
    axi_b_prog_full : out STD_LOGIC;
    axi_b_prog_empty : out STD_LOGIC;
    axi_ar_injectsbiterr : in STD_LOGIC;
    axi_ar_injectdbiterr : in STD_LOGIC;
    axi_ar_prog_full_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_prog_empty_thresh : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_ar_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_wr_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_rd_data_count : out STD_LOGIC_VECTOR ( 4 downto 0 );
    axi_ar_sbiterr : out STD_LOGIC;
    axi_ar_dbiterr : out STD_LOGIC;
    axi_ar_overflow : out STD_LOGIC;
    axi_ar_underflow : out STD_LOGIC;
    axi_ar_prog_full : out STD_LOGIC;
    axi_ar_prog_empty : out STD_LOGIC;
    axi_r_injectsbiterr : in STD_LOGIC;
    axi_r_injectdbiterr : in STD_LOGIC;
    axi_r_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axi_r_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axi_r_sbiterr : out STD_LOGIC;
    axi_r_dbiterr : out STD_LOGIC;
    axi_r_overflow : out STD_LOGIC;
    axi_r_underflow : out STD_LOGIC;
    axi_r_prog_full : out STD_LOGIC;
    axi_r_prog_empty : out STD_LOGIC;
    axis_injectsbiterr : in STD_LOGIC;
    axis_injectdbiterr : in STD_LOGIC;
    axis_prog_full_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_prog_empty_thresh : in STD_LOGIC_VECTOR ( 9 downto 0 );
    axis_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 10 downto 0 );
    axis_sbiterr : out STD_LOGIC;
    axis_dbiterr : out STD_LOGIC;
    axis_overflow : out STD_LOGIC;
    axis_underflow : out STD_LOGIC;
    axis_prog_full : out STD_LOGIC;
    axis_prog_empty : out STD_LOGIC
  );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 8;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "virtexu";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "1kx36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "8kx4";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "8kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 50;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 : entity is "fifo_generator_v13_1_1";
end fifo_host_to_fpga_8x512_fifo_generator_v13_1_1;

architecture STRUCTURE of fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal NLW_inst_fifo_gen_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_fifo_gen_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_inst_fifo_gen_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_inst_fifo_gen_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_fifo_gen_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_fifo_gen_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_fifo_gen_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_inst_fifo_gen_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_fifo_gen_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_inst_fifo_gen_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_fifo_gen_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_fifo_gen_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_AXIS of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_RACH of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_RDCH of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_WACH of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_WDCH of inst_fifo_gen : label is 0;
  attribute C_APPLICATION_TYPE_WRCH of inst_fifo_gen : label is 0;
  attribute C_AXIS_TDATA_WIDTH of inst_fifo_gen : label is 8;
  attribute C_AXIS_TDEST_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXIS_TID_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXIS_TKEEP_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXIS_TSTRB_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXIS_TUSER_WIDTH of inst_fifo_gen : label is 4;
  attribute C_AXIS_TYPE of inst_fifo_gen : label is 0;
  attribute C_AXI_ADDR_WIDTH of inst_fifo_gen : label is 32;
  attribute C_AXI_ARUSER_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_AWUSER_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_BUSER_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_DATA_WIDTH of inst_fifo_gen : label is 64;
  attribute C_AXI_ID_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_LEN_WIDTH of inst_fifo_gen : label is 8;
  attribute C_AXI_LOCK_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_RUSER_WIDTH of inst_fifo_gen : label is 1;
  attribute C_AXI_TYPE of inst_fifo_gen : label is 1;
  attribute C_AXI_WUSER_WIDTH of inst_fifo_gen : label is 1;
  attribute C_COMMON_CLOCK of inst_fifo_gen : label is 0;
  attribute C_COUNT_TYPE of inst_fifo_gen : label is 0;
  attribute C_DATA_COUNT_WIDTH of inst_fifo_gen : label is 9;
  attribute C_DEFAULT_VALUE of inst_fifo_gen : label is "BlankString";
  attribute C_DIN_WIDTH of inst_fifo_gen : label is 8;
  attribute C_DIN_WIDTH_AXIS of inst_fifo_gen : label is 1;
  attribute C_DIN_WIDTH_RACH of inst_fifo_gen : label is 32;
  attribute C_DIN_WIDTH_RDCH of inst_fifo_gen : label is 64;
  attribute C_DIN_WIDTH_WACH of inst_fifo_gen : label is 1;
  attribute C_DIN_WIDTH_WDCH of inst_fifo_gen : label is 64;
  attribute C_DIN_WIDTH_WRCH of inst_fifo_gen : label is 2;
  attribute C_DOUT_RST_VAL of inst_fifo_gen : label is "0";
  attribute C_DOUT_WIDTH of inst_fifo_gen : label is 8;
  attribute C_ENABLE_RLOCS of inst_fifo_gen : label is 0;
  attribute C_ENABLE_RST_SYNC of inst_fifo_gen : label is 1;
  attribute C_EN_SAFETY_CKT of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH of inst_fifo_gen : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH of inst_fifo_gen : label is 0;
  attribute C_FAMILY of inst_fifo_gen : label is "virtexu";
  attribute C_FULL_FLAGS_RST_VAL of inst_fifo_gen : label is 0;
  attribute C_HAS_ALMOST_EMPTY of inst_fifo_gen : label is 0;
  attribute C_HAS_ALMOST_FULL of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TDATA of inst_fifo_gen : label is 1;
  attribute C_HAS_AXIS_TDEST of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TID of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TKEEP of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TLAST of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TREADY of inst_fifo_gen : label is 1;
  attribute C_HAS_AXIS_TSTRB of inst_fifo_gen : label is 0;
  attribute C_HAS_AXIS_TUSER of inst_fifo_gen : label is 1;
  attribute C_HAS_AXI_ARUSER of inst_fifo_gen : label is 0;
  attribute C_HAS_AXI_AWUSER of inst_fifo_gen : label is 0;
  attribute C_HAS_AXI_BUSER of inst_fifo_gen : label is 0;
  attribute C_HAS_AXI_ID of inst_fifo_gen : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL of inst_fifo_gen : label is 1;
  attribute C_HAS_AXI_RUSER of inst_fifo_gen : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL of inst_fifo_gen : label is 1;
  attribute C_HAS_AXI_WUSER of inst_fifo_gen : label is 0;
  attribute C_HAS_BACKUP of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNT of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH of inst_fifo_gen : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH of inst_fifo_gen : label is 0;
  attribute C_HAS_INT_CLK of inst_fifo_gen : label is 0;
  attribute C_HAS_MASTER_CE of inst_fifo_gen : label is 0;
  attribute C_HAS_MEMINIT_FILE of inst_fifo_gen : label is 0;
  attribute C_HAS_OVERFLOW of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH of inst_fifo_gen : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH of inst_fifo_gen : label is 0;
  attribute C_HAS_RD_DATA_COUNT of inst_fifo_gen : label is 0;
  attribute C_HAS_RD_RST of inst_fifo_gen : label is 0;
  attribute C_HAS_RST of inst_fifo_gen : label is 0;
  attribute C_HAS_SLAVE_CE of inst_fifo_gen : label is 0;
  attribute C_HAS_SRST of inst_fifo_gen : label is 1;
  attribute C_HAS_UNDERFLOW of inst_fifo_gen : label is 0;
  attribute C_HAS_VALID of inst_fifo_gen : label is 1;
  attribute C_HAS_WR_ACK of inst_fifo_gen : label is 0;
  attribute C_HAS_WR_DATA_COUNT of inst_fifo_gen : label is 0;
  attribute C_HAS_WR_RST of inst_fifo_gen : label is 0;
  attribute C_IMPLEMENTATION_TYPE of inst_fifo_gen : label is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS of inst_fifo_gen : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH of inst_fifo_gen : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH of inst_fifo_gen : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH of inst_fifo_gen : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH of inst_fifo_gen : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH of inst_fifo_gen : label is 1;
  attribute C_INIT_WR_PNTR_VAL of inst_fifo_gen : label is 0;
  attribute C_INTERFACE_TYPE of inst_fifo_gen : label is 0;
  attribute C_MEMORY_TYPE of inst_fifo_gen : label is 4;
  attribute C_MIF_FILE_NAME of inst_fifo_gen : label is "BlankString";
  attribute C_MSGON_VAL of inst_fifo_gen : label is 1;
  attribute C_OPTIMIZATION_MODE of inst_fifo_gen : label is 0;
  attribute C_OVERFLOW_LOW of inst_fifo_gen : label is 0;
  attribute C_POWER_SAVING_MODE of inst_fifo_gen : label is 0;
  attribute C_PRELOAD_LATENCY of inst_fifo_gen : label is 2;
  attribute C_PRELOAD_REGS of inst_fifo_gen : label is 1;
  attribute C_PRIM_FIFO_TYPE of inst_fifo_gen : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS of inst_fifo_gen : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH of inst_fifo_gen : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_RDCH of inst_fifo_gen : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH of inst_fifo_gen : label is "8kx4";
  attribute C_PRIM_FIFO_TYPE_WDCH of inst_fifo_gen : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH of inst_fifo_gen : label is "8kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of inst_fifo_gen : label is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of inst_fifo_gen : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of inst_fifo_gen : label is 6;
  attribute C_PROG_EMPTY_TYPE of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH of inst_fifo_gen : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of inst_fifo_gen : label is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of inst_fifo_gen : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of inst_fifo_gen : label is 510;
  attribute C_PROG_FULL_TYPE of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_RACH of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_WACH of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH of inst_fifo_gen : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH of inst_fifo_gen : label is 0;
  attribute C_RACH_TYPE of inst_fifo_gen : label is 0;
  attribute C_RDCH_TYPE of inst_fifo_gen : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH of inst_fifo_gen : label is 9;
  attribute C_RD_DEPTH of inst_fifo_gen : label is 512;
  attribute C_RD_FREQ of inst_fifo_gen : label is 50;
  attribute C_RD_PNTR_WIDTH of inst_fifo_gen : label is 9;
  attribute C_REG_SLICE_MODE_AXIS of inst_fifo_gen : label is 0;
  attribute C_REG_SLICE_MODE_RACH of inst_fifo_gen : label is 0;
  attribute C_REG_SLICE_MODE_RDCH of inst_fifo_gen : label is 0;
  attribute C_REG_SLICE_MODE_WACH of inst_fifo_gen : label is 0;
  attribute C_REG_SLICE_MODE_WDCH of inst_fifo_gen : label is 0;
  attribute C_REG_SLICE_MODE_WRCH of inst_fifo_gen : label is 0;
  attribute C_SELECT_XPM of inst_fifo_gen : label is 0;
  attribute C_SYNCHRONIZER_STAGE of inst_fifo_gen : label is 2;
  attribute C_UNDERFLOW_LOW of inst_fifo_gen : label is 0;
  attribute C_USE_COMMON_OVERFLOW of inst_fifo_gen : label is 0;
  attribute C_USE_COMMON_UNDERFLOW of inst_fifo_gen : label is 0;
  attribute C_USE_DEFAULT_SETTINGS of inst_fifo_gen : label is 0;
  attribute C_USE_DOUT_RST of inst_fifo_gen : label is 1;
  attribute C_USE_ECC of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_AXIS of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_RACH of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_RDCH of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_WACH of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_WDCH of inst_fifo_gen : label is 0;
  attribute C_USE_ECC_WRCH of inst_fifo_gen : label is 0;
  attribute C_USE_EMBEDDED_REG of inst_fifo_gen : label is 1;
  attribute C_USE_FIFO16_FLAGS of inst_fifo_gen : label is 0;
  attribute C_USE_FWFT_DATA_COUNT of inst_fifo_gen : label is 0;
  attribute C_USE_PIPELINE_REG of inst_fifo_gen : label is 0;
  attribute C_VALID_LOW of inst_fifo_gen : label is 0;
  attribute C_WACH_TYPE of inst_fifo_gen : label is 0;
  attribute C_WDCH_TYPE of inst_fifo_gen : label is 0;
  attribute C_WRCH_TYPE of inst_fifo_gen : label is 0;
  attribute C_WR_ACK_LOW of inst_fifo_gen : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH of inst_fifo_gen : label is 9;
  attribute C_WR_DEPTH of inst_fifo_gen : label is 512;
  attribute C_WR_DEPTH_AXIS of inst_fifo_gen : label is 1024;
  attribute C_WR_DEPTH_RACH of inst_fifo_gen : label is 16;
  attribute C_WR_DEPTH_RDCH of inst_fifo_gen : label is 1024;
  attribute C_WR_DEPTH_WACH of inst_fifo_gen : label is 16;
  attribute C_WR_DEPTH_WDCH of inst_fifo_gen : label is 1024;
  attribute C_WR_DEPTH_WRCH of inst_fifo_gen : label is 16;
  attribute C_WR_FREQ of inst_fifo_gen : label is 100;
  attribute C_WR_PNTR_WIDTH of inst_fifo_gen : label is 9;
  attribute C_WR_PNTR_WIDTH_AXIS of inst_fifo_gen : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH of inst_fifo_gen : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH of inst_fifo_gen : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH of inst_fifo_gen : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH of inst_fifo_gen : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH of inst_fifo_gen : label is 4;
  attribute C_WR_RESPONSE_LATENCY of inst_fifo_gen : label is 1;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of inst_fifo_gen : label is "yes";
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axi_ar_data_count(4) <= \<const0>\;
  axi_ar_data_count(3) <= \<const0>\;
  axi_ar_data_count(2) <= \<const0>\;
  axi_ar_data_count(1) <= \<const0>\;
  axi_ar_data_count(0) <= \<const0>\;
  axi_ar_dbiterr <= \<const0>\;
  axi_ar_overflow <= \<const0>\;
  axi_ar_prog_empty <= \<const1>\;
  axi_ar_prog_full <= \<const0>\;
  axi_ar_rd_data_count(4) <= \<const0>\;
  axi_ar_rd_data_count(3) <= \<const0>\;
  axi_ar_rd_data_count(2) <= \<const0>\;
  axi_ar_rd_data_count(1) <= \<const0>\;
  axi_ar_rd_data_count(0) <= \<const0>\;
  axi_ar_sbiterr <= \<const0>\;
  axi_ar_underflow <= \<const0>\;
  axi_ar_wr_data_count(4) <= \<const0>\;
  axi_ar_wr_data_count(3) <= \<const0>\;
  axi_ar_wr_data_count(2) <= \<const0>\;
  axi_ar_wr_data_count(1) <= \<const0>\;
  axi_ar_wr_data_count(0) <= \<const0>\;
  axi_aw_data_count(4) <= \<const0>\;
  axi_aw_data_count(3) <= \<const0>\;
  axi_aw_data_count(2) <= \<const0>\;
  axi_aw_data_count(1) <= \<const0>\;
  axi_aw_data_count(0) <= \<const0>\;
  axi_aw_dbiterr <= \<const0>\;
  axi_aw_overflow <= \<const0>\;
  axi_aw_prog_empty <= \<const1>\;
  axi_aw_prog_full <= \<const0>\;
  axi_aw_rd_data_count(4) <= \<const0>\;
  axi_aw_rd_data_count(3) <= \<const0>\;
  axi_aw_rd_data_count(2) <= \<const0>\;
  axi_aw_rd_data_count(1) <= \<const0>\;
  axi_aw_rd_data_count(0) <= \<const0>\;
  axi_aw_sbiterr <= \<const0>\;
  axi_aw_underflow <= \<const0>\;
  axi_aw_wr_data_count(4) <= \<const0>\;
  axi_aw_wr_data_count(3) <= \<const0>\;
  axi_aw_wr_data_count(2) <= \<const0>\;
  axi_aw_wr_data_count(1) <= \<const0>\;
  axi_aw_wr_data_count(0) <= \<const0>\;
  axi_b_data_count(4) <= \<const0>\;
  axi_b_data_count(3) <= \<const0>\;
  axi_b_data_count(2) <= \<const0>\;
  axi_b_data_count(1) <= \<const0>\;
  axi_b_data_count(0) <= \<const0>\;
  axi_b_dbiterr <= \<const0>\;
  axi_b_overflow <= \<const0>\;
  axi_b_prog_empty <= \<const1>\;
  axi_b_prog_full <= \<const0>\;
  axi_b_rd_data_count(4) <= \<const0>\;
  axi_b_rd_data_count(3) <= \<const0>\;
  axi_b_rd_data_count(2) <= \<const0>\;
  axi_b_rd_data_count(1) <= \<const0>\;
  axi_b_rd_data_count(0) <= \<const0>\;
  axi_b_sbiterr <= \<const0>\;
  axi_b_underflow <= \<const0>\;
  axi_b_wr_data_count(4) <= \<const0>\;
  axi_b_wr_data_count(3) <= \<const0>\;
  axi_b_wr_data_count(2) <= \<const0>\;
  axi_b_wr_data_count(1) <= \<const0>\;
  axi_b_wr_data_count(0) <= \<const0>\;
  axi_r_data_count(10) <= \<const0>\;
  axi_r_data_count(9) <= \<const0>\;
  axi_r_data_count(8) <= \<const0>\;
  axi_r_data_count(7) <= \<const0>\;
  axi_r_data_count(6) <= \<const0>\;
  axi_r_data_count(5) <= \<const0>\;
  axi_r_data_count(4) <= \<const0>\;
  axi_r_data_count(3) <= \<const0>\;
  axi_r_data_count(2) <= \<const0>\;
  axi_r_data_count(1) <= \<const0>\;
  axi_r_data_count(0) <= \<const0>\;
  axi_r_dbiterr <= \<const0>\;
  axi_r_overflow <= \<const0>\;
  axi_r_prog_empty <= \<const1>\;
  axi_r_prog_full <= \<const0>\;
  axi_r_rd_data_count(10) <= \<const0>\;
  axi_r_rd_data_count(9) <= \<const0>\;
  axi_r_rd_data_count(8) <= \<const0>\;
  axi_r_rd_data_count(7) <= \<const0>\;
  axi_r_rd_data_count(6) <= \<const0>\;
  axi_r_rd_data_count(5) <= \<const0>\;
  axi_r_rd_data_count(4) <= \<const0>\;
  axi_r_rd_data_count(3) <= \<const0>\;
  axi_r_rd_data_count(2) <= \<const0>\;
  axi_r_rd_data_count(1) <= \<const0>\;
  axi_r_rd_data_count(0) <= \<const0>\;
  axi_r_sbiterr <= \<const0>\;
  axi_r_underflow <= \<const0>\;
  axi_r_wr_data_count(10) <= \<const0>\;
  axi_r_wr_data_count(9) <= \<const0>\;
  axi_r_wr_data_count(8) <= \<const0>\;
  axi_r_wr_data_count(7) <= \<const0>\;
  axi_r_wr_data_count(6) <= \<const0>\;
  axi_r_wr_data_count(5) <= \<const0>\;
  axi_r_wr_data_count(4) <= \<const0>\;
  axi_r_wr_data_count(3) <= \<const0>\;
  axi_r_wr_data_count(2) <= \<const0>\;
  axi_r_wr_data_count(1) <= \<const0>\;
  axi_r_wr_data_count(0) <= \<const0>\;
  axi_w_data_count(10) <= \<const0>\;
  axi_w_data_count(9) <= \<const0>\;
  axi_w_data_count(8) <= \<const0>\;
  axi_w_data_count(7) <= \<const0>\;
  axi_w_data_count(6) <= \<const0>\;
  axi_w_data_count(5) <= \<const0>\;
  axi_w_data_count(4) <= \<const0>\;
  axi_w_data_count(3) <= \<const0>\;
  axi_w_data_count(2) <= \<const0>\;
  axi_w_data_count(1) <= \<const0>\;
  axi_w_data_count(0) <= \<const0>\;
  axi_w_dbiterr <= \<const0>\;
  axi_w_overflow <= \<const0>\;
  axi_w_prog_empty <= \<const1>\;
  axi_w_prog_full <= \<const0>\;
  axi_w_rd_data_count(10) <= \<const0>\;
  axi_w_rd_data_count(9) <= \<const0>\;
  axi_w_rd_data_count(8) <= \<const0>\;
  axi_w_rd_data_count(7) <= \<const0>\;
  axi_w_rd_data_count(6) <= \<const0>\;
  axi_w_rd_data_count(5) <= \<const0>\;
  axi_w_rd_data_count(4) <= \<const0>\;
  axi_w_rd_data_count(3) <= \<const0>\;
  axi_w_rd_data_count(2) <= \<const0>\;
  axi_w_rd_data_count(1) <= \<const0>\;
  axi_w_rd_data_count(0) <= \<const0>\;
  axi_w_sbiterr <= \<const0>\;
  axi_w_underflow <= \<const0>\;
  axi_w_wr_data_count(10) <= \<const0>\;
  axi_w_wr_data_count(9) <= \<const0>\;
  axi_w_wr_data_count(8) <= \<const0>\;
  axi_w_wr_data_count(7) <= \<const0>\;
  axi_w_wr_data_count(6) <= \<const0>\;
  axi_w_wr_data_count(5) <= \<const0>\;
  axi_w_wr_data_count(4) <= \<const0>\;
  axi_w_wr_data_count(3) <= \<const0>\;
  axi_w_wr_data_count(2) <= \<const0>\;
  axi_w_wr_data_count(1) <= \<const0>\;
  axi_w_wr_data_count(0) <= \<const0>\;
  axis_data_count(10) <= \<const0>\;
  axis_data_count(9) <= \<const0>\;
  axis_data_count(8) <= \<const0>\;
  axis_data_count(7) <= \<const0>\;
  axis_data_count(6) <= \<const0>\;
  axis_data_count(5) <= \<const0>\;
  axis_data_count(4) <= \<const0>\;
  axis_data_count(3) <= \<const0>\;
  axis_data_count(2) <= \<const0>\;
  axis_data_count(1) <= \<const0>\;
  axis_data_count(0) <= \<const0>\;
  axis_dbiterr <= \<const0>\;
  axis_overflow <= \<const0>\;
  axis_prog_empty <= \<const1>\;
  axis_prog_full <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_sbiterr <= \<const0>\;
  axis_underflow <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  data_count(8) <= \<const0>\;
  data_count(7) <= \<const0>\;
  data_count(6) <= \<const0>\;
  data_count(5) <= \<const0>\;
  data_count(4) <= \<const0>\;
  data_count(3) <= \<const0>\;
  data_count(2) <= \<const0>\;
  data_count(1) <= \<const0>\;
  data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axi_araddr(31) <= \<const0>\;
  m_axi_araddr(30) <= \<const0>\;
  m_axi_araddr(29) <= \<const0>\;
  m_axi_araddr(28) <= \<const0>\;
  m_axi_araddr(27) <= \<const0>\;
  m_axi_araddr(26) <= \<const0>\;
  m_axi_araddr(25) <= \<const0>\;
  m_axi_araddr(24) <= \<const0>\;
  m_axi_araddr(23) <= \<const0>\;
  m_axi_araddr(22) <= \<const0>\;
  m_axi_araddr(21) <= \<const0>\;
  m_axi_araddr(20) <= \<const0>\;
  m_axi_araddr(19) <= \<const0>\;
  m_axi_araddr(18) <= \<const0>\;
  m_axi_araddr(17) <= \<const0>\;
  m_axi_araddr(16) <= \<const0>\;
  m_axi_araddr(15) <= \<const0>\;
  m_axi_araddr(14) <= \<const0>\;
  m_axi_araddr(13) <= \<const0>\;
  m_axi_araddr(12) <= \<const0>\;
  m_axi_araddr(11) <= \<const0>\;
  m_axi_araddr(10) <= \<const0>\;
  m_axi_araddr(9) <= \<const0>\;
  m_axi_araddr(8) <= \<const0>\;
  m_axi_araddr(7) <= \<const0>\;
  m_axi_araddr(6) <= \<const0>\;
  m_axi_araddr(5) <= \<const0>\;
  m_axi_araddr(4) <= \<const0>\;
  m_axi_araddr(3) <= \<const0>\;
  m_axi_araddr(2) <= \<const0>\;
  m_axi_araddr(1) <= \<const0>\;
  m_axi_araddr(0) <= \<const0>\;
  m_axi_arburst(1) <= \<const0>\;
  m_axi_arburst(0) <= \<const0>\;
  m_axi_arcache(3) <= \<const0>\;
  m_axi_arcache(2) <= \<const0>\;
  m_axi_arcache(1) <= \<const0>\;
  m_axi_arcache(0) <= \<const0>\;
  m_axi_arid(0) <= \<const0>\;
  m_axi_arlen(7) <= \<const0>\;
  m_axi_arlen(6) <= \<const0>\;
  m_axi_arlen(5) <= \<const0>\;
  m_axi_arlen(4) <= \<const0>\;
  m_axi_arlen(3) <= \<const0>\;
  m_axi_arlen(2) <= \<const0>\;
  m_axi_arlen(1) <= \<const0>\;
  m_axi_arlen(0) <= \<const0>\;
  m_axi_arlock(0) <= \<const0>\;
  m_axi_arprot(2) <= \<const0>\;
  m_axi_arprot(1) <= \<const0>\;
  m_axi_arprot(0) <= \<const0>\;
  m_axi_arqos(3) <= \<const0>\;
  m_axi_arqos(2) <= \<const0>\;
  m_axi_arqos(1) <= \<const0>\;
  m_axi_arqos(0) <= \<const0>\;
  m_axi_arregion(3) <= \<const0>\;
  m_axi_arregion(2) <= \<const0>\;
  m_axi_arregion(1) <= \<const0>\;
  m_axi_arregion(0) <= \<const0>\;
  m_axi_arsize(2) <= \<const0>\;
  m_axi_arsize(1) <= \<const0>\;
  m_axi_arsize(0) <= \<const0>\;
  m_axi_aruser(0) <= \<const0>\;
  m_axi_arvalid <= \<const0>\;
  m_axi_awaddr(31) <= \<const0>\;
  m_axi_awaddr(30) <= \<const0>\;
  m_axi_awaddr(29) <= \<const0>\;
  m_axi_awaddr(28) <= \<const0>\;
  m_axi_awaddr(27) <= \<const0>\;
  m_axi_awaddr(26) <= \<const0>\;
  m_axi_awaddr(25) <= \<const0>\;
  m_axi_awaddr(24) <= \<const0>\;
  m_axi_awaddr(23) <= \<const0>\;
  m_axi_awaddr(22) <= \<const0>\;
  m_axi_awaddr(21) <= \<const0>\;
  m_axi_awaddr(20) <= \<const0>\;
  m_axi_awaddr(19) <= \<const0>\;
  m_axi_awaddr(18) <= \<const0>\;
  m_axi_awaddr(17) <= \<const0>\;
  m_axi_awaddr(16) <= \<const0>\;
  m_axi_awaddr(15) <= \<const0>\;
  m_axi_awaddr(14) <= \<const0>\;
  m_axi_awaddr(13) <= \<const0>\;
  m_axi_awaddr(12) <= \<const0>\;
  m_axi_awaddr(11) <= \<const0>\;
  m_axi_awaddr(10) <= \<const0>\;
  m_axi_awaddr(9) <= \<const0>\;
  m_axi_awaddr(8) <= \<const0>\;
  m_axi_awaddr(7) <= \<const0>\;
  m_axi_awaddr(6) <= \<const0>\;
  m_axi_awaddr(5) <= \<const0>\;
  m_axi_awaddr(4) <= \<const0>\;
  m_axi_awaddr(3) <= \<const0>\;
  m_axi_awaddr(2) <= \<const0>\;
  m_axi_awaddr(1) <= \<const0>\;
  m_axi_awaddr(0) <= \<const0>\;
  m_axi_awburst(1) <= \<const0>\;
  m_axi_awburst(0) <= \<const0>\;
  m_axi_awcache(3) <= \<const0>\;
  m_axi_awcache(2) <= \<const0>\;
  m_axi_awcache(1) <= \<const0>\;
  m_axi_awcache(0) <= \<const0>\;
  m_axi_awid(0) <= \<const0>\;
  m_axi_awlen(7) <= \<const0>\;
  m_axi_awlen(6) <= \<const0>\;
  m_axi_awlen(5) <= \<const0>\;
  m_axi_awlen(4) <= \<const0>\;
  m_axi_awlen(3) <= \<const0>\;
  m_axi_awlen(2) <= \<const0>\;
  m_axi_awlen(1) <= \<const0>\;
  m_axi_awlen(0) <= \<const0>\;
  m_axi_awlock(0) <= \<const0>\;
  m_axi_awprot(2) <= \<const0>\;
  m_axi_awprot(1) <= \<const0>\;
  m_axi_awprot(0) <= \<const0>\;
  m_axi_awqos(3) <= \<const0>\;
  m_axi_awqos(2) <= \<const0>\;
  m_axi_awqos(1) <= \<const0>\;
  m_axi_awqos(0) <= \<const0>\;
  m_axi_awregion(3) <= \<const0>\;
  m_axi_awregion(2) <= \<const0>\;
  m_axi_awregion(1) <= \<const0>\;
  m_axi_awregion(0) <= \<const0>\;
  m_axi_awsize(2) <= \<const0>\;
  m_axi_awsize(1) <= \<const0>\;
  m_axi_awsize(0) <= \<const0>\;
  m_axi_awuser(0) <= \<const0>\;
  m_axi_awvalid <= \<const0>\;
  m_axi_bready <= \<const0>\;
  m_axi_rready <= \<const0>\;
  m_axi_wdata(63) <= \<const0>\;
  m_axi_wdata(62) <= \<const0>\;
  m_axi_wdata(61) <= \<const0>\;
  m_axi_wdata(60) <= \<const0>\;
  m_axi_wdata(59) <= \<const0>\;
  m_axi_wdata(58) <= \<const0>\;
  m_axi_wdata(57) <= \<const0>\;
  m_axi_wdata(56) <= \<const0>\;
  m_axi_wdata(55) <= \<const0>\;
  m_axi_wdata(54) <= \<const0>\;
  m_axi_wdata(53) <= \<const0>\;
  m_axi_wdata(52) <= \<const0>\;
  m_axi_wdata(51) <= \<const0>\;
  m_axi_wdata(50) <= \<const0>\;
  m_axi_wdata(49) <= \<const0>\;
  m_axi_wdata(48) <= \<const0>\;
  m_axi_wdata(47) <= \<const0>\;
  m_axi_wdata(46) <= \<const0>\;
  m_axi_wdata(45) <= \<const0>\;
  m_axi_wdata(44) <= \<const0>\;
  m_axi_wdata(43) <= \<const0>\;
  m_axi_wdata(42) <= \<const0>\;
  m_axi_wdata(41) <= \<const0>\;
  m_axi_wdata(40) <= \<const0>\;
  m_axi_wdata(39) <= \<const0>\;
  m_axi_wdata(38) <= \<const0>\;
  m_axi_wdata(37) <= \<const0>\;
  m_axi_wdata(36) <= \<const0>\;
  m_axi_wdata(35) <= \<const0>\;
  m_axi_wdata(34) <= \<const0>\;
  m_axi_wdata(33) <= \<const0>\;
  m_axi_wdata(32) <= \<const0>\;
  m_axi_wdata(31) <= \<const0>\;
  m_axi_wdata(30) <= \<const0>\;
  m_axi_wdata(29) <= \<const0>\;
  m_axi_wdata(28) <= \<const0>\;
  m_axi_wdata(27) <= \<const0>\;
  m_axi_wdata(26) <= \<const0>\;
  m_axi_wdata(25) <= \<const0>\;
  m_axi_wdata(24) <= \<const0>\;
  m_axi_wdata(23) <= \<const0>\;
  m_axi_wdata(22) <= \<const0>\;
  m_axi_wdata(21) <= \<const0>\;
  m_axi_wdata(20) <= \<const0>\;
  m_axi_wdata(19) <= \<const0>\;
  m_axi_wdata(18) <= \<const0>\;
  m_axi_wdata(17) <= \<const0>\;
  m_axi_wdata(16) <= \<const0>\;
  m_axi_wdata(15) <= \<const0>\;
  m_axi_wdata(14) <= \<const0>\;
  m_axi_wdata(13) <= \<const0>\;
  m_axi_wdata(12) <= \<const0>\;
  m_axi_wdata(11) <= \<const0>\;
  m_axi_wdata(10) <= \<const0>\;
  m_axi_wdata(9) <= \<const0>\;
  m_axi_wdata(8) <= \<const0>\;
  m_axi_wdata(7) <= \<const0>\;
  m_axi_wdata(6) <= \<const0>\;
  m_axi_wdata(5) <= \<const0>\;
  m_axi_wdata(4) <= \<const0>\;
  m_axi_wdata(3) <= \<const0>\;
  m_axi_wdata(2) <= \<const0>\;
  m_axi_wdata(1) <= \<const0>\;
  m_axi_wdata(0) <= \<const0>\;
  m_axi_wid(0) <= \<const0>\;
  m_axi_wlast <= \<const0>\;
  m_axi_wstrb(7) <= \<const0>\;
  m_axi_wstrb(6) <= \<const0>\;
  m_axi_wstrb(5) <= \<const0>\;
  m_axi_wstrb(4) <= \<const0>\;
  m_axi_wstrb(3) <= \<const0>\;
  m_axi_wstrb(2) <= \<const0>\;
  m_axi_wstrb(1) <= \<const0>\;
  m_axi_wstrb(0) <= \<const0>\;
  m_axi_wuser(0) <= \<const0>\;
  m_axi_wvalid <= \<const0>\;
  m_axis_tdata(7) <= \<const0>\;
  m_axis_tdata(6) <= \<const0>\;
  m_axis_tdata(5) <= \<const0>\;
  m_axis_tdata(4) <= \<const0>\;
  m_axis_tdata(3) <= \<const0>\;
  m_axis_tdata(2) <= \<const0>\;
  m_axis_tdata(1) <= \<const0>\;
  m_axis_tdata(0) <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tlast <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(3) <= \<const0>\;
  m_axis_tuser(2) <= \<const0>\;
  m_axis_tuser(1) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \<const0>\;
  prog_full <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_buser(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(63) <= \<const0>\;
  s_axi_rdata(62) <= \<const0>\;
  s_axi_rdata(61) <= \<const0>\;
  s_axi_rdata(60) <= \<const0>\;
  s_axi_rdata(59) <= \<const0>\;
  s_axi_rdata(58) <= \<const0>\;
  s_axi_rdata(57) <= \<const0>\;
  s_axi_rdata(56) <= \<const0>\;
  s_axi_rdata(55) <= \<const0>\;
  s_axi_rdata(54) <= \<const0>\;
  s_axi_rdata(53) <= \<const0>\;
  s_axi_rdata(52) <= \<const0>\;
  s_axi_rdata(51) <= \<const0>\;
  s_axi_rdata(50) <= \<const0>\;
  s_axi_rdata(49) <= \<const0>\;
  s_axi_rdata(48) <= \<const0>\;
  s_axi_rdata(47) <= \<const0>\;
  s_axi_rdata(46) <= \<const0>\;
  s_axi_rdata(45) <= \<const0>\;
  s_axi_rdata(44) <= \<const0>\;
  s_axi_rdata(43) <= \<const0>\;
  s_axi_rdata(42) <= \<const0>\;
  s_axi_rdata(41) <= \<const0>\;
  s_axi_rdata(40) <= \<const0>\;
  s_axi_rdata(39) <= \<const0>\;
  s_axi_rdata(38) <= \<const0>\;
  s_axi_rdata(37) <= \<const0>\;
  s_axi_rdata(36) <= \<const0>\;
  s_axi_rdata(35) <= \<const0>\;
  s_axi_rdata(34) <= \<const0>\;
  s_axi_rdata(33) <= \<const0>\;
  s_axi_rdata(32) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_ruser(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
  s_axis_tready <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst_fifo_gen: entity work.fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth
     port map (
      almost_empty => NLW_inst_fifo_gen_almost_empty_UNCONNECTED,
      almost_full => NLW_inst_fifo_gen_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_inst_fifo_gen_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_inst_fifo_gen_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_inst_fifo_gen_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_inst_fifo_gen_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_inst_fifo_gen_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_inst_fifo_gen_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_inst_fifo_gen_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_inst_fifo_gen_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_inst_fifo_gen_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_inst_fifo_gen_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_inst_fifo_gen_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_inst_fifo_gen_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_inst_fifo_gen_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_inst_fifo_gen_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_inst_fifo_gen_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_inst_fifo_gen_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_inst_fifo_gen_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_inst_fifo_gen_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_inst_fifo_gen_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_inst_fifo_gen_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_inst_fifo_gen_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_inst_fifo_gen_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_inst_fifo_gen_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_inst_fifo_gen_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_inst_fifo_gen_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_inst_fifo_gen_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_inst_fifo_gen_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_inst_fifo_gen_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_inst_fifo_gen_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_inst_fifo_gen_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_inst_fifo_gen_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_inst_fifo_gen_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_inst_fifo_gen_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_inst_fifo_gen_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_inst_fifo_gen_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_inst_fifo_gen_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_inst_fifo_gen_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_inst_fifo_gen_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_inst_fifo_gen_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_inst_fifo_gen_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_inst_fifo_gen_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(8 downto 0) => NLW_inst_fifo_gen_data_count_UNCONNECTED(8 downto 0),
      dbiterr => NLW_inst_fifo_gen_dbiterr_UNCONNECTED,
      din(7 downto 0) => din(7 downto 0),
      dout(7 downto 0) => dout(7 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_inst_fifo_gen_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_inst_fifo_gen_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_inst_fifo_gen_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_inst_fifo_gen_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_inst_fifo_gen_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_inst_fifo_gen_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_inst_fifo_gen_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_inst_fifo_gen_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_inst_fifo_gen_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_inst_fifo_gen_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_inst_fifo_gen_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_inst_fifo_gen_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_inst_fifo_gen_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_inst_fifo_gen_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_inst_fifo_gen_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_inst_fifo_gen_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_inst_fifo_gen_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_inst_fifo_gen_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_inst_fifo_gen_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_inst_fifo_gen_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_inst_fifo_gen_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_inst_fifo_gen_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_inst_fifo_gen_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_inst_fifo_gen_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_inst_fifo_gen_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_inst_fifo_gen_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_inst_fifo_gen_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_inst_fifo_gen_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_inst_fifo_gen_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_inst_fifo_gen_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_inst_fifo_gen_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_inst_fifo_gen_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_inst_fifo_gen_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_inst_fifo_gen_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_fifo_gen_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_inst_fifo_gen_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_inst_fifo_gen_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_inst_fifo_gen_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_inst_fifo_gen_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_inst_fifo_gen_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_inst_fifo_gen_overflow_UNCONNECTED,
      prog_empty => NLW_inst_fifo_gen_prog_empty_UNCONNECTED,
      prog_empty_thresh(8 downto 0) => B"000000000",
      prog_empty_thresh_assert(8 downto 0) => B"000000000",
      prog_empty_thresh_negate(8 downto 0) => B"000000000",
      prog_full => NLW_inst_fifo_gen_prog_full_UNCONNECTED,
      prog_full_thresh(8 downto 0) => B"000000000",
      prog_full_thresh_assert(8 downto 0) => B"000000000",
      prog_full_thresh_negate(8 downto 0) => B"000000000",
      rd_clk => rd_clk,
      rd_data_count(8 downto 0) => NLW_inst_fifo_gen_rd_data_count_UNCONNECTED(8 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => rd_rst_busy,
      rst => '0',
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_inst_fifo_gen_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_inst_fifo_gen_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_inst_fifo_gen_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_inst_fifo_gen_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_inst_fifo_gen_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_inst_fifo_gen_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_inst_fifo_gen_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_inst_fifo_gen_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_inst_fifo_gen_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_inst_fifo_gen_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_inst_fifo_gen_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_inst_fifo_gen_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_inst_fifo_gen_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_inst_fifo_gen_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_inst_fifo_gen_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => srst,
      underflow => NLW_inst_fifo_gen_underflow_UNCONNECTED,
      valid => valid,
      wr_ack => NLW_inst_fifo_gen_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(8 downto 0) => NLW_inst_fifo_gen_wr_data_count_UNCONNECTED(8 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_host_to_fpga_8x512 is
  port (
    srst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    rd_clk : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    wr_en : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 );
    full : out STD_LOGIC;
    empty : out STD_LOGIC;
    valid : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fifo_host_to_fpga_8x512 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of fifo_host_to_fpga_8x512 : entity is "fifo_host_to_fpga_8x512,fifo_generator_v13_1_1,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of fifo_host_to_fpga_8x512 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of fifo_host_to_fpga_8x512 : entity is "fifo_generator_v13_1_1,Vivado 2016.2";
end fifo_host_to_fpga_8x512;

architecture STRUCTURE of fifo_host_to_fpga_8x512 is
  signal NLW_U0_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_aw_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_b_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_r_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_w_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axis_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_arvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_awvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_bready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_rready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axi_wvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_m_axis_tvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_s_axis_tready_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_U0_axi_ar_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_ar_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_aw_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_b_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_U0_axi_r_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_r_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axi_w_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal NLW_U0_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_m_axi_araddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_arburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_arcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_arlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_arprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_arqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_arsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_aruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awaddr_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_m_axi_awburst_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_m_axi_awcache_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awlen_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_awlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_awprot_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awqos_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awregion_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_m_axi_awsize_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_m_axi_awuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_m_axi_wid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axi_wstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axi_wuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tdata_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_U0_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_U0_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal NLW_U0_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_buser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal NLW_U0_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_U0_s_axi_ruser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute C_ADD_NGC_CONSTRAINT : integer;
  attribute C_ADD_NGC_CONSTRAINT of U0 : label is 0;
  attribute C_APPLICATION_TYPE_AXIS : integer;
  attribute C_APPLICATION_TYPE_AXIS of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RACH : integer;
  attribute C_APPLICATION_TYPE_RACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_RDCH : integer;
  attribute C_APPLICATION_TYPE_RDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WACH : integer;
  attribute C_APPLICATION_TYPE_WACH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WDCH : integer;
  attribute C_APPLICATION_TYPE_WDCH of U0 : label is 0;
  attribute C_APPLICATION_TYPE_WRCH : integer;
  attribute C_APPLICATION_TYPE_WRCH of U0 : label is 0;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of U0 : label is 8;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of U0 : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of U0 : label is 1;
  attribute C_AXIS_TKEEP_WIDTH : integer;
  attribute C_AXIS_TKEEP_WIDTH of U0 : label is 1;
  attribute C_AXIS_TSTRB_WIDTH : integer;
  attribute C_AXIS_TSTRB_WIDTH of U0 : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of U0 : label is 4;
  attribute C_AXIS_TYPE : integer;
  attribute C_AXIS_TYPE of U0 : label is 0;
  attribute C_AXI_ADDR_WIDTH : integer;
  attribute C_AXI_ADDR_WIDTH of U0 : label is 32;
  attribute C_AXI_ARUSER_WIDTH : integer;
  attribute C_AXI_ARUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_AWUSER_WIDTH : integer;
  attribute C_AXI_AWUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_BUSER_WIDTH : integer;
  attribute C_AXI_BUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_DATA_WIDTH : integer;
  attribute C_AXI_DATA_WIDTH of U0 : label is 64;
  attribute C_AXI_ID_WIDTH : integer;
  attribute C_AXI_ID_WIDTH of U0 : label is 1;
  attribute C_AXI_LEN_WIDTH : integer;
  attribute C_AXI_LEN_WIDTH of U0 : label is 8;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of U0 : label is 1;
  attribute C_AXI_RUSER_WIDTH : integer;
  attribute C_AXI_RUSER_WIDTH of U0 : label is 1;
  attribute C_AXI_TYPE : integer;
  attribute C_AXI_TYPE of U0 : label is 1;
  attribute C_AXI_WUSER_WIDTH : integer;
  attribute C_AXI_WUSER_WIDTH of U0 : label is 1;
  attribute C_COMMON_CLOCK : integer;
  attribute C_COMMON_CLOCK of U0 : label is 0;
  attribute C_COUNT_TYPE : integer;
  attribute C_COUNT_TYPE of U0 : label is 0;
  attribute C_DATA_COUNT_WIDTH : integer;
  attribute C_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_DEFAULT_VALUE : string;
  attribute C_DEFAULT_VALUE of U0 : label is "BlankString";
  attribute C_DIN_WIDTH : integer;
  attribute C_DIN_WIDTH of U0 : label is 8;
  attribute C_DIN_WIDTH_AXIS : integer;
  attribute C_DIN_WIDTH_AXIS of U0 : label is 1;
  attribute C_DIN_WIDTH_RACH : integer;
  attribute C_DIN_WIDTH_RACH of U0 : label is 32;
  attribute C_DIN_WIDTH_RDCH : integer;
  attribute C_DIN_WIDTH_RDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WACH : integer;
  attribute C_DIN_WIDTH_WACH of U0 : label is 1;
  attribute C_DIN_WIDTH_WDCH : integer;
  attribute C_DIN_WIDTH_WDCH of U0 : label is 64;
  attribute C_DIN_WIDTH_WRCH : integer;
  attribute C_DIN_WIDTH_WRCH of U0 : label is 2;
  attribute C_DOUT_RST_VAL : string;
  attribute C_DOUT_RST_VAL of U0 : label is "0";
  attribute C_DOUT_WIDTH : integer;
  attribute C_DOUT_WIDTH of U0 : label is 8;
  attribute C_ENABLE_RLOCS : integer;
  attribute C_ENABLE_RLOCS of U0 : label is 0;
  attribute C_ENABLE_RST_SYNC : integer;
  attribute C_ENABLE_RST_SYNC of U0 : label is 1;
  attribute C_EN_SAFETY_CKT : integer;
  attribute C_EN_SAFETY_CKT of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE : integer;
  attribute C_ERROR_INJECTION_TYPE of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_AXIS : integer;
  attribute C_ERROR_INJECTION_TYPE_AXIS of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RACH : integer;
  attribute C_ERROR_INJECTION_TYPE_RACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_RDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_RDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WACH : integer;
  attribute C_ERROR_INJECTION_TYPE_WACH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WDCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WDCH of U0 : label is 0;
  attribute C_ERROR_INJECTION_TYPE_WRCH : integer;
  attribute C_ERROR_INJECTION_TYPE_WRCH of U0 : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtexu";
  attribute C_FULL_FLAGS_RST_VAL : integer;
  attribute C_FULL_FLAGS_RST_VAL of U0 : label is 0;
  attribute C_HAS_ALMOST_EMPTY : integer;
  attribute C_HAS_ALMOST_EMPTY of U0 : label is 0;
  attribute C_HAS_ALMOST_FULL : integer;
  attribute C_HAS_ALMOST_FULL of U0 : label is 0;
  attribute C_HAS_AXIS_TDATA : integer;
  attribute C_HAS_AXIS_TDATA of U0 : label is 1;
  attribute C_HAS_AXIS_TDEST : integer;
  attribute C_HAS_AXIS_TDEST of U0 : label is 0;
  attribute C_HAS_AXIS_TID : integer;
  attribute C_HAS_AXIS_TID of U0 : label is 0;
  attribute C_HAS_AXIS_TKEEP : integer;
  attribute C_HAS_AXIS_TKEEP of U0 : label is 0;
  attribute C_HAS_AXIS_TLAST : integer;
  attribute C_HAS_AXIS_TLAST of U0 : label is 0;
  attribute C_HAS_AXIS_TREADY : integer;
  attribute C_HAS_AXIS_TREADY of U0 : label is 1;
  attribute C_HAS_AXIS_TSTRB : integer;
  attribute C_HAS_AXIS_TSTRB of U0 : label is 0;
  attribute C_HAS_AXIS_TUSER : integer;
  attribute C_HAS_AXIS_TUSER of U0 : label is 1;
  attribute C_HAS_AXI_ARUSER : integer;
  attribute C_HAS_AXI_ARUSER of U0 : label is 0;
  attribute C_HAS_AXI_AWUSER : integer;
  attribute C_HAS_AXI_AWUSER of U0 : label is 0;
  attribute C_HAS_AXI_BUSER : integer;
  attribute C_HAS_AXI_BUSER of U0 : label is 0;
  attribute C_HAS_AXI_ID : integer;
  attribute C_HAS_AXI_ID of U0 : label is 0;
  attribute C_HAS_AXI_RD_CHANNEL : integer;
  attribute C_HAS_AXI_RD_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_RUSER : integer;
  attribute C_HAS_AXI_RUSER of U0 : label is 0;
  attribute C_HAS_AXI_WR_CHANNEL : integer;
  attribute C_HAS_AXI_WR_CHANNEL of U0 : label is 1;
  attribute C_HAS_AXI_WUSER : integer;
  attribute C_HAS_AXI_WUSER of U0 : label is 0;
  attribute C_HAS_BACKUP : integer;
  attribute C_HAS_BACKUP of U0 : label is 0;
  attribute C_HAS_DATA_COUNT : integer;
  attribute C_HAS_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_AXIS : integer;
  attribute C_HAS_DATA_COUNTS_AXIS of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RACH : integer;
  attribute C_HAS_DATA_COUNTS_RACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_RDCH : integer;
  attribute C_HAS_DATA_COUNTS_RDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WACH : integer;
  attribute C_HAS_DATA_COUNTS_WACH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WDCH : integer;
  attribute C_HAS_DATA_COUNTS_WDCH of U0 : label is 0;
  attribute C_HAS_DATA_COUNTS_WRCH : integer;
  attribute C_HAS_DATA_COUNTS_WRCH of U0 : label is 0;
  attribute C_HAS_INT_CLK : integer;
  attribute C_HAS_INT_CLK of U0 : label is 0;
  attribute C_HAS_MASTER_CE : integer;
  attribute C_HAS_MASTER_CE of U0 : label is 0;
  attribute C_HAS_MEMINIT_FILE : integer;
  attribute C_HAS_MEMINIT_FILE of U0 : label is 0;
  attribute C_HAS_OVERFLOW : integer;
  attribute C_HAS_OVERFLOW of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_AXIS : integer;
  attribute C_HAS_PROG_FLAGS_AXIS of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RACH : integer;
  attribute C_HAS_PROG_FLAGS_RACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_RDCH : integer;
  attribute C_HAS_PROG_FLAGS_RDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WACH : integer;
  attribute C_HAS_PROG_FLAGS_WACH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WDCH : integer;
  attribute C_HAS_PROG_FLAGS_WDCH of U0 : label is 0;
  attribute C_HAS_PROG_FLAGS_WRCH : integer;
  attribute C_HAS_PROG_FLAGS_WRCH of U0 : label is 0;
  attribute C_HAS_RD_DATA_COUNT : integer;
  attribute C_HAS_RD_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_RD_RST : integer;
  attribute C_HAS_RD_RST of U0 : label is 0;
  attribute C_HAS_RST : integer;
  attribute C_HAS_RST of U0 : label is 0;
  attribute C_HAS_SLAVE_CE : integer;
  attribute C_HAS_SLAVE_CE of U0 : label is 0;
  attribute C_HAS_SRST : integer;
  attribute C_HAS_SRST of U0 : label is 1;
  attribute C_HAS_UNDERFLOW : integer;
  attribute C_HAS_UNDERFLOW of U0 : label is 0;
  attribute C_HAS_VALID : integer;
  attribute C_HAS_VALID of U0 : label is 1;
  attribute C_HAS_WR_ACK : integer;
  attribute C_HAS_WR_ACK of U0 : label is 0;
  attribute C_HAS_WR_DATA_COUNT : integer;
  attribute C_HAS_WR_DATA_COUNT of U0 : label is 0;
  attribute C_HAS_WR_RST : integer;
  attribute C_HAS_WR_RST of U0 : label is 0;
  attribute C_IMPLEMENTATION_TYPE : integer;
  attribute C_IMPLEMENTATION_TYPE of U0 : label is 6;
  attribute C_IMPLEMENTATION_TYPE_AXIS : integer;
  attribute C_IMPLEMENTATION_TYPE_AXIS of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RACH : integer;
  attribute C_IMPLEMENTATION_TYPE_RACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_RDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_RDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WACH : integer;
  attribute C_IMPLEMENTATION_TYPE_WACH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WDCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WDCH of U0 : label is 1;
  attribute C_IMPLEMENTATION_TYPE_WRCH : integer;
  attribute C_IMPLEMENTATION_TYPE_WRCH of U0 : label is 1;
  attribute C_INIT_WR_PNTR_VAL : integer;
  attribute C_INIT_WR_PNTR_VAL of U0 : label is 0;
  attribute C_INTERFACE_TYPE : integer;
  attribute C_INTERFACE_TYPE of U0 : label is 0;
  attribute C_MEMORY_TYPE : integer;
  attribute C_MEMORY_TYPE of U0 : label is 4;
  attribute C_MIF_FILE_NAME : string;
  attribute C_MIF_FILE_NAME of U0 : label is "BlankString";
  attribute C_MSGON_VAL : integer;
  attribute C_MSGON_VAL of U0 : label is 1;
  attribute C_OPTIMIZATION_MODE : integer;
  attribute C_OPTIMIZATION_MODE of U0 : label is 0;
  attribute C_OVERFLOW_LOW : integer;
  attribute C_OVERFLOW_LOW of U0 : label is 0;
  attribute C_POWER_SAVING_MODE : integer;
  attribute C_POWER_SAVING_MODE of U0 : label is 0;
  attribute C_PRELOAD_LATENCY : integer;
  attribute C_PRELOAD_LATENCY of U0 : label is 2;
  attribute C_PRELOAD_REGS : integer;
  attribute C_PRELOAD_REGS of U0 : label is 1;
  attribute C_PRIM_FIFO_TYPE : string;
  attribute C_PRIM_FIFO_TYPE of U0 : label is "512x36";
  attribute C_PRIM_FIFO_TYPE_AXIS : string;
  attribute C_PRIM_FIFO_TYPE_AXIS of U0 : label is "1kx18";
  attribute C_PRIM_FIFO_TYPE_RACH : string;
  attribute C_PRIM_FIFO_TYPE_RACH of U0 : label is "1kx36";
  attribute C_PRIM_FIFO_TYPE_RDCH : string;
  attribute C_PRIM_FIFO_TYPE_RDCH of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WACH : string;
  attribute C_PRIM_FIFO_TYPE_WACH of U0 : label is "8kx4";
  attribute C_PRIM_FIFO_TYPE_WDCH : string;
  attribute C_PRIM_FIFO_TYPE_WDCH of U0 : label is "512x72";
  attribute C_PRIM_FIFO_TYPE_WRCH : string;
  attribute C_PRIM_FIFO_TYPE_WRCH of U0 : label is "8kx4";
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL of U0 : label is 5;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH of U0 : label is 1022;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_EMPTY_THRESH_NEGATE_VAL of U0 : label is 6;
  attribute C_PROG_EMPTY_TYPE : integer;
  attribute C_PROG_EMPTY_TYPE of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_AXIS : integer;
  attribute C_PROG_EMPTY_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RACH : integer;
  attribute C_PROG_EMPTY_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_RDCH : integer;
  attribute C_PROG_EMPTY_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WACH : integer;
  attribute C_PROG_EMPTY_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WDCH : integer;
  attribute C_PROG_EMPTY_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_EMPTY_TYPE_WRCH : integer;
  attribute C_PROG_EMPTY_TYPE_WRCH of U0 : label is 0;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL of U0 : label is 511;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_AXIS of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_RDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WACH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WDCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH : integer;
  attribute C_PROG_FULL_THRESH_ASSERT_VAL_WRCH of U0 : label is 1023;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL : integer;
  attribute C_PROG_FULL_THRESH_NEGATE_VAL of U0 : label is 510;
  attribute C_PROG_FULL_TYPE : integer;
  attribute C_PROG_FULL_TYPE of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_AXIS : integer;
  attribute C_PROG_FULL_TYPE_AXIS of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RACH : integer;
  attribute C_PROG_FULL_TYPE_RACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_RDCH : integer;
  attribute C_PROG_FULL_TYPE_RDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WACH : integer;
  attribute C_PROG_FULL_TYPE_WACH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WDCH : integer;
  attribute C_PROG_FULL_TYPE_WDCH of U0 : label is 0;
  attribute C_PROG_FULL_TYPE_WRCH : integer;
  attribute C_PROG_FULL_TYPE_WRCH of U0 : label is 0;
  attribute C_RACH_TYPE : integer;
  attribute C_RACH_TYPE of U0 : label is 0;
  attribute C_RDCH_TYPE : integer;
  attribute C_RDCH_TYPE of U0 : label is 0;
  attribute C_RD_DATA_COUNT_WIDTH : integer;
  attribute C_RD_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_RD_DEPTH : integer;
  attribute C_RD_DEPTH of U0 : label is 512;
  attribute C_RD_FREQ : integer;
  attribute C_RD_FREQ of U0 : label is 50;
  attribute C_RD_PNTR_WIDTH : integer;
  attribute C_RD_PNTR_WIDTH of U0 : label is 9;
  attribute C_REG_SLICE_MODE_AXIS : integer;
  attribute C_REG_SLICE_MODE_AXIS of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RACH : integer;
  attribute C_REG_SLICE_MODE_RACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_RDCH : integer;
  attribute C_REG_SLICE_MODE_RDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WACH : integer;
  attribute C_REG_SLICE_MODE_WACH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WDCH : integer;
  attribute C_REG_SLICE_MODE_WDCH of U0 : label is 0;
  attribute C_REG_SLICE_MODE_WRCH : integer;
  attribute C_REG_SLICE_MODE_WRCH of U0 : label is 0;
  attribute C_SELECT_XPM : integer;
  attribute C_SELECT_XPM of U0 : label is 0;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of U0 : label is 2;
  attribute C_UNDERFLOW_LOW : integer;
  attribute C_UNDERFLOW_LOW of U0 : label is 0;
  attribute C_USE_COMMON_OVERFLOW : integer;
  attribute C_USE_COMMON_OVERFLOW of U0 : label is 0;
  attribute C_USE_COMMON_UNDERFLOW : integer;
  attribute C_USE_COMMON_UNDERFLOW of U0 : label is 0;
  attribute C_USE_DEFAULT_SETTINGS : integer;
  attribute C_USE_DEFAULT_SETTINGS of U0 : label is 0;
  attribute C_USE_DOUT_RST : integer;
  attribute C_USE_DOUT_RST of U0 : label is 1;
  attribute C_USE_ECC : integer;
  attribute C_USE_ECC of U0 : label is 0;
  attribute C_USE_ECC_AXIS : integer;
  attribute C_USE_ECC_AXIS of U0 : label is 0;
  attribute C_USE_ECC_RACH : integer;
  attribute C_USE_ECC_RACH of U0 : label is 0;
  attribute C_USE_ECC_RDCH : integer;
  attribute C_USE_ECC_RDCH of U0 : label is 0;
  attribute C_USE_ECC_WACH : integer;
  attribute C_USE_ECC_WACH of U0 : label is 0;
  attribute C_USE_ECC_WDCH : integer;
  attribute C_USE_ECC_WDCH of U0 : label is 0;
  attribute C_USE_ECC_WRCH : integer;
  attribute C_USE_ECC_WRCH of U0 : label is 0;
  attribute C_USE_EMBEDDED_REG : integer;
  attribute C_USE_EMBEDDED_REG of U0 : label is 1;
  attribute C_USE_FIFO16_FLAGS : integer;
  attribute C_USE_FIFO16_FLAGS of U0 : label is 0;
  attribute C_USE_FWFT_DATA_COUNT : integer;
  attribute C_USE_FWFT_DATA_COUNT of U0 : label is 0;
  attribute C_USE_PIPELINE_REG : integer;
  attribute C_USE_PIPELINE_REG of U0 : label is 0;
  attribute C_VALID_LOW : integer;
  attribute C_VALID_LOW of U0 : label is 0;
  attribute C_WACH_TYPE : integer;
  attribute C_WACH_TYPE of U0 : label is 0;
  attribute C_WDCH_TYPE : integer;
  attribute C_WDCH_TYPE of U0 : label is 0;
  attribute C_WRCH_TYPE : integer;
  attribute C_WRCH_TYPE of U0 : label is 0;
  attribute C_WR_ACK_LOW : integer;
  attribute C_WR_ACK_LOW of U0 : label is 0;
  attribute C_WR_DATA_COUNT_WIDTH : integer;
  attribute C_WR_DATA_COUNT_WIDTH of U0 : label is 9;
  attribute C_WR_DEPTH : integer;
  attribute C_WR_DEPTH of U0 : label is 512;
  attribute C_WR_DEPTH_AXIS : integer;
  attribute C_WR_DEPTH_AXIS of U0 : label is 1024;
  attribute C_WR_DEPTH_RACH : integer;
  attribute C_WR_DEPTH_RACH of U0 : label is 16;
  attribute C_WR_DEPTH_RDCH : integer;
  attribute C_WR_DEPTH_RDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WACH : integer;
  attribute C_WR_DEPTH_WACH of U0 : label is 16;
  attribute C_WR_DEPTH_WDCH : integer;
  attribute C_WR_DEPTH_WDCH of U0 : label is 1024;
  attribute C_WR_DEPTH_WRCH : integer;
  attribute C_WR_DEPTH_WRCH of U0 : label is 16;
  attribute C_WR_FREQ : integer;
  attribute C_WR_FREQ of U0 : label is 100;
  attribute C_WR_PNTR_WIDTH : integer;
  attribute C_WR_PNTR_WIDTH of U0 : label is 9;
  attribute C_WR_PNTR_WIDTH_AXIS : integer;
  attribute C_WR_PNTR_WIDTH_AXIS of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_RACH : integer;
  attribute C_WR_PNTR_WIDTH_RACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_RDCH : integer;
  attribute C_WR_PNTR_WIDTH_RDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WACH : integer;
  attribute C_WR_PNTR_WIDTH_WACH of U0 : label is 4;
  attribute C_WR_PNTR_WIDTH_WDCH : integer;
  attribute C_WR_PNTR_WIDTH_WDCH of U0 : label is 10;
  attribute C_WR_PNTR_WIDTH_WRCH : integer;
  attribute C_WR_PNTR_WIDTH_WRCH of U0 : label is 4;
  attribute C_WR_RESPONSE_LATENCY : integer;
  attribute C_WR_RESPONSE_LATENCY of U0 : label is 1;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "true";
begin
U0: entity work.fifo_host_to_fpga_8x512_fifo_generator_v13_1_1
     port map (
      almost_empty => NLW_U0_almost_empty_UNCONNECTED,
      almost_full => NLW_U0_almost_full_UNCONNECTED,
      axi_ar_data_count(4 downto 0) => NLW_U0_axi_ar_data_count_UNCONNECTED(4 downto 0),
      axi_ar_dbiterr => NLW_U0_axi_ar_dbiterr_UNCONNECTED,
      axi_ar_injectdbiterr => '0',
      axi_ar_injectsbiterr => '0',
      axi_ar_overflow => NLW_U0_axi_ar_overflow_UNCONNECTED,
      axi_ar_prog_empty => NLW_U0_axi_ar_prog_empty_UNCONNECTED,
      axi_ar_prog_empty_thresh(3 downto 0) => B"0000",
      axi_ar_prog_full => NLW_U0_axi_ar_prog_full_UNCONNECTED,
      axi_ar_prog_full_thresh(3 downto 0) => B"0000",
      axi_ar_rd_data_count(4 downto 0) => NLW_U0_axi_ar_rd_data_count_UNCONNECTED(4 downto 0),
      axi_ar_sbiterr => NLW_U0_axi_ar_sbiterr_UNCONNECTED,
      axi_ar_underflow => NLW_U0_axi_ar_underflow_UNCONNECTED,
      axi_ar_wr_data_count(4 downto 0) => NLW_U0_axi_ar_wr_data_count_UNCONNECTED(4 downto 0),
      axi_aw_data_count(4 downto 0) => NLW_U0_axi_aw_data_count_UNCONNECTED(4 downto 0),
      axi_aw_dbiterr => NLW_U0_axi_aw_dbiterr_UNCONNECTED,
      axi_aw_injectdbiterr => '0',
      axi_aw_injectsbiterr => '0',
      axi_aw_overflow => NLW_U0_axi_aw_overflow_UNCONNECTED,
      axi_aw_prog_empty => NLW_U0_axi_aw_prog_empty_UNCONNECTED,
      axi_aw_prog_empty_thresh(3 downto 0) => B"0000",
      axi_aw_prog_full => NLW_U0_axi_aw_prog_full_UNCONNECTED,
      axi_aw_prog_full_thresh(3 downto 0) => B"0000",
      axi_aw_rd_data_count(4 downto 0) => NLW_U0_axi_aw_rd_data_count_UNCONNECTED(4 downto 0),
      axi_aw_sbiterr => NLW_U0_axi_aw_sbiterr_UNCONNECTED,
      axi_aw_underflow => NLW_U0_axi_aw_underflow_UNCONNECTED,
      axi_aw_wr_data_count(4 downto 0) => NLW_U0_axi_aw_wr_data_count_UNCONNECTED(4 downto 0),
      axi_b_data_count(4 downto 0) => NLW_U0_axi_b_data_count_UNCONNECTED(4 downto 0),
      axi_b_dbiterr => NLW_U0_axi_b_dbiterr_UNCONNECTED,
      axi_b_injectdbiterr => '0',
      axi_b_injectsbiterr => '0',
      axi_b_overflow => NLW_U0_axi_b_overflow_UNCONNECTED,
      axi_b_prog_empty => NLW_U0_axi_b_prog_empty_UNCONNECTED,
      axi_b_prog_empty_thresh(3 downto 0) => B"0000",
      axi_b_prog_full => NLW_U0_axi_b_prog_full_UNCONNECTED,
      axi_b_prog_full_thresh(3 downto 0) => B"0000",
      axi_b_rd_data_count(4 downto 0) => NLW_U0_axi_b_rd_data_count_UNCONNECTED(4 downto 0),
      axi_b_sbiterr => NLW_U0_axi_b_sbiterr_UNCONNECTED,
      axi_b_underflow => NLW_U0_axi_b_underflow_UNCONNECTED,
      axi_b_wr_data_count(4 downto 0) => NLW_U0_axi_b_wr_data_count_UNCONNECTED(4 downto 0),
      axi_r_data_count(10 downto 0) => NLW_U0_axi_r_data_count_UNCONNECTED(10 downto 0),
      axi_r_dbiterr => NLW_U0_axi_r_dbiterr_UNCONNECTED,
      axi_r_injectdbiterr => '0',
      axi_r_injectsbiterr => '0',
      axi_r_overflow => NLW_U0_axi_r_overflow_UNCONNECTED,
      axi_r_prog_empty => NLW_U0_axi_r_prog_empty_UNCONNECTED,
      axi_r_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_r_prog_full => NLW_U0_axi_r_prog_full_UNCONNECTED,
      axi_r_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_r_rd_data_count(10 downto 0) => NLW_U0_axi_r_rd_data_count_UNCONNECTED(10 downto 0),
      axi_r_sbiterr => NLW_U0_axi_r_sbiterr_UNCONNECTED,
      axi_r_underflow => NLW_U0_axi_r_underflow_UNCONNECTED,
      axi_r_wr_data_count(10 downto 0) => NLW_U0_axi_r_wr_data_count_UNCONNECTED(10 downto 0),
      axi_w_data_count(10 downto 0) => NLW_U0_axi_w_data_count_UNCONNECTED(10 downto 0),
      axi_w_dbiterr => NLW_U0_axi_w_dbiterr_UNCONNECTED,
      axi_w_injectdbiterr => '0',
      axi_w_injectsbiterr => '0',
      axi_w_overflow => NLW_U0_axi_w_overflow_UNCONNECTED,
      axi_w_prog_empty => NLW_U0_axi_w_prog_empty_UNCONNECTED,
      axi_w_prog_empty_thresh(9 downto 0) => B"0000000000",
      axi_w_prog_full => NLW_U0_axi_w_prog_full_UNCONNECTED,
      axi_w_prog_full_thresh(9 downto 0) => B"0000000000",
      axi_w_rd_data_count(10 downto 0) => NLW_U0_axi_w_rd_data_count_UNCONNECTED(10 downto 0),
      axi_w_sbiterr => NLW_U0_axi_w_sbiterr_UNCONNECTED,
      axi_w_underflow => NLW_U0_axi_w_underflow_UNCONNECTED,
      axi_w_wr_data_count(10 downto 0) => NLW_U0_axi_w_wr_data_count_UNCONNECTED(10 downto 0),
      axis_data_count(10 downto 0) => NLW_U0_axis_data_count_UNCONNECTED(10 downto 0),
      axis_dbiterr => NLW_U0_axis_dbiterr_UNCONNECTED,
      axis_injectdbiterr => '0',
      axis_injectsbiterr => '0',
      axis_overflow => NLW_U0_axis_overflow_UNCONNECTED,
      axis_prog_empty => NLW_U0_axis_prog_empty_UNCONNECTED,
      axis_prog_empty_thresh(9 downto 0) => B"0000000000",
      axis_prog_full => NLW_U0_axis_prog_full_UNCONNECTED,
      axis_prog_full_thresh(9 downto 0) => B"0000000000",
      axis_rd_data_count(10 downto 0) => NLW_U0_axis_rd_data_count_UNCONNECTED(10 downto 0),
      axis_sbiterr => NLW_U0_axis_sbiterr_UNCONNECTED,
      axis_underflow => NLW_U0_axis_underflow_UNCONNECTED,
      axis_wr_data_count(10 downto 0) => NLW_U0_axis_wr_data_count_UNCONNECTED(10 downto 0),
      backup => '0',
      backup_marker => '0',
      clk => '0',
      data_count(8 downto 0) => NLW_U0_data_count_UNCONNECTED(8 downto 0),
      dbiterr => NLW_U0_dbiterr_UNCONNECTED,
      din(7 downto 0) => din(7 downto 0),
      dout(7 downto 0) => dout(7 downto 0),
      empty => empty,
      full => full,
      injectdbiterr => '0',
      injectsbiterr => '0',
      int_clk => '0',
      m_aclk => '0',
      m_aclk_en => '0',
      m_axi_araddr(31 downto 0) => NLW_U0_m_axi_araddr_UNCONNECTED(31 downto 0),
      m_axi_arburst(1 downto 0) => NLW_U0_m_axi_arburst_UNCONNECTED(1 downto 0),
      m_axi_arcache(3 downto 0) => NLW_U0_m_axi_arcache_UNCONNECTED(3 downto 0),
      m_axi_arid(0) => NLW_U0_m_axi_arid_UNCONNECTED(0),
      m_axi_arlen(7 downto 0) => NLW_U0_m_axi_arlen_UNCONNECTED(7 downto 0),
      m_axi_arlock(0) => NLW_U0_m_axi_arlock_UNCONNECTED(0),
      m_axi_arprot(2 downto 0) => NLW_U0_m_axi_arprot_UNCONNECTED(2 downto 0),
      m_axi_arqos(3 downto 0) => NLW_U0_m_axi_arqos_UNCONNECTED(3 downto 0),
      m_axi_arready => '0',
      m_axi_arregion(3 downto 0) => NLW_U0_m_axi_arregion_UNCONNECTED(3 downto 0),
      m_axi_arsize(2 downto 0) => NLW_U0_m_axi_arsize_UNCONNECTED(2 downto 0),
      m_axi_aruser(0) => NLW_U0_m_axi_aruser_UNCONNECTED(0),
      m_axi_arvalid => NLW_U0_m_axi_arvalid_UNCONNECTED,
      m_axi_awaddr(31 downto 0) => NLW_U0_m_axi_awaddr_UNCONNECTED(31 downto 0),
      m_axi_awburst(1 downto 0) => NLW_U0_m_axi_awburst_UNCONNECTED(1 downto 0),
      m_axi_awcache(3 downto 0) => NLW_U0_m_axi_awcache_UNCONNECTED(3 downto 0),
      m_axi_awid(0) => NLW_U0_m_axi_awid_UNCONNECTED(0),
      m_axi_awlen(7 downto 0) => NLW_U0_m_axi_awlen_UNCONNECTED(7 downto 0),
      m_axi_awlock(0) => NLW_U0_m_axi_awlock_UNCONNECTED(0),
      m_axi_awprot(2 downto 0) => NLW_U0_m_axi_awprot_UNCONNECTED(2 downto 0),
      m_axi_awqos(3 downto 0) => NLW_U0_m_axi_awqos_UNCONNECTED(3 downto 0),
      m_axi_awready => '0',
      m_axi_awregion(3 downto 0) => NLW_U0_m_axi_awregion_UNCONNECTED(3 downto 0),
      m_axi_awsize(2 downto 0) => NLW_U0_m_axi_awsize_UNCONNECTED(2 downto 0),
      m_axi_awuser(0) => NLW_U0_m_axi_awuser_UNCONNECTED(0),
      m_axi_awvalid => NLW_U0_m_axi_awvalid_UNCONNECTED,
      m_axi_bid(0) => '0',
      m_axi_bready => NLW_U0_m_axi_bready_UNCONNECTED,
      m_axi_bresp(1 downto 0) => B"00",
      m_axi_buser(0) => '0',
      m_axi_bvalid => '0',
      m_axi_rdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      m_axi_rid(0) => '0',
      m_axi_rlast => '0',
      m_axi_rready => NLW_U0_m_axi_rready_UNCONNECTED,
      m_axi_rresp(1 downto 0) => B"00",
      m_axi_ruser(0) => '0',
      m_axi_rvalid => '0',
      m_axi_wdata(63 downto 0) => NLW_U0_m_axi_wdata_UNCONNECTED(63 downto 0),
      m_axi_wid(0) => NLW_U0_m_axi_wid_UNCONNECTED(0),
      m_axi_wlast => NLW_U0_m_axi_wlast_UNCONNECTED,
      m_axi_wready => '0',
      m_axi_wstrb(7 downto 0) => NLW_U0_m_axi_wstrb_UNCONNECTED(7 downto 0),
      m_axi_wuser(0) => NLW_U0_m_axi_wuser_UNCONNECTED(0),
      m_axi_wvalid => NLW_U0_m_axi_wvalid_UNCONNECTED,
      m_axis_tdata(7 downto 0) => NLW_U0_m_axis_tdata_UNCONNECTED(7 downto 0),
      m_axis_tdest(0) => NLW_U0_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_U0_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(0) => NLW_U0_m_axis_tkeep_UNCONNECTED(0),
      m_axis_tlast => NLW_U0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => '0',
      m_axis_tstrb(0) => NLW_U0_m_axis_tstrb_UNCONNECTED(0),
      m_axis_tuser(3 downto 0) => NLW_U0_m_axis_tuser_UNCONNECTED(3 downto 0),
      m_axis_tvalid => NLW_U0_m_axis_tvalid_UNCONNECTED,
      overflow => NLW_U0_overflow_UNCONNECTED,
      prog_empty => NLW_U0_prog_empty_UNCONNECTED,
      prog_empty_thresh(8 downto 0) => B"000000000",
      prog_empty_thresh_assert(8 downto 0) => B"000000000",
      prog_empty_thresh_negate(8 downto 0) => B"000000000",
      prog_full => NLW_U0_prog_full_UNCONNECTED,
      prog_full_thresh(8 downto 0) => B"000000000",
      prog_full_thresh_assert(8 downto 0) => B"000000000",
      prog_full_thresh_negate(8 downto 0) => B"000000000",
      rd_clk => rd_clk,
      rd_data_count(8 downto 0) => NLW_U0_rd_data_count_UNCONNECTED(8 downto 0),
      rd_en => rd_en,
      rd_rst => '0',
      rd_rst_busy => rd_rst_busy,
      rst => '0',
      s_aclk => '0',
      s_aclk_en => '0',
      s_aresetn => '0',
      s_axi_araddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_arcache(3 downto 0) => B"0000",
      s_axi_arid(0) => '0',
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arlock(0) => '0',
      s_axi_arprot(2 downto 0) => B"000",
      s_axi_arqos(3 downto 0) => B"0000",
      s_axi_arready => NLW_U0_s_axi_arready_UNCONNECTED,
      s_axi_arregion(3 downto 0) => B"0000",
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_aruser(0) => '0',
      s_axi_arvalid => '0',
      s_axi_awaddr(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awcache(3 downto 0) => B"0000",
      s_axi_awid(0) => '0',
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awlock(0) => '0',
      s_axi_awprot(2 downto 0) => B"000",
      s_axi_awqos(3 downto 0) => B"0000",
      s_axi_awready => NLW_U0_s_axi_awready_UNCONNECTED,
      s_axi_awregion(3 downto 0) => B"0000",
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awuser(0) => '0',
      s_axi_awvalid => '0',
      s_axi_bid(0) => NLW_U0_s_axi_bid_UNCONNECTED(0),
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_U0_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_buser(0) => NLW_U0_s_axi_buser_UNCONNECTED(0),
      s_axi_bvalid => NLW_U0_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(63 downto 0) => NLW_U0_s_axi_rdata_UNCONNECTED(63 downto 0),
      s_axi_rid(0) => NLW_U0_s_axi_rid_UNCONNECTED(0),
      s_axi_rlast => NLW_U0_s_axi_rlast_UNCONNECTED,
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_U0_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_ruser(0) => NLW_U0_s_axi_ruser_UNCONNECTED(0),
      s_axi_rvalid => NLW_U0_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(63 downto 0) => B"0000000000000000000000000000000000000000000000000000000000000000",
      s_axi_wid(0) => '0',
      s_axi_wlast => '0',
      s_axi_wready => NLW_U0_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(7 downto 0) => B"00000000",
      s_axi_wuser(0) => '0',
      s_axi_wvalid => '0',
      s_axis_tdata(7 downto 0) => B"00000000",
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(0) => '0',
      s_axis_tlast => '0',
      s_axis_tready => NLW_U0_s_axis_tready_UNCONNECTED,
      s_axis_tstrb(0) => '0',
      s_axis_tuser(3 downto 0) => B"0000",
      s_axis_tvalid => '0',
      sbiterr => NLW_U0_sbiterr_UNCONNECTED,
      sleep => '0',
      srst => srst,
      underflow => NLW_U0_underflow_UNCONNECTED,
      valid => valid,
      wr_ack => NLW_U0_wr_ack_UNCONNECTED,
      wr_clk => wr_clk,
      wr_data_count(8 downto 0) => NLW_U0_wr_data_count_UNCONNECTED(8 downto 0),
      wr_en => wr_en,
      wr_rst => '0',
      wr_rst_busy => wr_rst_busy
    );
end STRUCTURE;
