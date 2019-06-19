vlib work
vlib msim

vlib msim/xbip_utils_v3_0_5
vlib msim/axi_utils_v2_0_1
vlib msim/xbip_pipe_v3_0_1
vlib msim/xbip_dsp48_wrapper_v3_0_4
vlib msim/xbip_dsp48_addsub_v3_0_1
vlib msim/xbip_bram18k_v3_0_1
vlib msim/mult_gen_v12_0_10
vlib msim/floating_point_v7_0_11
vlib msim/xbip_dsp48_mult_v3_0_1
vlib msim/xbip_dsp48_multadd_v3_0_1
vlib msim/div_gen_v5_1_9
vlib msim/fifo_generator_v13_0_1
vlib msim/xil_defaultlib
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_8

vmap xbip_utils_v3_0_5 msim/xbip_utils_v3_0_5
vmap axi_utils_v2_0_1 msim/axi_utils_v2_0_1
vmap xbip_pipe_v3_0_1 msim/xbip_pipe_v3_0_1
vmap xbip_dsp48_wrapper_v3_0_4 msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_1 msim/xbip_dsp48_addsub_v3_0_1
vmap xbip_bram18k_v3_0_1 msim/xbip_bram18k_v3_0_1
vmap mult_gen_v12_0_10 msim/mult_gen_v12_0_10
vmap floating_point_v7_0_11 msim/floating_point_v7_0_11
vmap xbip_dsp48_mult_v3_0_1 msim/xbip_dsp48_mult_v3_0_1
vmap xbip_dsp48_multadd_v3_0_1 msim/xbip_dsp48_multadd_v3_0_1
vmap div_gen_v5_1_9 msim/div_gen_v5_1_9
vmap fifo_generator_v13_0_1 msim/fifo_generator_v13_0_1
vmap xil_defaultlib msim/xil_defaultlib
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_8 msim/proc_sys_reset_v5_0_8

vcom -work xbip_utils_v3_0_5 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_utils_v3_0_5/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/axi_utils_v2_0_1/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_pipe_v3_0_1/hdl/xbip_pipe_v3_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_addsub_v3_0_1/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_addsub_v3_0_1/hdl/xbip_dsp48_addsub_v3_0.vhd" \

vcom -work xbip_bram18k_v3_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_bram18k_v3_0_1/hdl/xbip_bram18k_v3_0.vhd" \

vcom -work mult_gen_v12_0_10 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/mult_gen_v12_0_10/hdl/mult_gen_v12_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/mult_gen_v12_0_10/hdl/mult_gen_v12_0.vhd" \

vcom -work floating_point_v7_0_11 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/floating_point_v7_0_11/hdl/floating_point_v7_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_mult_v3_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_mult_v3_0_1/hdl/xbip_dsp48_mult_v3_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_mult_v3_0_1/hdl/xbip_dsp48_mult_v3_0.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_multadd_v3_0_1/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/xbip_dsp48_multadd_v3_0_1/hdl/xbip_dsp48_multadd_v3_0.vhd" \

vcom -work div_gen_v5_1_9 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/div_gen_v5_1_9/hdl/div_gen_v5_1_vh_rfs.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/div_gen_v5_1_9/hdl/div_gen_v5_1.vhd" \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/div_32/sim/div_32.vhd" \

vcom -work fifo_generator_v13_0_1 -64 -93 \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/fifo_32x1024/fifo_generator_v13_0_1/simulation/fifo_generator_vhdl_beh.vhd" \
"../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/fifo_32x1024/fifo_generator_v13_0_1/hdl/fifo_generator_v13_0_rfs.vhd" \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/fifo_32x1024/sim/fifo_32x1024.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/fixed_mult.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/fixed_adder.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/MemN2N_emb_w_up_control.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/ram_sync.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/exp_fixed.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/counter.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/MemN2N_emb.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/MemN2N_phase_controller.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/MemN2N_fwd_path_controller.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/fully_connected_w_soft_max.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/decoder.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/accumulator_fixed.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/attention_memory.v" \
"../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src/MemN2N.v" \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_MemN2N_0_0/sim/MemN2N_TOP_MemN2N_0_0.v" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../ipstatic/lib_cdc_v1_0/hdl/src/vhdl/cdc_sync.vhd" \

vcom -work proc_sys_reset_v5_0_8 -64 -93 \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/upcnt_n.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/sequence_psr.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/lpf.vhd" \
"../../../ipstatic/proc_sys_reset_v5_0/hdl/src/vhdl/proc_sys_reset.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_proc_sys_reset_0_0/sim/MemN2N_TOP_proc_sys_reset_0_0.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" "+incdir+../../../../MemN2N.srcs/sources_1/bd/MemN2N_TOP/ipshared/sspark/memn2n_v1_0/src" \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_clk_wiz_0_1/MemN2N_TOP_clk_wiz_0_1_clk_wiz.v" \
"../../../bd/MemN2N_TOP/ip/MemN2N_TOP_clk_wiz_0_1/MemN2N_TOP_clk_wiz_0_1.v" \
"../../../bd/MemN2N_TOP/hdl/MemN2N_TOP.v" \

vlog -work xil_defaultlib "glbl.v"

