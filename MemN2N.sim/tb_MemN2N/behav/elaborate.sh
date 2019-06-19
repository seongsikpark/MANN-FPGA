#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto ef8ca3a0619d46688a0bc83ca3dc6d1e -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L xpm -L xbip_utils_v3_0_6 -L axi_utils_v2_0_2 -L xbip_pipe_v3_0_2 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_dsp48_addsub_v3_0_2 -L xbip_bram18k_v3_0_2 -L mult_gen_v12_0_11 -L floating_point_v7_0_12 -L xbip_dsp48_mult_v3_0_2 -L xbip_dsp48_multadd_v3_0_2 -L div_gen_v5_1_10 -L fifo_generator_v13_1_1 -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_memory_network_behav xil_defaultlib.tb_memory_network xil_defaultlib.glbl -log elaborate.log
