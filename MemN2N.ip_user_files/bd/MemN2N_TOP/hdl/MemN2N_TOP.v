//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.4.1 (win64) Build 1431336 Fri Dec 11 14:52:45 MST 2015
//Date        : Tue May 10 13:35:40 2016
//Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
//Command     : generate_target MemN2N_TOP.bd
//Design      : MemN2N_TOP
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* HW_HANDOFF = "MemN2N_TOP.hwdef" *) (* core_generation_info = "MemN2N_TOP,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=MemN2N_TOP,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,da_board_cnt=2,synth_mode=Global}" *) 
module MemN2N_TOP
   (data_in,
    data_out,
    en,
    en_init,
    f_w_up,
    reset,
    user_prog_clock_0_clk_n,
    user_prog_clock_0_clk_p,
    we_query,
    we_sen);
  input [15:0]data_in;
  output [127:0]data_out;
  input en;
  input en_init;
  input f_w_up;
  input reset;
  input user_prog_clock_0_clk_n;
  input user_prog_clock_0_clk_p;
  input we_query;
  input we_sen;

  wire [127:0]MemN2N_0_data_out;
  wire clk_wiz_0_clk_out1;
  wire [15:0]data_in_1;
  wire en_1;
  wire en_init_1;
  wire f_w_up_1;
  wire proc_sys_reset_0_mb_reset;
  wire reset_1;
  wire user_prog_clock_0_1_CLK_N;
  wire user_prog_clock_0_1_CLK_P;
  wire we_query_1;
  wire we_sen_1;

  assign data_in_1 = data_in[15:0];
  assign data_out[127:0] = MemN2N_0_data_out;
  assign en_1 = en;
  assign en_init_1 = en_init;
  assign f_w_up_1 = f_w_up;
  assign reset_1 = reset;
  assign user_prog_clock_0_1_CLK_N = user_prog_clock_0_clk_n;
  assign user_prog_clock_0_1_CLK_P = user_prog_clock_0_clk_p;
  assign we_query_1 = we_query;
  assign we_sen_1 = we_sen;
  MemN2N_TOP_MemN2N_0_0 MemN2N_0
       (.clk(clk_wiz_0_clk_out1),
        .data_in(data_in_1),
        .data_out(MemN2N_0_data_out),
        .en(en_1),
        .en_init(en_init_1),
        .f_w_up(f_w_up_1),
        .rst_n(proc_sys_reset_0_mb_reset),
        .we_query(we_query_1),
        .we_sen(we_sen_1));
  MemN2N_TOP_clk_wiz_0_1 clk_wiz_0
       (.clk_in1_n(user_prog_clock_0_1_CLK_N),
        .clk_in1_p(user_prog_clock_0_1_CLK_P),
        .clk_out1(clk_wiz_0_clk_out1),
        .reset(reset_1));
  MemN2N_TOP_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(reset_1),
        .mb_debug_sys_rst(1'b0),
        .mb_reset(proc_sys_reset_0_mb_reset),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
endmodule
