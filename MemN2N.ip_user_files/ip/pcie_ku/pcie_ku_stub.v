// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Wed Jun 19 16:42:38 2019
// Host        : canyon running 64-bit Ubuntu 16.04.4 LTS
// Command     : write_verilog -force -mode synth_stub
//               /mnt/external/sspark/Papers/2019_DATE_MANN_FPGA_git/MANN-FPGA/MemN2N.runs/pcie_ku_synth_1/pcie_ku_stub.v
// Design      : pcie_ku
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu095-ffva2104-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pcie_ku_pcie3_uscale_core_top,Vivado 2016.2" *)
module pcie_ku(pci_exp_txn, pci_exp_txp, pci_exp_rxn, pci_exp_rxp, user_clk, user_reset, user_lnk_up, s_axis_rq_tdata, s_axis_rq_tkeep, s_axis_rq_tlast, s_axis_rq_tready, s_axis_rq_tuser, s_axis_rq_tvalid, m_axis_rc_tdata, m_axis_rc_tkeep, m_axis_rc_tlast, m_axis_rc_tready, m_axis_rc_tuser, m_axis_rc_tvalid, m_axis_cq_tdata, m_axis_cq_tkeep, m_axis_cq_tlast, m_axis_cq_tready, m_axis_cq_tuser, m_axis_cq_tvalid, s_axis_cc_tdata, s_axis_cc_tkeep, s_axis_cc_tlast, s_axis_cc_tready, s_axis_cc_tuser, s_axis_cc_tvalid, pcie_rq_seq_num, pcie_rq_seq_num_vld, pcie_rq_tag, pcie_rq_tag_av, pcie_rq_tag_vld, pcie_tfc_nph_av, pcie_tfc_npd_av, pcie_cq_np_req, pcie_cq_np_req_count, cfg_phy_link_down, cfg_phy_link_status, cfg_negotiated_width, cfg_current_speed, cfg_max_payload, cfg_max_read_req, cfg_function_status, cfg_function_power_state, cfg_vf_status, cfg_vf_power_state, cfg_link_power_state, cfg_mgmt_addr, cfg_mgmt_write, cfg_mgmt_write_data, cfg_mgmt_byte_enable, cfg_mgmt_read, cfg_mgmt_read_data, cfg_mgmt_read_write_done, cfg_mgmt_type1_cfg_reg_access, cfg_err_cor_out, cfg_err_nonfatal_out, cfg_err_fatal_out, cfg_local_error, cfg_ltr_enable, cfg_ltssm_state, cfg_rcb_status, cfg_dpa_substate_change, cfg_obff_enable, cfg_pl_status_change, cfg_tph_requester_enable, cfg_tph_st_mode, cfg_vf_tph_requester_enable, cfg_vf_tph_st_mode, cfg_msg_received, cfg_msg_received_data, cfg_msg_received_type, cfg_msg_transmit, cfg_msg_transmit_type, cfg_msg_transmit_data, cfg_msg_transmit_done, cfg_fc_ph, cfg_fc_pd, cfg_fc_nph, cfg_fc_npd, cfg_fc_cplh, cfg_fc_cpld, cfg_fc_sel, cfg_per_func_status_control, cfg_per_func_status_data, cfg_per_function_number, cfg_per_function_output_request, cfg_per_function_update_done, cfg_dsn, cfg_power_state_change_ack, cfg_power_state_change_interrupt, cfg_err_cor_in, cfg_err_uncor_in, cfg_flr_in_process, cfg_flr_done, cfg_vf_flr_in_process, cfg_vf_flr_done, cfg_link_training_enable, cfg_ext_read_received, cfg_ext_write_received, cfg_ext_register_number, cfg_ext_function_number, cfg_ext_write_data, cfg_ext_write_byte_enable, cfg_ext_read_data, cfg_ext_read_data_valid, cfg_interrupt_int, cfg_interrupt_pending, cfg_interrupt_sent, cfg_interrupt_msi_enable, cfg_interrupt_msi_vf_enable, cfg_interrupt_msi_mmenable, cfg_interrupt_msi_mask_update, cfg_interrupt_msi_data, cfg_interrupt_msi_select, cfg_interrupt_msi_int, cfg_interrupt_msi_pending_status, cfg_interrupt_msi_pending_status_data_enable, cfg_interrupt_msi_pending_status_function_num, cfg_interrupt_msi_sent, cfg_interrupt_msi_fail, cfg_interrupt_msi_attr, cfg_interrupt_msi_tph_present, cfg_interrupt_msi_tph_type, cfg_interrupt_msi_tph_st_tag, cfg_interrupt_msi_function_number, cfg_hot_reset_out, cfg_config_space_enable, cfg_req_pm_transition_l23_ready, cfg_hot_reset_in, cfg_ds_port_number, cfg_ds_bus_number, cfg_ds_device_number, cfg_ds_function_number, cfg_subsys_vend_id, sys_clk, sys_clk_gt, sys_reset, pcie_perstn1_in, pcie_perstn0_out, pcie_perstn1_out)
/* synthesis syn_black_box black_box_pad_pin="pci_exp_txn[7:0],pci_exp_txp[7:0],pci_exp_rxn[7:0],pci_exp_rxp[7:0],user_clk,user_reset,user_lnk_up,s_axis_rq_tdata[63:0],s_axis_rq_tkeep[1:0],s_axis_rq_tlast,s_axis_rq_tready[3:0],s_axis_rq_tuser[59:0],s_axis_rq_tvalid,m_axis_rc_tdata[63:0],m_axis_rc_tkeep[1:0],m_axis_rc_tlast,m_axis_rc_tready,m_axis_rc_tuser[74:0],m_axis_rc_tvalid,m_axis_cq_tdata[63:0],m_axis_cq_tkeep[1:0],m_axis_cq_tlast,m_axis_cq_tready,m_axis_cq_tuser[84:0],m_axis_cq_tvalid,s_axis_cc_tdata[63:0],s_axis_cc_tkeep[1:0],s_axis_cc_tlast,s_axis_cc_tready[3:0],s_axis_cc_tuser[32:0],s_axis_cc_tvalid,pcie_rq_seq_num[3:0],pcie_rq_seq_num_vld,pcie_rq_tag[5:0],pcie_rq_tag_av[1:0],pcie_rq_tag_vld,pcie_tfc_nph_av[1:0],pcie_tfc_npd_av[1:0],pcie_cq_np_req,pcie_cq_np_req_count[5:0],cfg_phy_link_down,cfg_phy_link_status[1:0],cfg_negotiated_width[3:0],cfg_current_speed[2:0],cfg_max_payload[2:0],cfg_max_read_req[2:0],cfg_function_status[15:0],cfg_function_power_state[11:0],cfg_vf_status[15:0],cfg_vf_power_state[23:0],cfg_link_power_state[1:0],cfg_mgmt_addr[18:0],cfg_mgmt_write,cfg_mgmt_write_data[31:0],cfg_mgmt_byte_enable[3:0],cfg_mgmt_read,cfg_mgmt_read_data[31:0],cfg_mgmt_read_write_done,cfg_mgmt_type1_cfg_reg_access,cfg_err_cor_out,cfg_err_nonfatal_out,cfg_err_fatal_out,cfg_local_error,cfg_ltr_enable,cfg_ltssm_state[5:0],cfg_rcb_status[3:0],cfg_dpa_substate_change[3:0],cfg_obff_enable[1:0],cfg_pl_status_change,cfg_tph_requester_enable[3:0],cfg_tph_st_mode[11:0],cfg_vf_tph_requester_enable[7:0],cfg_vf_tph_st_mode[23:0],cfg_msg_received,cfg_msg_received_data[7:0],cfg_msg_received_type[4:0],cfg_msg_transmit,cfg_msg_transmit_type[2:0],cfg_msg_transmit_data[31:0],cfg_msg_transmit_done,cfg_fc_ph[7:0],cfg_fc_pd[11:0],cfg_fc_nph[7:0],cfg_fc_npd[11:0],cfg_fc_cplh[7:0],cfg_fc_cpld[11:0],cfg_fc_sel[2:0],cfg_per_func_status_control[2:0],cfg_per_func_status_data[15:0],cfg_per_function_number[3:0],cfg_per_function_output_request,cfg_per_function_update_done,cfg_dsn[63:0],cfg_power_state_change_ack,cfg_power_state_change_interrupt,cfg_err_cor_in,cfg_err_uncor_in,cfg_flr_in_process[3:0],cfg_flr_done[3:0],cfg_vf_flr_in_process[7:0],cfg_vf_flr_done[7:0],cfg_link_training_enable,cfg_ext_read_received,cfg_ext_write_received,cfg_ext_register_number[9:0],cfg_ext_function_number[7:0],cfg_ext_write_data[31:0],cfg_ext_write_byte_enable[3:0],cfg_ext_read_data[31:0],cfg_ext_read_data_valid,cfg_interrupt_int[3:0],cfg_interrupt_pending[3:0],cfg_interrupt_sent,cfg_interrupt_msi_enable[3:0],cfg_interrupt_msi_vf_enable[7:0],cfg_interrupt_msi_mmenable[11:0],cfg_interrupt_msi_mask_update,cfg_interrupt_msi_data[31:0],cfg_interrupt_msi_select[3:0],cfg_interrupt_msi_int[31:0],cfg_interrupt_msi_pending_status[31:0],cfg_interrupt_msi_pending_status_data_enable,cfg_interrupt_msi_pending_status_function_num[3:0],cfg_interrupt_msi_sent,cfg_interrupt_msi_fail,cfg_interrupt_msi_attr[2:0],cfg_interrupt_msi_tph_present,cfg_interrupt_msi_tph_type[1:0],cfg_interrupt_msi_tph_st_tag[8:0],cfg_interrupt_msi_function_number[3:0],cfg_hot_reset_out,cfg_config_space_enable,cfg_req_pm_transition_l23_ready,cfg_hot_reset_in,cfg_ds_port_number[7:0],cfg_ds_bus_number[7:0],cfg_ds_device_number[4:0],cfg_ds_function_number[2:0],cfg_subsys_vend_id[15:0],sys_clk,sys_clk_gt,sys_reset,pcie_perstn1_in,pcie_perstn0_out,pcie_perstn1_out" */;
  output [7:0]pci_exp_txn;
  output [7:0]pci_exp_txp;
  input [7:0]pci_exp_rxn;
  input [7:0]pci_exp_rxp;
  output user_clk;
  output user_reset;
  output user_lnk_up;
  input [63:0]s_axis_rq_tdata;
  input [1:0]s_axis_rq_tkeep;
  input s_axis_rq_tlast;
  output [3:0]s_axis_rq_tready;
  input [59:0]s_axis_rq_tuser;
  input s_axis_rq_tvalid;
  output [63:0]m_axis_rc_tdata;
  output [1:0]m_axis_rc_tkeep;
  output m_axis_rc_tlast;
  input m_axis_rc_tready;
  output [74:0]m_axis_rc_tuser;
  output m_axis_rc_tvalid;
  output [63:0]m_axis_cq_tdata;
  output [1:0]m_axis_cq_tkeep;
  output m_axis_cq_tlast;
  input m_axis_cq_tready;
  output [84:0]m_axis_cq_tuser;
  output m_axis_cq_tvalid;
  input [63:0]s_axis_cc_tdata;
  input [1:0]s_axis_cc_tkeep;
  input s_axis_cc_tlast;
  output [3:0]s_axis_cc_tready;
  input [32:0]s_axis_cc_tuser;
  input s_axis_cc_tvalid;
  output [3:0]pcie_rq_seq_num;
  output pcie_rq_seq_num_vld;
  output [5:0]pcie_rq_tag;
  output [1:0]pcie_rq_tag_av;
  output pcie_rq_tag_vld;
  output [1:0]pcie_tfc_nph_av;
  output [1:0]pcie_tfc_npd_av;
  input pcie_cq_np_req;
  output [5:0]pcie_cq_np_req_count;
  output cfg_phy_link_down;
  output [1:0]cfg_phy_link_status;
  output [3:0]cfg_negotiated_width;
  output [2:0]cfg_current_speed;
  output [2:0]cfg_max_payload;
  output [2:0]cfg_max_read_req;
  output [15:0]cfg_function_status;
  output [11:0]cfg_function_power_state;
  output [15:0]cfg_vf_status;
  output [23:0]cfg_vf_power_state;
  output [1:0]cfg_link_power_state;
  input [18:0]cfg_mgmt_addr;
  input cfg_mgmt_write;
  input [31:0]cfg_mgmt_write_data;
  input [3:0]cfg_mgmt_byte_enable;
  input cfg_mgmt_read;
  output [31:0]cfg_mgmt_read_data;
  output cfg_mgmt_read_write_done;
  input cfg_mgmt_type1_cfg_reg_access;
  output cfg_err_cor_out;
  output cfg_err_nonfatal_out;
  output cfg_err_fatal_out;
  output cfg_local_error;
  output cfg_ltr_enable;
  output [5:0]cfg_ltssm_state;
  output [3:0]cfg_rcb_status;
  output [3:0]cfg_dpa_substate_change;
  output [1:0]cfg_obff_enable;
  output cfg_pl_status_change;
  output [3:0]cfg_tph_requester_enable;
  output [11:0]cfg_tph_st_mode;
  output [7:0]cfg_vf_tph_requester_enable;
  output [23:0]cfg_vf_tph_st_mode;
  output cfg_msg_received;
  output [7:0]cfg_msg_received_data;
  output [4:0]cfg_msg_received_type;
  input cfg_msg_transmit;
  input [2:0]cfg_msg_transmit_type;
  input [31:0]cfg_msg_transmit_data;
  output cfg_msg_transmit_done;
  output [7:0]cfg_fc_ph;
  output [11:0]cfg_fc_pd;
  output [7:0]cfg_fc_nph;
  output [11:0]cfg_fc_npd;
  output [7:0]cfg_fc_cplh;
  output [11:0]cfg_fc_cpld;
  input [2:0]cfg_fc_sel;
  input [2:0]cfg_per_func_status_control;
  output [15:0]cfg_per_func_status_data;
  input [3:0]cfg_per_function_number;
  input cfg_per_function_output_request;
  output cfg_per_function_update_done;
  input [63:0]cfg_dsn;
  input cfg_power_state_change_ack;
  output cfg_power_state_change_interrupt;
  input cfg_err_cor_in;
  input cfg_err_uncor_in;
  output [3:0]cfg_flr_in_process;
  input [3:0]cfg_flr_done;
  output [7:0]cfg_vf_flr_in_process;
  input [7:0]cfg_vf_flr_done;
  input cfg_link_training_enable;
  output cfg_ext_read_received;
  output cfg_ext_write_received;
  output [9:0]cfg_ext_register_number;
  output [7:0]cfg_ext_function_number;
  output [31:0]cfg_ext_write_data;
  output [3:0]cfg_ext_write_byte_enable;
  input [31:0]cfg_ext_read_data;
  input cfg_ext_read_data_valid;
  input [3:0]cfg_interrupt_int;
  input [3:0]cfg_interrupt_pending;
  output cfg_interrupt_sent;
  output [3:0]cfg_interrupt_msi_enable;
  output [7:0]cfg_interrupt_msi_vf_enable;
  output [11:0]cfg_interrupt_msi_mmenable;
  output cfg_interrupt_msi_mask_update;
  output [31:0]cfg_interrupt_msi_data;
  input [3:0]cfg_interrupt_msi_select;
  input [31:0]cfg_interrupt_msi_int;
  input [31:0]cfg_interrupt_msi_pending_status;
  input cfg_interrupt_msi_pending_status_data_enable;
  input [3:0]cfg_interrupt_msi_pending_status_function_num;
  output cfg_interrupt_msi_sent;
  output cfg_interrupt_msi_fail;
  input [2:0]cfg_interrupt_msi_attr;
  input cfg_interrupt_msi_tph_present;
  input [1:0]cfg_interrupt_msi_tph_type;
  input [8:0]cfg_interrupt_msi_tph_st_tag;
  input [3:0]cfg_interrupt_msi_function_number;
  output cfg_hot_reset_out;
  input cfg_config_space_enable;
  input cfg_req_pm_transition_l23_ready;
  input cfg_hot_reset_in;
  input [7:0]cfg_ds_port_number;
  input [7:0]cfg_ds_bus_number;
  input [4:0]cfg_ds_device_number;
  input [2:0]cfg_ds_function_number;
  input [15:0]cfg_subsys_vend_id;
  input sys_clk;
  input sys_clk_gt;
  input sys_reset;
  input pcie_perstn1_in;
  output pcie_perstn0_out;
  output pcie_perstn1_out;
endmodule
