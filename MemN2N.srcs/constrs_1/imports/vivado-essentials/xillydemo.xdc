create_clock -period 10.000 -name clk_pcie [get_ports PCIE_REFCLK_P]
#create_clock -period 4.000 -name clk_pcie [get_ports PCIE_REFCLK_P]
#create_clock -period 8.000 -name clk_pcie [get_ports PCIE_REFCLK_P]


set_false_path -from [get_ports PCIE_PERST_B_LS]

set_property LOC GTHE3_COMMON_X0Y1 [get_cells -hier -filter name=~*/pcieclk_ibuf]

set_property IOSTANDARD LVCMOS18 [get_ports PCIE_PERST_B_LS]
set_property PULLUP true [get_ports PCIE_PERST_B_LS]

set_property PACKAGE_PIN BF32 [get_ports {GPIO_LED[4]}]
set_property PACKAGE_PIN AV36 [get_ports {GPIO_LED[5]}]
set_property PACKAGE_PIN AY35 [get_ports {GPIO_LED[6]}]
set_property PACKAGE_PIN BA37 [get_ports {GPIO_LED[7]}]

set_false_path -to [get_ports -filter NAME=~GPIO_LED*]
set_property -dict {IOSTANDARD LVCMOS12 DRIVE 8} [get_ports -filter NAME=~GPIO_LED*]




set_property IOSTANDARD LVCMOS18 [get_ports en_init_sys]
#set_property PACKAGE_PIN E36 [get_ports rst_sys]
set_property IOSTANDARD LVCMOS18 [get_ports rst_sys]


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN DIV-1 [current_design]
set_property BITSTREAM.CONFIG.BPI_SYNC_MODE TYPE1 [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]
set_property CONFIG_MODE BPI16 [current_design]



#create_clock -period 9.999 -name VIRTUAL_clk_out1_clk_wiz_0 -waveform {0.000 4.999}
#set_input_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay 1.000 [get_ports en_init_sys]
#set_input_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 2.000 [get_ports en_init_sys]
#set_input_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -min -add_delay 1.000 [get_ports rst_sys]
#set_input_delay -clock [get_clocks VIRTUAL_clk_out1_clk_wiz_0] -max -add_delay 2.000 [get_ports rst_sys]
#set_property IOSTANDARD LVDS [get_ports clk_sys_in1_p]

set_false_path -reset_path -from [get_ports rst_sys]
set_false_path -from [get_ports en_init_sys]







#set_false_path -reset_path -from [get_pins xillybus_ins/xillybus_core_ins/unitr_7_ins/user_w_write_16_open/C] -to [get_pins rd_rst_fifo_in_meta_reg/D]
#set_false_path -reset_path -from [get_pins xillybus_ins/xillybus_core_ins/unitw_6_ins/user_r_read_16_open/C] -to [get_pins wr_rst_fifo_out_meta_reg/D]

set_property PACKAGE_PIN BB2 [get_ports {PCIE_RX_P[7]}]
set_property PACKAGE_PIN AY2 [get_ports {PCIE_RX_P[6]}]
set_property PACKAGE_PIN AV2 [get_ports {PCIE_RX_P[5]}]
set_property PACKAGE_PIN AT2 [get_ports {PCIE_RX_P[4]}]
set_property PACKAGE_PIN AP2 [get_ports {PCIE_RX_P[3]}]
set_property PACKAGE_PIN AM2 [get_ports {PCIE_RX_P[2]}]
set_property PACKAGE_PIN AK2 [get_ports {PCIE_RX_P[1]}]




set_property IOSTANDARD LVCMOS18 [get_ports rst_button]



set_property PACKAGE_PIN E36 [get_ports rst_sys]
set_property PACKAGE_PIN D9 [get_ports rst_button]
set_property PACKAGE_PIN AL9 [get_ports PCIE_REFCLK_P]
set_property PACKAGE_PIN AW27 [get_ports en_init_sys]
set_property PACKAGE_PIN G31 [get_ports clk_sys_in1_p]
set_property PACKAGE_PIN F31 [get_ports clk_sys_in1_n]
set_property PACKAGE_PIN BB32 [get_ports {GPIO_LED[3]}]
set_property PACKAGE_PIN AV34 [get_ports {GPIO_LED[1]}]
set_property PACKAGE_PIN AY30 [get_ports {GPIO_LED[2]}]
set_property LOC PCIE_3_1_X0Y0 [get_cells xillybus_ins/pcie/inst/pcie3_uscale_top_inst/pcie3_uscale_wrapper_inst/PCIE_3_1_inst]
set_property PACKAGE_PIN AM17 [get_ports PCIE_PERST_B_LS]
set_property PACKAGE_PIN AT32 [get_ports {GPIO_LED[0]}]
set_property PACKAGE_PIN AJ4 [get_ports {PCIE_RX_P[0]}]
set_property PACKAGE_PIN AJ3 [get_ports {PCIE_RX_N[0]}]
set_property PACKAGE_PIN AP7 [get_ports {PCIE_TX_P[0]}]
set_property PACKAGE_PIN AP6 [get_ports {PCIE_TX_N[0]}]

set_false_path -reset_path -from [get_pins xillybus_ins/xillybus_core_ins/unitr_4_ins/user_w_write_16_open/C] -to [get_pins rst_fifo_out_meta_reg/D]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
