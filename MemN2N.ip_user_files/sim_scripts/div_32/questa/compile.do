vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/xbip_utils_v3_0_6
vlib msim/axi_utils_v2_0_2
vlib msim/xbip_pipe_v3_0_2
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_dsp48_addsub_v3_0_2
vlib msim/xbip_bram18k_v3_0_2
vlib msim/mult_gen_v12_0_11
vlib msim/floating_point_v7_0_12
vlib msim/xbip_dsp48_mult_v3_0_2
vlib msim/xbip_dsp48_multadd_v3_0_2
vlib msim/div_gen_v5_1_10

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap xbip_utils_v3_0_6 msim/xbip_utils_v3_0_6
vmap axi_utils_v2_0_2 msim/axi_utils_v2_0_2
vmap xbip_pipe_v3_0_2 msim/xbip_pipe_v3_0_2
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_2 msim/xbip_dsp48_addsub_v3_0_2
vmap xbip_bram18k_v3_0_2 msim/xbip_bram18k_v3_0_2
vmap mult_gen_v12_0_11 msim/mult_gen_v12_0_11
vmap floating_point_v7_0_12 msim/floating_point_v7_0_12
vmap xbip_dsp48_mult_v3_0_2 msim/xbip_dsp48_mult_v3_0_2
vmap xbip_dsp48_multadd_v3_0_2 msim/xbip_dsp48_multadd_v3_0_2
vmap div_gen_v5_1_10 msim/div_gen_v5_1_10

vlog -work xil_defaultlib -64 -sv \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -64 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_6 -64 \
"../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_2 -64 \
"../../../ipstatic/axi_utils_v2_0_2/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_2 -64 \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 \
"../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_2 -64 \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_bram18k_v3_0_2 -64 \
"../../../ipstatic/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_bram18k_v3_0_2/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_11 -64 \
"../../../ipstatic/mult_gen_v12_0_11/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../ipstatic/mult_gen_v12_0_11/hdl/mult_gen_v12_0.vhd" \

vcom -work floating_point_v7_0_12 -64 \
"../../../ipstatic/floating_point_v7_0_12/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_mult_v3_0_2 -64 \
"../../../ipstatic/xbip_dsp48_mult_v3_0_2/hdl/xbip_dsp48_mult_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_mult_v3_0_2/hdl/xbip_dsp48_mult_v3_0.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_2 -64 \
"../../../ipstatic/xbip_dsp48_multadd_v3_0_2/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
"../../../ipstatic/xbip_dsp48_multadd_v3_0_2/hdl/xbip_dsp48_multadd_v3_0.vhd" \

vcom -work div_gen_v5_1_10 -64 \
"../../../ipstatic/div_gen_v5_1_10/hdl/div_gen_v5_1_vh_rfs.vhd" \
"../../../ipstatic/div_gen_v5_1_10/hdl/div_gen_v5_1.vhd" \

vcom -work xil_defaultlib -64 \
"../../../ip/div_32/sim/div_32.vhd" \

vlog -work xil_defaultlib "glbl.v"

