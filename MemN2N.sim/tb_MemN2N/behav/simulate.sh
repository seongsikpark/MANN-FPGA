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
ExecStep $xv_path/bin/xsim tb_memory_network_behav -key {Behavioral:tb_MemN2N:Functional:tb_memory_network} -tclbatch tb_memory_network.tcl -view /mnt/external/sspark/Papers/2019_DATE_MANN_FPGA_git/MANN-FPGA/MemN2N.srcs/tb_MemN2N/imports/MemN2N/tb_MemN2N_behav_reduced_new.wcfg -log simulate.log
