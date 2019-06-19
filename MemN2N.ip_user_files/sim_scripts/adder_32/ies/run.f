-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_base.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dpdistram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_dprom.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sdpram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_spram.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_sprom.sv" \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_memory/hdl/xpm_memory_tdpram.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/xbip_utils_v3_0_6 \
  "../../../ipstatic/xbip_utils_v3_0_6/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/c_reg_fd_v12_0_2 \
  "../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
  "../../../ipstatic/c_reg_fd_v12_0_2/hdl/c_reg_fd_v12_0.vhd" \
-endlib
-makelib ies/xbip_dsp48_wrapper_v3_0_4 \
  "../../../ipstatic/xbip_dsp48_wrapper_v3_0_4/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xbip_pipe_v3_0_2 \
  "../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
  "../../../ipstatic/xbip_pipe_v3_0_2/hdl/xbip_pipe_v3_0.vhd" \
-endlib
-makelib ies/xbip_dsp48_addsub_v3_0_2 \
  "../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
  "../../../ipstatic/xbip_dsp48_addsub_v3_0_2/hdl/xbip_dsp48_addsub_v3_0.vhd" \
-endlib
-makelib ies/xbip_addsub_v3_0_2 \
  "../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
  "../../../ipstatic/xbip_addsub_v3_0_2/hdl/xbip_addsub_v3_0.vhd" \
-endlib
-makelib ies/c_addsub_v12_0_9 \
  "../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0_vh_rfs.vhd" \
  "../../../ipstatic/c_addsub_v12_0_9/hdl/c_addsub_v12_0.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "../../../ip/adder_32/sim/adder_32.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

