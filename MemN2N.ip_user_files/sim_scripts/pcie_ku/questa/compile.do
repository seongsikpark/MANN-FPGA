vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/gtwizard_ultrascale_v1_5_4

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap gtwizard_ultrascale_v1_5_4 msim/gtwizard_ultrascale_v1_5_4

vlog -work xil_defaultlib -64 -sv \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 \
"/opt/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work gtwizard_ultrascale_v1_5_4 -64 \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_bit_synchronizer.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gthe3_cpll_cal.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gthe3_cpll_cal_freq_counter.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_buffbypass_rx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_buffbypass_tx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_reset.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_userclk_rx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_userclk_tx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_userdata_rx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_gtwiz_userdata_tx.v" \
"../../../ipstatic/gtwizard_ultrascale_v1_5_4/hdl/verilog/gtwizard_ultrascale_v1_5_reset_synchronizer.v" \

vlog -work xil_defaultlib -64 \
"../../../ip/pcie_ku/ip_0/sim/gtwizard_ultrascale_v1_5_gthe3_channel.v" \
"../../../ip/pcie_ku/ip_0/sim/pcie_ku_gt_gthe3_channel_wrapper.v" \
"../../../ip/pcie_ku/ip_0/sim/pcie_ku_gt_gtwizard_gthe3.v" \
"../../../ip/pcie_ku/ip_0/sim/pcie_ku_gt_gtwizard_top.v" \
"../../../ip/pcie_ku/ip_0/sim/pcie_ku_gt.v" \
"../../../ip/pcie_ku/source/pcie_ku_tph_tbl.v" \
"../../../ip/pcie_ku/source/pcie_ku_pipe_lane.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_16k.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_rep_8k.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_req_8k.v" \
"../../../ip/pcie_ku/source/pcie_ku_gt_channel.v" \
"../../../ip/pcie_ku/source/pcie_ku_pipe_pipeline.v" \
"../../../ip/pcie_ku/source/pcie_ku_pipe_misc.v" \
"../../../ip/pcie_ku/source/pcie_ku_init_ctrl.v" \
"../../../ip/pcie_ku/source/pcie_ku_gt_common.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_8k.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_rep.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_req.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_sync.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram_cpl.v" \
"../../../ip/pcie_ku/source/pcie_ku_sys_clk_gen.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_rst.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_txeq.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_clk.v" \
"../../../ip/pcie_ku/source/pcie_ku_bram.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_rxeq.v" \
"../../../ip/pcie_ku/source/pcie_ku_gtwizard_top.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_wrapper.v" \
"../../../ip/pcie_ku/source/pcie_ku_pcie3_uscale_wrapper.v" \
"../../../ip/pcie_ku/source/pcie_ku_pcie3_uscale_top.v" \
"../../../ip/pcie_ku/source/pcie_ku_phy_sync_cell.v" \
"../../../ip/pcie_ku/source/pcie_ku_rxcdrhold.v" \
"../../../ip/pcie_ku/source/pcie_ku_pcie3_uscale_core_top.v" \
"../../../ip/pcie_ku/sim/pcie_ku.v" \

vlog -work xil_defaultlib "glbl.v"

