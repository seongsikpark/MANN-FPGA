// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Thu Jul 14 15:14:21 2016
// Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               D:/00_work/01_xilinx/02_Ultra/01_project/MemN2N/MemN2N.runs/adder_32_synth_1/adder_32_stub.v
// Design      : adder_32
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *)
module adder_32(A, B, S)
/* synthesis syn_black_box black_box_pad_pin="A[31:0],B[31:0],S[31:0]" */;
  input [31:0]A;
  input [31:0]B;
  output [31:0]S;
endmodule
