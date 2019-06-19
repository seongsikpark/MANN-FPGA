// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Thu Jul 14 15:14:21 2016
// Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               D:/00_work/01_xilinx/02_Ultra/01_project/MemN2N/MemN2N.runs/adder_32_synth_1/adder_32_sim_netlist.v
// Design      : adder_32
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "adder_32,c_addsub_v12_0_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_9,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module adder_32
   (A,
    B,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexu" *) 
  (* KEEP_HIERARCHY = "true" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  adder_32_c_addsub_v12_0_9 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(1'b0),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "0" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "virtexu" *) (* ORIG_REF_NAME = "c_addsub_v12_0_9" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module adder_32_c_addsub_v12_0_9
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire [31:0]A;
  wire ADD;
  wire [31:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire C_OUT;
  wire [31:0]S;
  wire SCLR;
  wire SINIT;
  wire SSET;

  (* C_ADD_MODE = "0" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "32" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "00000000000000000000000000000000" *) 
  (* C_B_WIDTH = "32" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "0" *) 
  (* C_OUT_WIDTH = "32" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "virtexu" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  adder_32_c_addsub_v12_0_9_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .C_OUT(C_OUT),
        .S(S),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
A13f8tlz6UJG9JfCNcYl8NLUw8Tlctm35dCRvt/KCTpBFIuXlOawHL7sTHowWNnYPdFQNufThU2P
nq6r7CYRfg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oJAsCu5zl/OMFEQsA8TK81YQdELnJEDcFa6KQ0EHWxmJrxei82pUrFKy5/0YZah/J8433WTkuMYX
n4DxKRAShIrdY1X7G4VuvTy06p94vL5LjcHyEy4fxae5eyT8gPJ2ix4XQa8NTiv0ndfGQZyw3Nh2
G2fKlAI5x3f8zwZZQY8=

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
wvBGFVtHjRF0sOMF1pCWFAGskoPwO7T2ijyj/eL3cj3Mn4RaSun2E2ii2aHguV5ZVFP65oRsiH5d
RuZPDUKAsxBDhHSsGkFSPIwX9KivlJTo2FZHlBDTlkfDQbn+a3fWxc1HcR9KUBo8QndFpzMmqgOV
oDGrjFRMryCx3hlDJdU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UMkVtIsRH0SCXq8LQlXc2SFapNVFtJ6lm3Wp55oPh2JHEa2eDcLuSNAMzka2zwzCEXltR/XJthW1
e74yTmf22SChtep5vBZ+ajUd7h2t8MuWnhQAMciHkyF4IkU7ju3JOoQFlih3FqDO3aUJPcamhd7Q
ccMUMAhIvZFp44NdLzl8HbXnE1qh9bi1m8qU8jMCKESUZ7pg4lNlsQjd+Goa1H9iXaLEv3OfHZuq
AS/RQip05I1DUFL5hACAmmneYHUVM5S4EEaO3aHf1jZ3r/piru3ZRDHXxDir2Y9zXiL2oDUfsV5l
w+Pp691O/rBEAjBLQdevDcp/mZn7axrfo7gedQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BizuB2M20zTA5t6lHKGfnJrucOUdZ0HEVkxiYzkxLH0WP9VZIREBo09OejVavblw0lBdoToGD/Dx
ZN2JWgxB3v9b0Oe7EvwN3oB8w0TKm0RoqDmuPV8JuY7RwxtxkHcrVvcjXuOt8j2BPe5Ix86NYRxZ
8RqRFVGNyOVCKZuaFMVHI+ktnNU/xi6ZGsd+L0PEmNWeJ+y+7ubRYuJBTcZK6n0e0Rv144/nsqdy
X+40+rhcynqZUh14Jaqxwmyc8eu2wmo21it2TUiXXzLiWf9C/rPTasxTNu6GgF2yKIv/qtG5zsH5
iEI5vhFnzG+RShh+IHFb+FdSgnifLxcvxMZyfQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinx_2016_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WBEZpdyDr9NfPjFUCp37UUdIujNIa897wZZ58/x9eMPhksqlKdy3SYhoDdl4U5n1JXPWIonhbpyY
qfWTq0gV9NaH1PiTuV9w+nrQziNvPhnHnWOzNrltlMQ+uTbMRquXZffmAQGphp7ekw56wGNMIqvn
BRmPzqHv8wZfX/RCaFbjfXAJEmAF89kl5TL3IWnE72Kb9o1cSvFtKTxyRoh9m9E0ghJdkhnRh4Pm
wU/+pIGwon3nUS1E00edVC7apMYbKm+8akp/2UT8ovmuCYJtcE90yRZZaeiFNpLq2UTmaGHp3XHC
2ziTOAA9fjUjv2jhCi5RMA2D0eDmOlHleltm9Q==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
MYzkt13KeNu+PBy8i6cS5QxgYo8YWpz4P0NYjPOcnzJwZnJmYxe3t1xU2vL59yvqz5OliYGUbJPm
ZLt1gnx7Mvwa8ZEVlvrqsdrdV7+WIzrnLxg5Vayv/RGtLpjlBJfQ1eA8ZCUQAIRkxXi99f2Qv6f6
VRYWtt5vs1wnBsb9vYAYyp8n+nVuXUeDbuCVg3sN1lP5ugB12eC+qi/QR8Tra5i9MfRG/TXb1w8p
LdigR86X4XXFXilxt8kd+LNQ1eskglfkVshluKsZzRD9l+3tbfWCi6AN+p0wBjk600QXfLWv5fWb
4jiogrbpi4KCufROyUYMfiK5EFLwQJwixTwOPg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP05_001", key_method="rsa"
`pragma protect encoding = (enctype="base64", line_length=76, bytes=256)
`pragma protect key_block
oOEckOKkPWo8Y5EAhg1s82BZck+q9Rp6vwjG/JInHsW6tDsxcCYoARqmChH8p4JhLmmda4K+KVuP
A881pi5DIs/lKNeiKQz7Lry5YyR6kje6Lu3s3fsUnpIJJWyLeJkmWtoD8pU5/hcSniBmq8HbQ5li
B7Pv/9oMMvLTfSKg1UTjlGt4h131os2x9G6l/qDntt91AZzhj+Jec/qCLnmeQMvQH6KwWWaJvNzl
x7L9pe0JTDgOLzdVhtNh3pRaiEziVuawXQHou8AaOgrHiayqD9I528yEkhcbbULV76rNfOk7UZpK
rNAtpX4O8EU8FT26Of8oed+j+GCyweiPHdf14Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11120)
`pragma protect data_block
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
azl2wgE=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
