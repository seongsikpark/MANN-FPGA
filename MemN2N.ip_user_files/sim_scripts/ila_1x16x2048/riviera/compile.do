vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib -v2k5 -sv "+incdir+../../../ip/ila_1x16x2048/ila_v6_1_1/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ila_v6_1_1/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbs_v1_0_2/hdl/verilog" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -v2k5 "+incdir+../../../ip/ila_1x16x2048/ila_v6_1_1/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbs_v1_0_2/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ila_v6_1_1/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/ltlib_v1_0_0/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbm_v1_1_3/hdl/verilog" "+incdir+../../../ip/ila_1x16x2048/xsdbs_v1_0_2/hdl/verilog" \
"../../../ip/ila_1x16x2048/sim/ila_1x16x2048.v" \

vlog -work xil_defaultlib "glbl.v"

