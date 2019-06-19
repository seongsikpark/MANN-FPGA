-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Mon Aug 21 15:53:04 2017
-- Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/00_work/00_project/01_MemN2N/02_HW/MemN2N/MemN2N.runs/fifo_host_to_fpga_8x512_synth_1/fifo_host_to_fpga_8x512_stub.vhdl
-- Design      : fifo_host_to_fpga_8x512
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu095-ffva2104-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fifo_host_to_fpga_8x512 is
  Port ( 
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

end fifo_host_to_fpga_8x512;

architecture stub of fifo_host_to_fpga_8x512 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "srst,wr_clk,rd_clk,din[7:0],wr_en,rd_en,dout[7:0],full,empty,valid,wr_rst_busy,rd_rst_busy";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "fifo_generator_v13_1_1,Vivado 2016.2";
begin
end;
