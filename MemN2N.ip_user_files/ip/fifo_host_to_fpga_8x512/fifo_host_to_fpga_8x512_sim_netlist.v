// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
// Date        : Mon Aug 21 15:53:04 2017
// Host        : seongsikpark running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               D:/00_work/00_project/01_MemN2N/02_HW/MemN2N/MemN2N.runs/fifo_host_to_fpga_8x512_synth_1/fifo_host_to_fpga_8x512_sim_netlist.v
// Design      : fifo_host_to_fpga_8x512
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_host_to_fpga_8x512,fifo_generator_v13_1_1,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_1_1,Vivado 2016.2" *) 
(* NotValidForBitStream *)
module fifo_host_to_fpga_8x512
   (srst,
    wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    valid,
    wr_rst_busy,
    rd_rst_busy);
  input srst;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output valid;
  output wr_rst_busy;
  output rd_rst_busy;

  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "virtexu" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "50" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* KEEP_HIERARCHY = "true" *) 
  fifo_host_to_fpga_8x512_fifo_generator_v13_1_1 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_COMMON_CLOCK = "0" *) (* C_DIN_WIDTH = "8" *) (* C_DOUT_RST_VAL = "000000000" *) 
(* C_DOUT_WIDTH = "8" *) (* C_FAMILY = "8SERIES" *) (* C_HAS_INT_CLK = "0" *) 
(* C_IMPLEMENTATION_TYPE = "6" *) (* C_INTERFACE_TYPE = "0" *) (* C_IS_ASYMMETRIC = "0" *) 
(* C_MSGON_VAL = "1" *) (* C_NUM_PRIM_DEEP = "1" *) (* C_PRELOAD_LATENCY = "2" *) 
(* C_PRIM_DEPTH = "512" *) (* C_PRIM_FIFO36 = "0" *) (* C_PRIM_WIDTH = "36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_RD_DATA_COUNT_WIDTH = "13" *) (* C_RD_PNTR_WIDTH = "9" *) (* C_RD_PRIM_DEPTH = "512" *) 
(* C_RD_PRIM_WIDTH = "36" *) (* C_READ_FASTER = "0" *) (* C_READ_WIDTH = "36" *) 
(* C_USE_BI_CASCADE = "1" *) (* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) 
(* C_USE_EMBEDDED_REG = "1" *) (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_WRITE_WIDTH = "36" *) (* C_WR_DATA_COUNT_WIDTH = "13" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PRIM_DEPTH = "512" *) (* C_WR_PRIM_WIDTH = "36" *) (* ORIG_REF_NAME = "builtin_extdepth" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_builtin_extdepth
   (WR_CLK,
    RD_CLK,
    INT_CLK,
    WR_RST,
    RD_RST,
    RST,
    SLEEP,
    DIN,
    WR_EN,
    RD_EN,
    DOUT,
    FULL,
    EMPTY,
    OVERFLOW,
    UNDERFLOW,
    PROG_FULL,
    PROG_EMPTY,
    SBITERR,
    DBITERR,
    INJECTDBITERR,
    INJECTSBITERR,
    WR_DATA_COUNT,
    RD_DATA_COUNT,
    WRRSTBUSY,
    RDRSTBUSY);
  input WR_CLK;
  input RD_CLK;
  input INT_CLK;
  input WR_RST;
  input RD_RST;
  input RST;
  input SLEEP;
  input [35:0]DIN;
  input WR_EN;
  input RD_EN;
  output [35:0]DOUT;
  output FULL;
  output EMPTY;
  output OVERFLOW;
  output UNDERFLOW;
  output PROG_FULL;
  output PROG_EMPTY;
  output SBITERR;
  output DBITERR;
  input INJECTDBITERR;
  input INJECTSBITERR;
  output [12:0]WR_DATA_COUNT;
  output [12:0]RD_DATA_COUNT;
  output WRRSTBUSY;
  output RDRSTBUSY;

  wire \<const0> ;
  wire [35:0]DIN;
  wire [7:0]\^DOUT ;
  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_CLK;
  wire RD_EN;
  wire RST;
  wire WRRSTBUSY;
  wire WR_CLK;
  wire WR_EN;
  (* async_reg = "true" *) (* msgon = "true" *) wire [1:0]srst_qr;
  wire \NLW_gonep.inst_prim_CASCADE_NEXT_EMPTY_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_CASCADE_PREV_RD_EN_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_DBITERR_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_OVERFLOW_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_PROG_EMPTY_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_PROG_FULL_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_SBITERR_UNCONNECTED ;
  wire \NLW_gonep.inst_prim_UNDERFLOW_UNCONNECTED ;
  wire [35:0]\NLW_gonep.inst_prim_CASCADE_DOUT_UNCONNECTED ;
  wire [35:8]\NLW_gonep.inst_prim_DOUT_UNCONNECTED ;
  wire [7:0]\NLW_gonep.inst_prim_ECCPARITY_UNCONNECTED ;
  wire [12:0]\NLW_gonep.inst_prim_RD_DATA_COUNT_UNCONNECTED ;
  wire [12:0]\NLW_gonep.inst_prim_WR_DATA_COUNT_UNCONNECTED ;

  assign DBITERR = \<const0> ;
  assign DOUT[35] = \<const0> ;
  assign DOUT[34] = \<const0> ;
  assign DOUT[33] = \<const0> ;
  assign DOUT[32] = \<const0> ;
  assign DOUT[31] = \<const0> ;
  assign DOUT[30] = \<const0> ;
  assign DOUT[29] = \<const0> ;
  assign DOUT[28] = \<const0> ;
  assign DOUT[27] = \<const0> ;
  assign DOUT[26] = \<const0> ;
  assign DOUT[25] = \<const0> ;
  assign DOUT[24] = \<const0> ;
  assign DOUT[23] = \<const0> ;
  assign DOUT[22] = \<const0> ;
  assign DOUT[21] = \<const0> ;
  assign DOUT[20] = \<const0> ;
  assign DOUT[19] = \<const0> ;
  assign DOUT[18] = \<const0> ;
  assign DOUT[17] = \<const0> ;
  assign DOUT[16] = \<const0> ;
  assign DOUT[15] = \<const0> ;
  assign DOUT[14] = \<const0> ;
  assign DOUT[13] = \<const0> ;
  assign DOUT[12] = \<const0> ;
  assign DOUT[11] = \<const0> ;
  assign DOUT[10] = \<const0> ;
  assign DOUT[9] = \<const0> ;
  assign DOUT[8] = \<const0> ;
  assign DOUT[7:0] = \^DOUT [7:0];
  assign OVERFLOW = \<const0> ;
  assign PROG_EMPTY = \<const0> ;
  assign PROG_FULL = \<const0> ;
  assign RD_DATA_COUNT[12] = \<const0> ;
  assign RD_DATA_COUNT[11] = \<const0> ;
  assign RD_DATA_COUNT[10] = \<const0> ;
  assign RD_DATA_COUNT[9] = \<const0> ;
  assign RD_DATA_COUNT[8] = \<const0> ;
  assign RD_DATA_COUNT[7] = \<const0> ;
  assign RD_DATA_COUNT[6] = \<const0> ;
  assign RD_DATA_COUNT[5] = \<const0> ;
  assign RD_DATA_COUNT[4] = \<const0> ;
  assign RD_DATA_COUNT[3] = \<const0> ;
  assign RD_DATA_COUNT[2] = \<const0> ;
  assign RD_DATA_COUNT[1] = \<const0> ;
  assign RD_DATA_COUNT[0] = \<const0> ;
  assign SBITERR = \<const0> ;
  assign UNDERFLOW = \<const0> ;
  assign WR_DATA_COUNT[12] = \<const0> ;
  assign WR_DATA_COUNT[11] = \<const0> ;
  assign WR_DATA_COUNT[10] = \<const0> ;
  assign WR_DATA_COUNT[9] = \<const0> ;
  assign WR_DATA_COUNT[8] = \<const0> ;
  assign WR_DATA_COUNT[7] = \<const0> ;
  assign WR_DATA_COUNT[6] = \<const0> ;
  assign WR_DATA_COUNT[5] = \<const0> ;
  assign WR_DATA_COUNT[4] = \<const0> ;
  assign WR_DATA_COUNT[3] = \<const0> ;
  assign WR_DATA_COUNT[2] = \<const0> ;
  assign WR_DATA_COUNT[1] = \<const0> ;
  assign WR_DATA_COUNT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_CASCADE_ORDER = "NONE" *) 
  (* C_CLOCK_DOMAINS = "INDEPENDENT" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DOUT_RST_VAL = "000000000" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_EN_ECC_PIPE = "FALSE" *) 
  (* C_EN_ECC_READ = "FALSE" *) 
  (* C_EN_ECC_WRITE = "FALSE" *) 
  (* C_FWFT = "FALSE" *) 
  (* C_IS_ASYMMETRIC = "0" *) 
  (* C_PRIM_FIFO36 = "0" *) 
  (* C_PRIM_WIDTH = "36" *) 
  (* C_PROG_EMPTY_THRESH = "5" *) 
  (* C_PROG_FULL_THRESH = "511" *) 
  (* C_RDCOUNT_TYPE = "EXTENDED_DATACOUNT" *) 
  (* C_RD_DATA_COUNT_WIDTH = "13" *) 
  (* C_RD_PRIM_WIDTH = "36" *) 
  (* C_READ_WIDTH = "36" *) 
  (* C_REGISTER_MODE = "REGISTERED" *) 
  (* C_RSTREG_PRIORITY = "REGCE" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_WRCOUNT_TYPE = "EXTENDED_DATACOUNT" *) 
  (* C_WRITE_WIDTH = "36" *) 
  (* C_WR_DATA_COUNT_WIDTH = "13" *) 
  (* C_WR_PRIM_WIDTH = "36" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_builtin_prim \gonep.inst_prim 
       (.CASCADE_DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADE_DOUT(\NLW_gonep.inst_prim_CASCADE_DOUT_UNCONNECTED [35:0]),
        .CASCADE_NEXT_EMPTY(\NLW_gonep.inst_prim_CASCADE_NEXT_EMPTY_UNCONNECTED ),
        .CASCADE_NEXT_RD_EN(1'b0),
        .CASCADE_PREV_EMPTY(1'b0),
        .CASCADE_PREV_RD_EN(\NLW_gonep.inst_prim_CASCADE_PREV_RD_EN_UNCONNECTED ),
        .DBITERR(\NLW_gonep.inst_prim_DBITERR_UNCONNECTED ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DIN[7:0]}),
        .DOUT({\NLW_gonep.inst_prim_DOUT_UNCONNECTED [35:8],\^DOUT }),
        .ECCPARITY(\NLW_gonep.inst_prim_ECCPARITY_UNCONNECTED [7:0]),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .OVERFLOW(\NLW_gonep.inst_prim_OVERFLOW_UNCONNECTED ),
        .PROG_EMPTY(\NLW_gonep.inst_prim_PROG_EMPTY_UNCONNECTED ),
        .PROG_FULL(\NLW_gonep.inst_prim_PROG_FULL_UNCONNECTED ),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_CLK(RD_CLK),
        .RD_DATA_COUNT(\NLW_gonep.inst_prim_RD_DATA_COUNT_UNCONNECTED [12:0]),
        .RD_EN(RD_EN),
        .RST(RST),
        .SBITERR(\NLW_gonep.inst_prim_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .UNDERFLOW(\NLW_gonep.inst_prim_UNDERFLOW_UNCONNECTED ),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_CLK(WR_CLK),
        .WR_DATA_COUNT(\NLW_gonep.inst_prim_WR_DATA_COUNT_UNCONNECTED [12:0]),
        .WR_EN(WR_EN));
  LUT1 #(
    .INIT(2'h2)) 
    i_0
       (.I0(1'b1),
        .O(srst_qr[1]));
  LUT1 #(
    .INIT(2'h2)) 
    i_1
       (.I0(1'b1),
        .O(srst_qr[0]));
endmodule

(* C_CASCADE_ORDER = "NONE" *) (* C_CLOCK_DOMAINS = "INDEPENDENT" *) (* C_DIN_WIDTH = "8" *) 
(* C_DOUT_RST_VAL = "000000000" *) (* C_DOUT_WIDTH = "8" *) (* C_EN_ECC_PIPE = "FALSE" *) 
(* C_EN_ECC_READ = "FALSE" *) (* C_EN_ECC_WRITE = "FALSE" *) (* C_FWFT = "FALSE" *) 
(* C_IS_ASYMMETRIC = "0" *) (* C_PRIM_FIFO36 = "0" *) (* C_PRIM_WIDTH = "36" *) 
(* C_PROG_EMPTY_THRESH = "5" *) (* C_PROG_FULL_THRESH = "511" *) (* C_RDCOUNT_TYPE = "EXTENDED_DATACOUNT" *) 
(* C_RD_DATA_COUNT_WIDTH = "13" *) (* C_RD_PRIM_WIDTH = "36" *) (* C_READ_WIDTH = "36" *) 
(* C_REGISTER_MODE = "REGISTERED" *) (* C_RSTREG_PRIORITY = "REGCE" *) (* C_USE_DOUT_RST = "1" *) 
(* C_USE_EMBEDDED_REG = "1" *) (* C_WRCOUNT_TYPE = "EXTENDED_DATACOUNT" *) (* C_WRITE_WIDTH = "36" *) 
(* C_WR_DATA_COUNT_WIDTH = "13" *) (* C_WR_PRIM_WIDTH = "36" *) (* ORIG_REF_NAME = "builtin_prim" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_builtin_prim
   (RST,
    SLEEP,
    WR_CLK,
    DIN,
    WR_EN,
    WRRSTBUSY,
    FULL,
    PROG_FULL,
    OVERFLOW,
    WR_DATA_COUNT,
    RD_CLK,
    RD_EN,
    RDRSTBUSY,
    DOUT,
    EMPTY,
    PROG_EMPTY,
    UNDERFLOW,
    RD_DATA_COUNT,
    INJECTDBITERR,
    INJECTSBITERR,
    SBITERR,
    DBITERR,
    ECCPARITY,
    CASCADE_DIN,
    CASCADE_NEXT_RD_EN,
    CASCADE_PREV_EMPTY,
    CASCADE_DOUT,
    CASCADE_NEXT_EMPTY,
    CASCADE_PREV_RD_EN);
  input RST;
  input SLEEP;
  input WR_CLK;
  input [35:0]DIN;
  input WR_EN;
  output WRRSTBUSY;
  output FULL;
  output PROG_FULL;
  output OVERFLOW;
  output [12:0]WR_DATA_COUNT;
  input RD_CLK;
  input RD_EN;
  output RDRSTBUSY;
  output [35:0]DOUT;
  output EMPTY;
  output PROG_EMPTY;
  output UNDERFLOW;
  output [12:0]RD_DATA_COUNT;
  input INJECTDBITERR;
  input INJECTSBITERR;
  output SBITERR;
  output DBITERR;
  output [7:0]ECCPARITY;
  input [35:0]CASCADE_DIN;
  input CASCADE_NEXT_RD_EN;
  input CASCADE_PREV_EMPTY;
  output [35:0]CASCADE_DOUT;
  output CASCADE_NEXT_EMPTY;
  output CASCADE_PREV_RD_EN;

  wire \<const0> ;
  wire [35:0]DIN;
  wire [7:0]\^DOUT ;
  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_CLK;
  wire RD_EN;
  wire RST;
  wire WRRSTBUSY;
  wire WR_CLK;
  wire WR_EN;
  wire \gf18e2_inst.sngfifo18e2_n_0 ;
  wire \gf18e2_inst.sngfifo18e2_n_1 ;
  wire \gf18e2_inst.sngfifo18e2_n_10 ;
  wire \gf18e2_inst.sngfifo18e2_n_100 ;
  wire \gf18e2_inst.sngfifo18e2_n_101 ;
  wire \gf18e2_inst.sngfifo18e2_n_102 ;
  wire \gf18e2_inst.sngfifo18e2_n_103 ;
  wire \gf18e2_inst.sngfifo18e2_n_104 ;
  wire \gf18e2_inst.sngfifo18e2_n_105 ;
  wire \gf18e2_inst.sngfifo18e2_n_106 ;
  wire \gf18e2_inst.sngfifo18e2_n_107 ;
  wire \gf18e2_inst.sngfifo18e2_n_11 ;
  wire \gf18e2_inst.sngfifo18e2_n_12 ;
  wire \gf18e2_inst.sngfifo18e2_n_13 ;
  wire \gf18e2_inst.sngfifo18e2_n_14 ;
  wire \gf18e2_inst.sngfifo18e2_n_15 ;
  wire \gf18e2_inst.sngfifo18e2_n_16 ;
  wire \gf18e2_inst.sngfifo18e2_n_17 ;
  wire \gf18e2_inst.sngfifo18e2_n_18 ;
  wire \gf18e2_inst.sngfifo18e2_n_19 ;
  wire \gf18e2_inst.sngfifo18e2_n_20 ;
  wire \gf18e2_inst.sngfifo18e2_n_21 ;
  wire \gf18e2_inst.sngfifo18e2_n_22 ;
  wire \gf18e2_inst.sngfifo18e2_n_23 ;
  wire \gf18e2_inst.sngfifo18e2_n_24 ;
  wire \gf18e2_inst.sngfifo18e2_n_25 ;
  wire \gf18e2_inst.sngfifo18e2_n_26 ;
  wire \gf18e2_inst.sngfifo18e2_n_27 ;
  wire \gf18e2_inst.sngfifo18e2_n_28 ;
  wire \gf18e2_inst.sngfifo18e2_n_29 ;
  wire \gf18e2_inst.sngfifo18e2_n_30 ;
  wire \gf18e2_inst.sngfifo18e2_n_31 ;
  wire \gf18e2_inst.sngfifo18e2_n_32 ;
  wire \gf18e2_inst.sngfifo18e2_n_33 ;
  wire \gf18e2_inst.sngfifo18e2_n_34 ;
  wire \gf18e2_inst.sngfifo18e2_n_35 ;
  wire \gf18e2_inst.sngfifo18e2_n_36 ;
  wire \gf18e2_inst.sngfifo18e2_n_37 ;
  wire \gf18e2_inst.sngfifo18e2_n_38 ;
  wire \gf18e2_inst.sngfifo18e2_n_39 ;
  wire \gf18e2_inst.sngfifo18e2_n_4 ;
  wire \gf18e2_inst.sngfifo18e2_n_40 ;
  wire \gf18e2_inst.sngfifo18e2_n_41 ;
  wire \gf18e2_inst.sngfifo18e2_n_42 ;
  wire \gf18e2_inst.sngfifo18e2_n_43 ;
  wire \gf18e2_inst.sngfifo18e2_n_44 ;
  wire \gf18e2_inst.sngfifo18e2_n_45 ;
  wire \gf18e2_inst.sngfifo18e2_n_46 ;
  wire \gf18e2_inst.sngfifo18e2_n_47 ;
  wire \gf18e2_inst.sngfifo18e2_n_48 ;
  wire \gf18e2_inst.sngfifo18e2_n_49 ;
  wire \gf18e2_inst.sngfifo18e2_n_5 ;
  wire \gf18e2_inst.sngfifo18e2_n_50 ;
  wire \gf18e2_inst.sngfifo18e2_n_51 ;
  wire \gf18e2_inst.sngfifo18e2_n_52 ;
  wire \gf18e2_inst.sngfifo18e2_n_53 ;
  wire \gf18e2_inst.sngfifo18e2_n_54 ;
  wire \gf18e2_inst.sngfifo18e2_n_55 ;
  wire \gf18e2_inst.sngfifo18e2_n_56 ;
  wire \gf18e2_inst.sngfifo18e2_n_57 ;
  wire \gf18e2_inst.sngfifo18e2_n_58 ;
  wire \gf18e2_inst.sngfifo18e2_n_59 ;
  wire \gf18e2_inst.sngfifo18e2_n_6 ;
  wire \gf18e2_inst.sngfifo18e2_n_60 ;
  wire \gf18e2_inst.sngfifo18e2_n_61 ;
  wire \gf18e2_inst.sngfifo18e2_n_62 ;
  wire \gf18e2_inst.sngfifo18e2_n_63 ;
  wire \gf18e2_inst.sngfifo18e2_n_64 ;
  wire \gf18e2_inst.sngfifo18e2_n_65 ;
  wire \gf18e2_inst.sngfifo18e2_n_66 ;
  wire \gf18e2_inst.sngfifo18e2_n_67 ;
  wire \gf18e2_inst.sngfifo18e2_n_68 ;
  wire \gf18e2_inst.sngfifo18e2_n_69 ;
  wire \gf18e2_inst.sngfifo18e2_n_70 ;
  wire \gf18e2_inst.sngfifo18e2_n_71 ;
  wire \gf18e2_inst.sngfifo18e2_n_72 ;
  wire \gf18e2_inst.sngfifo18e2_n_73 ;
  wire \gf18e2_inst.sngfifo18e2_n_74 ;
  wire \gf18e2_inst.sngfifo18e2_n_75 ;
  wire \gf18e2_inst.sngfifo18e2_n_76 ;
  wire \gf18e2_inst.sngfifo18e2_n_77 ;
  wire \gf18e2_inst.sngfifo18e2_n_78 ;
  wire \gf18e2_inst.sngfifo18e2_n_79 ;
  wire \gf18e2_inst.sngfifo18e2_n_8 ;
  wire \gf18e2_inst.sngfifo18e2_n_80 ;
  wire \gf18e2_inst.sngfifo18e2_n_81 ;
  wire \gf18e2_inst.sngfifo18e2_n_82 ;
  wire \gf18e2_inst.sngfifo18e2_n_83 ;
  wire \gf18e2_inst.sngfifo18e2_n_84 ;
  wire \gf18e2_inst.sngfifo18e2_n_85 ;
  wire \gf18e2_inst.sngfifo18e2_n_86 ;
  wire \gf18e2_inst.sngfifo18e2_n_87 ;
  wire \gf18e2_inst.sngfifo18e2_n_88 ;
  wire \gf18e2_inst.sngfifo18e2_n_89 ;
  wire \gf18e2_inst.sngfifo18e2_n_90 ;
  wire \gf18e2_inst.sngfifo18e2_n_91 ;

  assign CASCADE_DOUT[35] = \<const0> ;
  assign CASCADE_DOUT[34] = \<const0> ;
  assign CASCADE_DOUT[33] = \<const0> ;
  assign CASCADE_DOUT[32] = \<const0> ;
  assign CASCADE_DOUT[31] = \<const0> ;
  assign CASCADE_DOUT[30] = \<const0> ;
  assign CASCADE_DOUT[29] = \<const0> ;
  assign CASCADE_DOUT[28] = \<const0> ;
  assign CASCADE_DOUT[27] = \<const0> ;
  assign CASCADE_DOUT[26] = \<const0> ;
  assign CASCADE_DOUT[25] = \<const0> ;
  assign CASCADE_DOUT[24] = \<const0> ;
  assign CASCADE_DOUT[23] = \<const0> ;
  assign CASCADE_DOUT[22] = \<const0> ;
  assign CASCADE_DOUT[21] = \<const0> ;
  assign CASCADE_DOUT[20] = \<const0> ;
  assign CASCADE_DOUT[19] = \<const0> ;
  assign CASCADE_DOUT[18] = \<const0> ;
  assign CASCADE_DOUT[17] = \<const0> ;
  assign CASCADE_DOUT[16] = \<const0> ;
  assign CASCADE_DOUT[15] = \<const0> ;
  assign CASCADE_DOUT[14] = \<const0> ;
  assign CASCADE_DOUT[13] = \<const0> ;
  assign CASCADE_DOUT[12] = \<const0> ;
  assign CASCADE_DOUT[11] = \<const0> ;
  assign CASCADE_DOUT[10] = \<const0> ;
  assign CASCADE_DOUT[9] = \<const0> ;
  assign CASCADE_DOUT[8] = \<const0> ;
  assign CASCADE_DOUT[7] = \<const0> ;
  assign CASCADE_DOUT[6] = \<const0> ;
  assign CASCADE_DOUT[5] = \<const0> ;
  assign CASCADE_DOUT[4] = \<const0> ;
  assign CASCADE_DOUT[3] = \<const0> ;
  assign CASCADE_DOUT[2] = \<const0> ;
  assign CASCADE_DOUT[1] = \<const0> ;
  assign CASCADE_DOUT[0] = \<const0> ;
  assign CASCADE_NEXT_EMPTY = \<const0> ;
  assign CASCADE_PREV_RD_EN = \<const0> ;
  assign DBITERR = \<const0> ;
  assign DOUT[35] = \<const0> ;
  assign DOUT[34] = \<const0> ;
  assign DOUT[33] = \<const0> ;
  assign DOUT[32] = \<const0> ;
  assign DOUT[31] = \<const0> ;
  assign DOUT[30] = \<const0> ;
  assign DOUT[29] = \<const0> ;
  assign DOUT[28] = \<const0> ;
  assign DOUT[27] = \<const0> ;
  assign DOUT[26] = \<const0> ;
  assign DOUT[25] = \<const0> ;
  assign DOUT[24] = \<const0> ;
  assign DOUT[23] = \<const0> ;
  assign DOUT[22] = \<const0> ;
  assign DOUT[21] = \<const0> ;
  assign DOUT[20] = \<const0> ;
  assign DOUT[19] = \<const0> ;
  assign DOUT[18] = \<const0> ;
  assign DOUT[17] = \<const0> ;
  assign DOUT[16] = \<const0> ;
  assign DOUT[15] = \<const0> ;
  assign DOUT[14] = \<const0> ;
  assign DOUT[13] = \<const0> ;
  assign DOUT[12] = \<const0> ;
  assign DOUT[11] = \<const0> ;
  assign DOUT[10] = \<const0> ;
  assign DOUT[9] = \<const0> ;
  assign DOUT[8] = \<const0> ;
  assign DOUT[7:0] = \^DOUT [7:0];
  assign ECCPARITY[7] = \<const0> ;
  assign ECCPARITY[6] = \<const0> ;
  assign ECCPARITY[5] = \<const0> ;
  assign ECCPARITY[4] = \<const0> ;
  assign ECCPARITY[3] = \<const0> ;
  assign ECCPARITY[2] = \<const0> ;
  assign ECCPARITY[1] = \<const0> ;
  assign ECCPARITY[0] = \<const0> ;
  assign OVERFLOW = \<const0> ;
  assign PROG_EMPTY = \<const0> ;
  assign PROG_FULL = \<const0> ;
  assign RD_DATA_COUNT[12] = \<const0> ;
  assign RD_DATA_COUNT[11] = \<const0> ;
  assign RD_DATA_COUNT[10] = \<const0> ;
  assign RD_DATA_COUNT[9] = \<const0> ;
  assign RD_DATA_COUNT[8] = \<const0> ;
  assign RD_DATA_COUNT[7] = \<const0> ;
  assign RD_DATA_COUNT[6] = \<const0> ;
  assign RD_DATA_COUNT[5] = \<const0> ;
  assign RD_DATA_COUNT[4] = \<const0> ;
  assign RD_DATA_COUNT[3] = \<const0> ;
  assign RD_DATA_COUNT[2] = \<const0> ;
  assign RD_DATA_COUNT[1] = \<const0> ;
  assign RD_DATA_COUNT[0] = \<const0> ;
  assign SBITERR = \<const0> ;
  assign UNDERFLOW = \<const0> ;
  assign WR_DATA_COUNT[12] = \<const0> ;
  assign WR_DATA_COUNT[11] = \<const0> ;
  assign WR_DATA_COUNT[10] = \<const0> ;
  assign WR_DATA_COUNT[9] = \<const0> ;
  assign WR_DATA_COUNT[8] = \<const0> ;
  assign WR_DATA_COUNT[7] = \<const0> ;
  assign WR_DATA_COUNT[6] = \<const0> ;
  assign WR_DATA_COUNT[5] = \<const0> ;
  assign WR_DATA_COUNT[4] = \<const0> ;
  assign WR_DATA_COUNT[3] = \<const0> ;
  assign WR_DATA_COUNT[2] = \<const0> ;
  assign WR_DATA_COUNT[1] = \<const0> ;
  assign WR_DATA_COUNT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* box_type = "PRIMITIVE" *) 
  FIFO18E2 #(
    .CASCADE_ORDER("NONE"),
    .CLOCK_DOMAINS("INDEPENDENT"),
    .FIRST_WORD_FALL_THROUGH("FALSE"),
    .INIT(36'h000000000),
    .IS_RDCLK_INVERTED(1'b0),
    .IS_RDEN_INVERTED(1'b0),
    .IS_RSTREG_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .IS_WRCLK_INVERTED(1'b0),
    .IS_WREN_INVERTED(1'b0),
    .PROG_EMPTY_THRESH(5),
    .PROG_FULL_THRESH(511),
    .RDCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .READ_WIDTH(36),
    .REGISTER_MODE("REGISTERED"),
    .RSTREG_PRIORITY("REGCE"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL(36'h000000000),
    .WRCOUNT_TYPE("EXTENDED_DATACOUNT"),
    .WRITE_WIDTH(36)) 
    \gf18e2_inst.sngfifo18e2 
       (.CASDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINP({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUX(1'b0),
        .CASDOMUXEN(1'b1),
        .CASDOUT({\gf18e2_inst.sngfifo18e2_n_36 ,\gf18e2_inst.sngfifo18e2_n_37 ,\gf18e2_inst.sngfifo18e2_n_38 ,\gf18e2_inst.sngfifo18e2_n_39 ,\gf18e2_inst.sngfifo18e2_n_40 ,\gf18e2_inst.sngfifo18e2_n_41 ,\gf18e2_inst.sngfifo18e2_n_42 ,\gf18e2_inst.sngfifo18e2_n_43 ,\gf18e2_inst.sngfifo18e2_n_44 ,\gf18e2_inst.sngfifo18e2_n_45 ,\gf18e2_inst.sngfifo18e2_n_46 ,\gf18e2_inst.sngfifo18e2_n_47 ,\gf18e2_inst.sngfifo18e2_n_48 ,\gf18e2_inst.sngfifo18e2_n_49 ,\gf18e2_inst.sngfifo18e2_n_50 ,\gf18e2_inst.sngfifo18e2_n_51 ,\gf18e2_inst.sngfifo18e2_n_52 ,\gf18e2_inst.sngfifo18e2_n_53 ,\gf18e2_inst.sngfifo18e2_n_54 ,\gf18e2_inst.sngfifo18e2_n_55 ,\gf18e2_inst.sngfifo18e2_n_56 ,\gf18e2_inst.sngfifo18e2_n_57 ,\gf18e2_inst.sngfifo18e2_n_58 ,\gf18e2_inst.sngfifo18e2_n_59 ,\gf18e2_inst.sngfifo18e2_n_60 ,\gf18e2_inst.sngfifo18e2_n_61 ,\gf18e2_inst.sngfifo18e2_n_62 ,\gf18e2_inst.sngfifo18e2_n_63 ,\gf18e2_inst.sngfifo18e2_n_64 ,\gf18e2_inst.sngfifo18e2_n_65 ,\gf18e2_inst.sngfifo18e2_n_66 ,\gf18e2_inst.sngfifo18e2_n_67 }),
        .CASDOUTP({\gf18e2_inst.sngfifo18e2_n_100 ,\gf18e2_inst.sngfifo18e2_n_101 ,\gf18e2_inst.sngfifo18e2_n_102 ,\gf18e2_inst.sngfifo18e2_n_103 }),
        .CASNXTEMPTY(\gf18e2_inst.sngfifo18e2_n_0 ),
        .CASNXTRDEN(1'b0),
        .CASOREGIMUX(1'b0),
        .CASOREGIMUXEN(1'b1),
        .CASPRVEMPTY(1'b0),
        .CASPRVRDEN(\gf18e2_inst.sngfifo18e2_n_1 ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DIN[7:0]}),
        .DINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUT({\gf18e2_inst.sngfifo18e2_n_68 ,\gf18e2_inst.sngfifo18e2_n_69 ,\gf18e2_inst.sngfifo18e2_n_70 ,\gf18e2_inst.sngfifo18e2_n_71 ,\gf18e2_inst.sngfifo18e2_n_72 ,\gf18e2_inst.sngfifo18e2_n_73 ,\gf18e2_inst.sngfifo18e2_n_74 ,\gf18e2_inst.sngfifo18e2_n_75 ,\gf18e2_inst.sngfifo18e2_n_76 ,\gf18e2_inst.sngfifo18e2_n_77 ,\gf18e2_inst.sngfifo18e2_n_78 ,\gf18e2_inst.sngfifo18e2_n_79 ,\gf18e2_inst.sngfifo18e2_n_80 ,\gf18e2_inst.sngfifo18e2_n_81 ,\gf18e2_inst.sngfifo18e2_n_82 ,\gf18e2_inst.sngfifo18e2_n_83 ,\gf18e2_inst.sngfifo18e2_n_84 ,\gf18e2_inst.sngfifo18e2_n_85 ,\gf18e2_inst.sngfifo18e2_n_86 ,\gf18e2_inst.sngfifo18e2_n_87 ,\gf18e2_inst.sngfifo18e2_n_88 ,\gf18e2_inst.sngfifo18e2_n_89 ,\gf18e2_inst.sngfifo18e2_n_90 ,\gf18e2_inst.sngfifo18e2_n_91 ,\^DOUT }),
        .DOUTP({\gf18e2_inst.sngfifo18e2_n_104 ,\gf18e2_inst.sngfifo18e2_n_105 ,\gf18e2_inst.sngfifo18e2_n_106 ,\gf18e2_inst.sngfifo18e2_n_107 }),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .PROGEMPTY(\gf18e2_inst.sngfifo18e2_n_4 ),
        .PROGFULL(\gf18e2_inst.sngfifo18e2_n_5 ),
        .RDCLK(RD_CLK),
        .RDCOUNT({\gf18e2_inst.sngfifo18e2_n_10 ,\gf18e2_inst.sngfifo18e2_n_11 ,\gf18e2_inst.sngfifo18e2_n_12 ,\gf18e2_inst.sngfifo18e2_n_13 ,\gf18e2_inst.sngfifo18e2_n_14 ,\gf18e2_inst.sngfifo18e2_n_15 ,\gf18e2_inst.sngfifo18e2_n_16 ,\gf18e2_inst.sngfifo18e2_n_17 ,\gf18e2_inst.sngfifo18e2_n_18 ,\gf18e2_inst.sngfifo18e2_n_19 ,\gf18e2_inst.sngfifo18e2_n_20 ,\gf18e2_inst.sngfifo18e2_n_21 ,\gf18e2_inst.sngfifo18e2_n_22 }),
        .RDEN(RD_EN),
        .RDERR(\gf18e2_inst.sngfifo18e2_n_6 ),
        .RDRSTBUSY(RDRSTBUSY),
        .REGCE(RD_EN),
        .RST(RST),
        .RSTREG(RST),
        .SLEEP(1'b0),
        .WRCLK(WR_CLK),
        .WRCOUNT({\gf18e2_inst.sngfifo18e2_n_23 ,\gf18e2_inst.sngfifo18e2_n_24 ,\gf18e2_inst.sngfifo18e2_n_25 ,\gf18e2_inst.sngfifo18e2_n_26 ,\gf18e2_inst.sngfifo18e2_n_27 ,\gf18e2_inst.sngfifo18e2_n_28 ,\gf18e2_inst.sngfifo18e2_n_29 ,\gf18e2_inst.sngfifo18e2_n_30 ,\gf18e2_inst.sngfifo18e2_n_31 ,\gf18e2_inst.sngfifo18e2_n_32 ,\gf18e2_inst.sngfifo18e2_n_33 ,\gf18e2_inst.sngfifo18e2_n_34 ,\gf18e2_inst.sngfifo18e2_n_35 }),
        .WREN(WR_EN),
        .WRERR(\gf18e2_inst.sngfifo18e2_n_8 ),
        .WRRSTBUSY(WRRSTBUSY));
endmodule

(* C_COMMON_CLOCK = "0" *) (* C_DIN_WIDTH = "8" *) (* C_DOUT_RST_VAL = "0" *) 
(* C_DOUT_WIDTH = "8" *) (* C_FAMILY = "8SERIES" *) (* C_HAS_INT_CLK = "0" *) 
(* C_HAS_OVERFLOW = "1" *) (* C_HAS_UNDERFLOW = "1" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "1" *) (* C_IMPLEMENTATION_TYPE = "6" *) (* C_MSGON_VAL = "1" *) 
(* C_NUM_PRIM_DEEP = "1" *) (* C_NUM_PRIM_WIDE = "1" *) (* C_OVERFLOW_LOW = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_DEPTH = "512" *) 
(* C_PRIM_FIFO36 = "0" *) (* C_PRIM_FIFO_TYPE = "512x36" *) (* C_PRIM_WIDTH = "36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_RD_DATA_COUNT_WIDTH = "13" *) (* C_RD_DEPTH = "512" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_RD_PRIM_DEPTH = "512" *) (* C_RD_PRIM_WIDTH = "36" *) (* C_READ_FASTER = "0" *) 
(* C_UNDERFLOW_LOW = "0" *) (* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) 
(* C_USE_EMBEDDED_REG = "1" *) (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "13" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_PNTR_WIDTH = "9" *) (* C_WR_PRIM_DEPTH = "512" *) 
(* C_WR_PRIM_WIDTH = "36" *) (* ORIG_REF_NAME = "builtin_top" *) (* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_builtin_top
   (WR_CLK,
    RD_CLK,
    INT_CLK,
    RD_RST,
    WR_RST,
    RST,
    SLEEP,
    DIN,
    WR_EN,
    RD_EN,
    DOUT,
    FULL,
    EMPTY,
    OVERFLOW,
    UNDERFLOW,
    PROG_FULL,
    PROG_EMPTY,
    SBITERR,
    DBITERR,
    WR_ACK,
    VALID,
    INJECTDBITERR,
    INJECTSBITERR,
    WRRSTBUSY,
    RDRSTBUSY,
    WR_DATA_COUNT,
    RD_DATA_COUNT);
  input WR_CLK;
  input RD_CLK;
  input INT_CLK;
  input RD_RST;
  input WR_RST;
  input RST;
  input SLEEP;
  input [7:0]DIN;
  input WR_EN;
  input RD_EN;
  output [7:0]DOUT;
  output FULL;
  output EMPTY;
  output OVERFLOW;
  output UNDERFLOW;
  output PROG_FULL;
  output PROG_EMPTY;
  output SBITERR;
  output DBITERR;
  output WR_ACK;
  output VALID;
  input INJECTDBITERR;
  input INJECTSBITERR;
  output WRRSTBUSY;
  output RDRSTBUSY;
  output [12:0]WR_DATA_COUNT;
  output [12:0]RD_DATA_COUNT;

  wire \<const0> ;
  wire [7:0]DIN;
  wire [7:0]DOUT;
  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_CLK;
  wire RD_EN;
  wire RST;
  wire VALID;
  wire WRRSTBUSY;
  wire WR_CLK;
  wire WR_EN;
  wire \gv.gv3.VALID_i_1_n_0 ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_DBITERR_UNCONNECTED ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_OVERFLOW_UNCONNECTED ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_EMPTY_UNCONNECTED ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_FULL_UNCONNECTED ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_SBITERR_UNCONNECTED ;
  wire \NLW_rst_val_sym.gextw_sym[1].inst_extd_UNDERFLOW_UNCONNECTED ;
  wire [35:8]\NLW_rst_val_sym.gextw_sym[1].inst_extd_DOUT_UNCONNECTED ;
  wire [12:0]\NLW_rst_val_sym.gextw_sym[1].inst_extd_RD_DATA_COUNT_UNCONNECTED ;
  wire [12:0]\NLW_rst_val_sym.gextw_sym[1].inst_extd_WR_DATA_COUNT_UNCONNECTED ;

  assign DBITERR = \<const0> ;
  assign OVERFLOW = \<const0> ;
  assign PROG_EMPTY = \<const0> ;
  assign PROG_FULL = \<const0> ;
  assign RD_DATA_COUNT[12] = \<const0> ;
  assign RD_DATA_COUNT[11] = \<const0> ;
  assign RD_DATA_COUNT[10] = \<const0> ;
  assign RD_DATA_COUNT[9] = \<const0> ;
  assign RD_DATA_COUNT[8] = \<const0> ;
  assign RD_DATA_COUNT[7] = \<const0> ;
  assign RD_DATA_COUNT[6] = \<const0> ;
  assign RD_DATA_COUNT[5] = \<const0> ;
  assign RD_DATA_COUNT[4] = \<const0> ;
  assign RD_DATA_COUNT[3] = \<const0> ;
  assign RD_DATA_COUNT[2] = \<const0> ;
  assign RD_DATA_COUNT[1] = \<const0> ;
  assign RD_DATA_COUNT[0] = \<const0> ;
  assign SBITERR = \<const0> ;
  assign UNDERFLOW = \<const0> ;
  assign WR_ACK = \<const0> ;
  assign WR_DATA_COUNT[12] = \<const0> ;
  assign WR_DATA_COUNT[11] = \<const0> ;
  assign WR_DATA_COUNT[10] = \<const0> ;
  assign WR_DATA_COUNT[9] = \<const0> ;
  assign WR_DATA_COUNT[8] = \<const0> ;
  assign WR_DATA_COUNT[7] = \<const0> ;
  assign WR_DATA_COUNT[6] = \<const0> ;
  assign WR_DATA_COUNT[5] = \<const0> ;
  assign WR_DATA_COUNT[4] = \<const0> ;
  assign WR_DATA_COUNT[3] = \<const0> ;
  assign WR_DATA_COUNT[2] = \<const0> ;
  assign WR_DATA_COUNT[1] = \<const0> ;
  assign WR_DATA_COUNT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    \gv.gv3.VALID_i_1 
       (.I0(RD_EN),
        .I1(EMPTY),
        .O(\gv.gv3.VALID_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gv.gv3.VALID_reg 
       (.C(RD_CLK),
        .CE(1'b1),
        .D(\gv.gv3.VALID_i_1_n_0 ),
        .Q(VALID),
        .R(1'b0));
  (* C_COMMON_CLOCK = "0" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DOUT_RST_VAL = "000000000" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_FAMILY = "8SERIES" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_IS_ASYMMETRIC = "0" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_NUM_PRIM_DEEP = "1" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRIM_DEPTH = "512" *) 
  (* C_PRIM_FIFO36 = "0" *) 
  (* C_PRIM_WIDTH = "36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "13" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_RD_PRIM_DEPTH = "512" *) 
  (* C_RD_PRIM_WIDTH = "36" *) 
  (* C_READ_FASTER = "0" *) 
  (* C_READ_WIDTH = "36" *) 
  (* C_USE_BI_CASCADE = "1" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_WRITE_WIDTH = "36" *) 
  (* C_WR_DATA_COUNT_WIDTH = "13" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PRIM_DEPTH = "512" *) 
  (* C_WR_PRIM_WIDTH = "36" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_builtin_extdepth \rst_val_sym.gextw_sym[1].inst_extd 
       (.DBITERR(\NLW_rst_val_sym.gextw_sym[1].inst_extd_DBITERR_UNCONNECTED ),
        .DIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,DIN}),
        .DOUT({\NLW_rst_val_sym.gextw_sym[1].inst_extd_DOUT_UNCONNECTED [35:8],DOUT}),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .INT_CLK(1'b0),
        .OVERFLOW(\NLW_rst_val_sym.gextw_sym[1].inst_extd_OVERFLOW_UNCONNECTED ),
        .PROG_EMPTY(\NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_EMPTY_UNCONNECTED ),
        .PROG_FULL(\NLW_rst_val_sym.gextw_sym[1].inst_extd_PROG_FULL_UNCONNECTED ),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_CLK(RD_CLK),
        .RD_DATA_COUNT(\NLW_rst_val_sym.gextw_sym[1].inst_extd_RD_DATA_COUNT_UNCONNECTED [12:0]),
        .RD_EN(RD_EN),
        .RD_RST(1'b0),
        .RST(RST),
        .SBITERR(\NLW_rst_val_sym.gextw_sym[1].inst_extd_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .UNDERFLOW(\NLW_rst_val_sym.gextw_sym[1].inst_extd_UNDERFLOW_UNCONNECTED ),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_CLK(WR_CLK),
        .WR_DATA_COUNT(\NLW_rst_val_sym.gextw_sym[1].inst_extd_WR_DATA_COUNT_UNCONNECTED [12:0]),
        .WR_EN(WR_EN),
        .WR_RST(1'b0));
endmodule

(* C_AXI_TYPE = "0" *) (* C_BYTE_STRB_WIDTH = "8" *) (* C_COMMON_CLOCK = "0" *) 
(* C_COUNT_TYPE = "0" *) (* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) 
(* C_DIN_WIDTH = "8" *) (* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "8" *) 
(* C_ENABLE_RLOCS = "0" *) (* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_ERROR_INJECTION_TYPE = "0" *) (* C_FAMILY = "virtexu" *) (* C_FIFO_TYPE = "0" *) 
(* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) (* C_HAS_ALMOST_FULL = "0" *) 
(* C_HAS_BACKUP = "0" *) (* C_HAS_DATA_COUNT = "0" *) (* C_HAS_INT_CLK = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SRST = "1" *) 
(* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "1" *) (* C_HAS_WR_ACK = "0" *) 
(* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) (* C_IMPLEMENTATION_TYPE = "6" *) 
(* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) (* C_MEMORY_TYPE = "4" *) 
(* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) (* C_OPTIMIZATION_MODE = "0" *) 
(* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) (* C_PRELOAD_LATENCY = "2" *) 
(* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
(* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
(* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "50" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_INPUT_CE = "0" *) 
(* C_USE_OUTPUT_CE = "0" *) (* C_USE_PIPELINE_REG = "0" *) (* C_USE_SYNC_CLK = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_FREQ = "100" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_top" *) (* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_fifo_generator_top
   (BACKUP,
    BACKUP_MARKER,
    INT_CLK,
    SLEEP,
    CLK,
    WR_CLK,
    RD_CLK,
    RST,
    SRST,
    WR_RST,
    RD_RST,
    DIN,
    WR_EN,
    RD_EN,
    PROG_EMPTY_THRESH,
    PROG_EMPTY_THRESH_ASSERT,
    PROG_EMPTY_THRESH_NEGATE,
    PROG_FULL_THRESH,
    PROG_FULL_THRESH_ASSERT,
    PROG_FULL_THRESH_NEGATE,
    INJECTDBITERR,
    INJECTSBITERR,
    INPUT_CE,
    OUTPUT_CE,
    END_OF_PACKET,
    DOUT,
    FULL,
    ALMOST_FULL,
    WR_ACK,
    OVERFLOW,
    EMPTY,
    ALMOST_EMPTY,
    VALID,
    UNDERFLOW,
    DATA_COUNT,
    RD_DATA_COUNT,
    WR_DATA_COUNT,
    PROG_FULL,
    PROG_EMPTY,
    SBITERR,
    DBITERR,
    WR_RST_BUSY,
    RD_RST_BUSY);
  input BACKUP;
  input BACKUP_MARKER;
  input INT_CLK;
  input SLEEP;
  input CLK;
  input WR_CLK;
  input RD_CLK;
  input RST;
  input SRST;
  input WR_RST;
  input RD_RST;
  input [7:0]DIN;
  input WR_EN;
  input RD_EN;
  input [8:0]PROG_EMPTY_THRESH;
  input [8:0]PROG_EMPTY_THRESH_ASSERT;
  input [8:0]PROG_EMPTY_THRESH_NEGATE;
  input [8:0]PROG_FULL_THRESH;
  input [8:0]PROG_FULL_THRESH_ASSERT;
  input [8:0]PROG_FULL_THRESH_NEGATE;
  input INJECTDBITERR;
  input INJECTSBITERR;
  input INPUT_CE;
  input OUTPUT_CE;
  input END_OF_PACKET;
  output [7:0]DOUT;
  output FULL;
  output ALMOST_FULL;
  output WR_ACK;
  output OVERFLOW;
  output EMPTY;
  output ALMOST_EMPTY;
  output VALID;
  output UNDERFLOW;
  output [8:0]DATA_COUNT;
  output [8:0]RD_DATA_COUNT;
  output [8:0]WR_DATA_COUNT;
  output PROG_FULL;
  output PROG_EMPTY;
  output SBITERR;
  output DBITERR;
  output WR_RST_BUSY;
  output RD_RST_BUSY;

  wire \<const0> ;
  wire [7:0]DIN;
  wire [7:0]DOUT;
  wire EMPTY;
  wire FULL;
  wire RD_CLK;
  wire RD_EN;
  wire RD_RST_BUSY;
  wire SRST;
  wire VALID;
  wire WR_CLK;
  wire WR_EN;
  wire WR_RST_BUSY;
  wire \NLW_gbi.bi_ALMOST_EMPTY_UNCONNECTED ;
  wire \NLW_gbi.bi_ALMOST_FULL_UNCONNECTED ;
  wire \NLW_gbi.bi_DBITERR_UNCONNECTED ;
  wire \NLW_gbi.bi_OVERFLOW_UNCONNECTED ;
  wire \NLW_gbi.bi_PROG_EMPTY_UNCONNECTED ;
  wire \NLW_gbi.bi_PROG_FULL_UNCONNECTED ;
  wire \NLW_gbi.bi_SBITERR_UNCONNECTED ;
  wire \NLW_gbi.bi_UNDERFLOW_UNCONNECTED ;
  wire \NLW_gbi.bi_WR_ACK_UNCONNECTED ;
  wire [8:0]\NLW_gbi.bi_RD_DATA_COUNT_UNCONNECTED ;
  wire [8:0]\NLW_gbi.bi_WR_DATA_COUNT_UNCONNECTED ;

  assign ALMOST_EMPTY = \<const0> ;
  assign ALMOST_FULL = \<const0> ;
  assign DATA_COUNT[8] = \<const0> ;
  assign DATA_COUNT[7] = \<const0> ;
  assign DATA_COUNT[6] = \<const0> ;
  assign DATA_COUNT[5] = \<const0> ;
  assign DATA_COUNT[4] = \<const0> ;
  assign DATA_COUNT[3] = \<const0> ;
  assign DATA_COUNT[2] = \<const0> ;
  assign DATA_COUNT[1] = \<const0> ;
  assign DATA_COUNT[0] = \<const0> ;
  assign DBITERR = \<const0> ;
  assign OVERFLOW = \<const0> ;
  assign PROG_EMPTY = \<const0> ;
  assign PROG_FULL = \<const0> ;
  assign RD_DATA_COUNT[8] = \<const0> ;
  assign RD_DATA_COUNT[7] = \<const0> ;
  assign RD_DATA_COUNT[6] = \<const0> ;
  assign RD_DATA_COUNT[5] = \<const0> ;
  assign RD_DATA_COUNT[4] = \<const0> ;
  assign RD_DATA_COUNT[3] = \<const0> ;
  assign RD_DATA_COUNT[2] = \<const0> ;
  assign RD_DATA_COUNT[1] = \<const0> ;
  assign RD_DATA_COUNT[0] = \<const0> ;
  assign SBITERR = \<const0> ;
  assign UNDERFLOW = \<const0> ;
  assign WR_ACK = \<const0> ;
  assign WR_DATA_COUNT[8] = \<const0> ;
  assign WR_DATA_COUNT[7] = \<const0> ;
  assign WR_DATA_COUNT[6] = \<const0> ;
  assign WR_DATA_COUNT[5] = \<const0> ;
  assign WR_DATA_COUNT[4] = \<const0> ;
  assign WR_DATA_COUNT[3] = \<const0> ;
  assign WR_DATA_COUNT[2] = \<const0> ;
  assign WR_DATA_COUNT[1] = \<const0> ;
  assign WR_DATA_COUNT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_COMMON_CLOCK = "0" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_FAMILY = "virtexu" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_RATIO_DEPTH_RD = "1" *) 
  (* C_RATIO_DEPTH_WR = "1" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "50" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin \gbi.bi 
       (.ALMOST_EMPTY(\NLW_gbi.bi_ALMOST_EMPTY_UNCONNECTED ),
        .ALMOST_FULL(\NLW_gbi.bi_ALMOST_FULL_UNCONNECTED ),
        .CLK(1'b0),
        .DBITERR(\NLW_gbi.bi_DBITERR_UNCONNECTED ),
        .DIN(DIN),
        .DOUT(DOUT),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .INT_CLK(1'b0),
        .OVERFLOW(\NLW_gbi.bi_OVERFLOW_UNCONNECTED ),
        .PROG_EMPTY(\NLW_gbi.bi_PROG_EMPTY_UNCONNECTED ),
        .PROG_EMPTY_THRESH({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_EMPTY_THRESH_ASSERT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_EMPTY_THRESH_NEGATE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL(\NLW_gbi.bi_PROG_FULL_UNCONNECTED ),
        .PROG_FULL_THRESH({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL_THRESH_ASSERT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL_THRESH_NEGATE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RDRSTBUSY(RD_RST_BUSY),
        .RD_CLK(RD_CLK),
        .RD_DATA_COUNT(\NLW_gbi.bi_RD_DATA_COUNT_UNCONNECTED [8:0]),
        .RD_EN(RD_EN),
        .RST(SRST),
        .SBITERR(\NLW_gbi.bi_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .UNDERFLOW(\NLW_gbi.bi_UNDERFLOW_UNCONNECTED ),
        .VALID(VALID),
        .WRRSTBUSY(WR_RST_BUSY),
        .WR_ACK(\NLW_gbi.bi_WR_ACK_UNCONNECTED ),
        .WR_CLK(WR_CLK),
        .WR_DATA_COUNT(\NLW_gbi.bi_WR_DATA_COUNT_UNCONNECTED [8:0]),
        .WR_EN(WR_EN));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "8" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "8" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "virtexu" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "6" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "4" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "50" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "100" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_1_1" *) 
module fifo_host_to_fpga_8x512_fifo_generator_v13_1_1
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  input [8:0]prog_empty_thresh;
  input [8:0]prog_empty_thresh_assert;
  input [8:0]prog_empty_thresh_negate;
  input [8:0]prog_full_thresh;
  input [8:0]prog_full_thresh_assert;
  input [8:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [7:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [8:0]data_count;
  output [8:0]rd_data_count;
  output [8:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire \<const1> ;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_inst_fifo_gen_almost_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_almost_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_ar_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_aw_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_b_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_r_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axi_w_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_axis_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_dbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_arvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_awvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_bready_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_rready_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_wlast_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axi_wvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axis_tlast_UNCONNECTED;
  wire NLW_inst_fifo_gen_m_axis_tvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_overflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_prog_empty_UNCONNECTED;
  wire NLW_inst_fifo_gen_prog_full_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_arready_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_awready_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_bvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_rlast_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_rvalid_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axi_wready_UNCONNECTED;
  wire NLW_inst_fifo_gen_s_axis_tready_UNCONNECTED;
  wire NLW_inst_fifo_gen_sbiterr_UNCONNECTED;
  wire NLW_inst_fifo_gen_underflow_UNCONNECTED;
  wire NLW_inst_fifo_gen_wr_ack_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_inst_fifo_gen_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_inst_fifo_gen_axis_wr_data_count_UNCONNECTED;
  wire [8:0]NLW_inst_fifo_gen_data_count_UNCONNECTED;
  wire [31:0]NLW_inst_fifo_gen_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_inst_fifo_gen_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_inst_fifo_gen_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_inst_fifo_gen_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_inst_fifo_gen_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_inst_fifo_gen_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_inst_fifo_gen_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_inst_fifo_gen_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_inst_fifo_gen_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_inst_fifo_gen_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_inst_fifo_gen_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_inst_fifo_gen_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_inst_fifo_gen_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_inst_fifo_gen_m_axis_tuser_UNCONNECTED;
  wire [8:0]NLW_inst_fifo_gen_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_inst_fifo_gen_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_inst_fifo_gen_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_inst_fifo_gen_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_inst_fifo_gen_s_axi_ruser_UNCONNECTED;
  wire [8:0]NLW_inst_fifo_gen_wr_data_count_UNCONNECTED;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const1> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const1> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const1> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const1> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const1> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const1> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "virtexu" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "50" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth inst_fifo_gen
       (.almost_empty(NLW_inst_fifo_gen_almost_empty_UNCONNECTED),
        .almost_full(NLW_inst_fifo_gen_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_inst_fifo_gen_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_inst_fifo_gen_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_inst_fifo_gen_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_inst_fifo_gen_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_inst_fifo_gen_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_inst_fifo_gen_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_inst_fifo_gen_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_inst_fifo_gen_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_inst_fifo_gen_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_inst_fifo_gen_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_inst_fifo_gen_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_inst_fifo_gen_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_inst_fifo_gen_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_inst_fifo_gen_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_inst_fifo_gen_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_inst_fifo_gen_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_inst_fifo_gen_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_inst_fifo_gen_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_inst_fifo_gen_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_inst_fifo_gen_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_inst_fifo_gen_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_inst_fifo_gen_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_inst_fifo_gen_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_inst_fifo_gen_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_inst_fifo_gen_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_inst_fifo_gen_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_inst_fifo_gen_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_inst_fifo_gen_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_inst_fifo_gen_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_inst_fifo_gen_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_inst_fifo_gen_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_inst_fifo_gen_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_inst_fifo_gen_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_inst_fifo_gen_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_inst_fifo_gen_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_inst_fifo_gen_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_inst_fifo_gen_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_inst_fifo_gen_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_inst_fifo_gen_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_inst_fifo_gen_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_inst_fifo_gen_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_inst_fifo_gen_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_inst_fifo_gen_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_inst_fifo_gen_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_inst_fifo_gen_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_inst_fifo_gen_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_inst_fifo_gen_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_inst_fifo_gen_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_inst_fifo_gen_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_inst_fifo_gen_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_inst_fifo_gen_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_inst_fifo_gen_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_inst_fifo_gen_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_inst_fifo_gen_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_inst_fifo_gen_data_count_UNCONNECTED[8:0]),
        .dbiterr(NLW_inst_fifo_gen_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_inst_fifo_gen_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_inst_fifo_gen_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_inst_fifo_gen_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_inst_fifo_gen_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_inst_fifo_gen_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_inst_fifo_gen_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_inst_fifo_gen_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_inst_fifo_gen_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_inst_fifo_gen_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_inst_fifo_gen_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_inst_fifo_gen_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_inst_fifo_gen_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_inst_fifo_gen_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_inst_fifo_gen_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_inst_fifo_gen_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_inst_fifo_gen_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_inst_fifo_gen_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_inst_fifo_gen_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_inst_fifo_gen_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_inst_fifo_gen_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_inst_fifo_gen_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_inst_fifo_gen_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_inst_fifo_gen_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_inst_fifo_gen_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_inst_fifo_gen_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_inst_fifo_gen_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_inst_fifo_gen_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_inst_fifo_gen_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_inst_fifo_gen_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_inst_fifo_gen_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_inst_fifo_gen_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_inst_fifo_gen_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_inst_fifo_gen_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_inst_fifo_gen_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_fifo_gen_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_inst_fifo_gen_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_inst_fifo_gen_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_inst_fifo_gen_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_inst_fifo_gen_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_inst_fifo_gen_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_inst_fifo_gen_overflow_UNCONNECTED),
        .prog_empty(NLW_inst_fifo_gen_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_inst_fifo_gen_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_inst_fifo_gen_rd_data_count_UNCONNECTED[8:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_inst_fifo_gen_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_inst_fifo_gen_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_inst_fifo_gen_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_inst_fifo_gen_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_inst_fifo_gen_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_inst_fifo_gen_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_inst_fifo_gen_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_inst_fifo_gen_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_inst_fifo_gen_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_inst_fifo_gen_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_inst_fifo_gen_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_inst_fifo_gen_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_inst_fifo_gen_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_inst_fifo_gen_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_inst_fifo_gen_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(srst),
        .underflow(NLW_inst_fifo_gen_underflow_UNCONNECTED),
        .valid(valid),
        .wr_ack(NLW_inst_fifo_gen_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_inst_fifo_gen_wr_data_count_UNCONNECTED[8:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* C_COMMON_CLOCK = "0" *) (* C_DIN_WIDTH = "8" *) (* C_DOUT_RST_VAL = "0" *) 
(* C_DOUT_WIDTH = "8" *) (* C_ENABLE_RST_SYNC = "1" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_FAMILY = "virtexu" *) (* C_HAS_ALMOST_EMPTY = "0" *) (* C_HAS_ALMOST_FULL = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_OVERFLOW = "0" *) 
(* C_HAS_RD_DATA_COUNT = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_IMPLEMENTATION_TYPE = "6" *) 
(* C_INTERFACE_TYPE = "0" *) (* C_MSGON_VAL = "1" *) (* C_OVERFLOW_LOW = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_RATIO_DEPTH_RD = "1" *) (* C_RATIO_DEPTH_WR = "1" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "50" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_UNDERFLOW_LOW = "0" *) (* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) 
(* C_USE_EMBEDDED_REG = "1" *) (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_FREQ = "100" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* ORIG_REF_NAME = "fifo_generator_v13_1_1_builtin" *) (* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_builtin
   (CLK,
    WR_CLK,
    RD_CLK,
    INT_CLK,
    RST,
    SLEEP,
    DIN,
    WR_EN,
    RD_EN,
    PROG_FULL_THRESH,
    PROG_FULL_THRESH_ASSERT,
    PROG_FULL_THRESH_NEGATE,
    PROG_EMPTY_THRESH,
    PROG_EMPTY_THRESH_ASSERT,
    PROG_EMPTY_THRESH_NEGATE,
    INJECTDBITERR,
    INJECTSBITERR,
    DOUT,
    FULL,
    EMPTY,
    ALMOST_FULL,
    ALMOST_EMPTY,
    WR_ACK,
    VALID,
    OVERFLOW,
    UNDERFLOW,
    PROG_FULL,
    PROG_EMPTY,
    SBITERR,
    DBITERR,
    WRRSTBUSY,
    RDRSTBUSY,
    WR_DATA_COUNT,
    RD_DATA_COUNT);
  input CLK;
  input WR_CLK;
  input RD_CLK;
  input INT_CLK;
  input RST;
  input SLEEP;
  input [7:0]DIN;
  input WR_EN;
  input RD_EN;
  input [8:0]PROG_FULL_THRESH;
  input [8:0]PROG_FULL_THRESH_ASSERT;
  input [8:0]PROG_FULL_THRESH_NEGATE;
  input [8:0]PROG_EMPTY_THRESH;
  input [8:0]PROG_EMPTY_THRESH_ASSERT;
  input [8:0]PROG_EMPTY_THRESH_NEGATE;
  input INJECTDBITERR;
  input INJECTSBITERR;
  output [7:0]DOUT;
  output FULL;
  output EMPTY;
  output ALMOST_FULL;
  output ALMOST_EMPTY;
  output WR_ACK;
  output VALID;
  output OVERFLOW;
  output UNDERFLOW;
  output PROG_FULL;
  output PROG_EMPTY;
  output SBITERR;
  output DBITERR;
  output WRRSTBUSY;
  output RDRSTBUSY;
  output [8:0]WR_DATA_COUNT;
  output [8:0]RD_DATA_COUNT;

  wire \<const0> ;
  wire [7:0]DIN;
  wire [7:0]DOUT;
  wire EMPTY;
  wire FULL;
  wire RDRSTBUSY;
  wire RD_CLK;
  wire RD_EN;
  wire RST;
  wire VALID;
  wire WRRSTBUSY;
  wire WR_CLK;
  wire WR_EN;
  wire \NLW_v8_fifo.fblk_DBITERR_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_OVERFLOW_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_PROG_EMPTY_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_PROG_FULL_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_SBITERR_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_UNDERFLOW_UNCONNECTED ;
  wire \NLW_v8_fifo.fblk_WR_ACK_UNCONNECTED ;
  wire [12:0]\NLW_v8_fifo.fblk_RD_DATA_COUNT_UNCONNECTED ;
  wire [12:0]\NLW_v8_fifo.fblk_WR_DATA_COUNT_UNCONNECTED ;

  assign ALMOST_EMPTY = \<const0> ;
  assign ALMOST_FULL = \<const0> ;
  assign DBITERR = \<const0> ;
  assign OVERFLOW = \<const0> ;
  assign PROG_EMPTY = \<const0> ;
  assign PROG_FULL = \<const0> ;
  assign RD_DATA_COUNT[8] = \<const0> ;
  assign RD_DATA_COUNT[7] = \<const0> ;
  assign RD_DATA_COUNT[6] = \<const0> ;
  assign RD_DATA_COUNT[5] = \<const0> ;
  assign RD_DATA_COUNT[4] = \<const0> ;
  assign RD_DATA_COUNT[3] = \<const0> ;
  assign RD_DATA_COUNT[2] = \<const0> ;
  assign RD_DATA_COUNT[1] = \<const0> ;
  assign RD_DATA_COUNT[0] = \<const0> ;
  assign SBITERR = \<const0> ;
  assign UNDERFLOW = \<const0> ;
  assign WR_ACK = \<const0> ;
  assign WR_DATA_COUNT[8] = \<const0> ;
  assign WR_DATA_COUNT[7] = \<const0> ;
  assign WR_DATA_COUNT[6] = \<const0> ;
  assign WR_DATA_COUNT[5] = \<const0> ;
  assign WR_DATA_COUNT[4] = \<const0> ;
  assign WR_DATA_COUNT[3] = \<const0> ;
  assign WR_DATA_COUNT[2] = \<const0> ;
  assign WR_DATA_COUNT[1] = \<const0> ;
  assign WR_DATA_COUNT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_COMMON_CLOCK = "0" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_FAMILY = "8SERIES" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_OVERFLOW = "1" *) 
  (* C_HAS_UNDERFLOW = "1" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "1" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_NUM_PRIM_DEEP = "1" *) 
  (* C_NUM_PRIM_WIDE = "1" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_DEPTH = "512" *) 
  (* C_PRIM_FIFO36 = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_WIDTH = "36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "13" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_RD_PRIM_DEPTH = "512" *) 
  (* C_RD_PRIM_WIDTH = "36" *) 
  (* C_READ_FASTER = "0" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_LOW_LATENCY_BI_FIFO = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "13" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_PRIM_DEPTH = "512" *) 
  (* C_WR_PRIM_WIDTH = "36" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_builtin_top \v8_fifo.fblk 
       (.DBITERR(\NLW_v8_fifo.fblk_DBITERR_UNCONNECTED ),
        .DIN(DIN),
        .DOUT(DOUT),
        .EMPTY(EMPTY),
        .FULL(FULL),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .INT_CLK(1'b0),
        .OVERFLOW(\NLW_v8_fifo.fblk_OVERFLOW_UNCONNECTED ),
        .PROG_EMPTY(\NLW_v8_fifo.fblk_PROG_EMPTY_UNCONNECTED ),
        .PROG_FULL(\NLW_v8_fifo.fblk_PROG_FULL_UNCONNECTED ),
        .RDRSTBUSY(RDRSTBUSY),
        .RD_CLK(RD_CLK),
        .RD_DATA_COUNT(\NLW_v8_fifo.fblk_RD_DATA_COUNT_UNCONNECTED [12:0]),
        .RD_EN(RD_EN),
        .RD_RST(1'b0),
        .RST(RST),
        .SBITERR(\NLW_v8_fifo.fblk_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .UNDERFLOW(\NLW_v8_fifo.fblk_UNDERFLOW_UNCONNECTED ),
        .VALID(VALID),
        .WRRSTBUSY(WRRSTBUSY),
        .WR_ACK(\NLW_v8_fifo.fblk_WR_ACK_UNCONNECTED ),
        .WR_CLK(WR_CLK),
        .WR_DATA_COUNT(\NLW_v8_fifo.fblk_WR_DATA_COUNT_UNCONNECTED [12:0]),
        .WR_EN(WR_EN),
        .WR_RST(1'b0));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "8" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "1" *) (* C_AXIS_TSTRB_WIDTH = "1" *) 
(* C_AXIS_TUSER_WIDTH = "4" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "1" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "1" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "1" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "9" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "8" *) 
(* C_DIN_WIDTH_AXIS = "1" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "1" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "8" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "virtexu" *) (* C_FULL_FLAGS_RST_VAL = "0" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "0" *) (* C_HAS_AXIS_TLAST = "0" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "1" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "1" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "0" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "0" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "1" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "1" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "6" *) (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "1" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "1" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "0" *) 
(* C_MEMORY_TYPE = "4" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "1" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "2" *) (* C_PRELOAD_REGS = "1" *) (* C_PRIM_FIFO_TYPE = "512x36" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) (* C_PRIM_FIFO_TYPE_RACH = "1kx36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
(* C_PRIM_FIFO_TYPE_WACH = "8kx4" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) (* C_PRIM_FIFO_TYPE_WRCH = "8kx4" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "9" *) 
(* C_RD_DEPTH = "512" *) (* C_RD_FREQ = "50" *) (* C_RD_PNTR_WIDTH = "9" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "1" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "9" *) 
(* C_WR_DEPTH = "512" *) (* C_WR_DEPTH_AXIS = "1024" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "100" *) (* C_WR_PNTR_WIDTH = "9" *) 
(* C_WR_PNTR_WIDTH_AXIS = "10" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) (* ORIG_REF_NAME = "fifo_generator_v13_1_1_synth" *) (* downgradeipidentifiedwarnings = "yes" *) 
module fifo_host_to_fpga_8x512_fifo_generator_v13_1_1_synth
   (backup,
    backup_marker,
    sleep,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input sleep;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [7:0]din;
  input wr_en;
  input rd_en;
  input [8:0]prog_empty_thresh;
  input [8:0]prog_empty_thresh_assert;
  input [8:0]prog_empty_thresh_negate;
  input [8:0]prog_full_thresh;
  input [8:0]prog_full_thresh_assert;
  input [8:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  output [7:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [8:0]data_count;
  output [8:0]rd_data_count;
  output [8:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [0:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [0:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [0:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [0:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [0:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [0:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [0:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [0:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [0:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [0:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [0:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [0:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [0:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [0:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [7:0]s_axis_tdata;
  input [0:0]s_axis_tstrb;
  input [0:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [3:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [7:0]m_axis_tdata;
  output [0:0]m_axis_tstrb;
  output [0:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [3:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [9:0]axis_prog_full_thresh;
  input [9:0]axis_prog_empty_thresh;
  output [10:0]axis_data_count;
  output [10:0]axis_wr_data_count;
  output [10:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire rd_rst_busy;
  wire srst;
  wire valid;
  wire wr_clk;
  wire wr_en;
  wire wr_rst_busy;
  wire \NLW_gconvfifo.rf_ALMOST_EMPTY_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_ALMOST_FULL_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_DBITERR_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_OVERFLOW_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_PROG_EMPTY_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_PROG_FULL_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_SBITERR_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_UNDERFLOW_UNCONNECTED ;
  wire \NLW_gconvfifo.rf_WR_ACK_UNCONNECTED ;
  wire [8:0]\NLW_gconvfifo.rf_DATA_COUNT_UNCONNECTED ;
  wire [8:0]\NLW_gconvfifo.rf_RD_DATA_COUNT_UNCONNECTED ;
  wire [8:0]\NLW_gconvfifo.rf_WR_DATA_COUNT_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const0> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const0> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const0> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const0> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const0> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const0> ;
  assign axis_prog_full = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdata[7] = \<const0> ;
  assign m_axis_tdata[6] = \<const0> ;
  assign m_axis_tdata[5] = \<const0> ;
  assign m_axis_tdata[4] = \<const0> ;
  assign m_axis_tdata[3] = \<const0> ;
  assign m_axis_tdata[2] = \<const0> ;
  assign m_axis_tdata[1] = \<const0> ;
  assign m_axis_tdata[0] = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tlast = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[3] = \<const0> ;
  assign m_axis_tuser[2] = \<const0> ;
  assign m_axis_tuser[1] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign m_axis_tvalid = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign s_axis_tready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AXI_TYPE = "0" *) 
  (* C_BYTE_STRB_WIDTH = "8" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "9" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_FAMILY = "virtexu" *) 
  (* C_FIFO_TYPE = "0" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SRST = "1" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "1" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "6" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "4" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "2" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "5" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "6" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "511" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "510" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "9" *) 
  (* C_RD_DEPTH = "512" *) 
  (* C_RD_FREQ = "50" *) 
  (* C_RD_PNTR_WIDTH = "9" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_EMBEDDED_REG = "1" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_INPUT_CE = "0" *) 
  (* C_USE_OUTPUT_CE = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_USE_SYNC_CLK = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "9" *) 
  (* C_WR_DEPTH = "512" *) 
  (* C_WR_FREQ = "100" *) 
  (* C_WR_PNTR_WIDTH = "9" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  fifo_host_to_fpga_8x512_fifo_generator_top \gconvfifo.rf 
       (.ALMOST_EMPTY(\NLW_gconvfifo.rf_ALMOST_EMPTY_UNCONNECTED ),
        .ALMOST_FULL(\NLW_gconvfifo.rf_ALMOST_FULL_UNCONNECTED ),
        .BACKUP(1'b0),
        .BACKUP_MARKER(1'b0),
        .CLK(1'b0),
        .DATA_COUNT(\NLW_gconvfifo.rf_DATA_COUNT_UNCONNECTED [8:0]),
        .DBITERR(\NLW_gconvfifo.rf_DBITERR_UNCONNECTED ),
        .DIN(din),
        .DOUT(dout),
        .EMPTY(empty),
        .END_OF_PACKET(1'b0),
        .FULL(full),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .INPUT_CE(1'b0),
        .INT_CLK(1'b0),
        .OUTPUT_CE(1'b0),
        .OVERFLOW(\NLW_gconvfifo.rf_OVERFLOW_UNCONNECTED ),
        .PROG_EMPTY(\NLW_gconvfifo.rf_PROG_EMPTY_UNCONNECTED ),
        .PROG_EMPTY_THRESH({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_EMPTY_THRESH_ASSERT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_EMPTY_THRESH_NEGATE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL(\NLW_gconvfifo.rf_PROG_FULL_UNCONNECTED ),
        .PROG_FULL_THRESH({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL_THRESH_ASSERT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PROG_FULL_THRESH_NEGATE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .RD_CLK(rd_clk),
        .RD_DATA_COUNT(\NLW_gconvfifo.rf_RD_DATA_COUNT_UNCONNECTED [8:0]),
        .RD_EN(rd_en),
        .RD_RST(1'b0),
        .RD_RST_BUSY(rd_rst_busy),
        .RST(1'b0),
        .SBITERR(\NLW_gconvfifo.rf_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .SRST(srst),
        .UNDERFLOW(\NLW_gconvfifo.rf_UNDERFLOW_UNCONNECTED ),
        .VALID(valid),
        .WR_ACK(\NLW_gconvfifo.rf_WR_ACK_UNCONNECTED ),
        .WR_CLK(wr_clk),
        .WR_DATA_COUNT(\NLW_gconvfifo.rf_WR_DATA_COUNT_UNCONNECTED [8:0]),
        .WR_EN(wr_en),
        .WR_RST(1'b0),
        .WR_RST_BUSY(wr_rst_busy));
endmodule
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
