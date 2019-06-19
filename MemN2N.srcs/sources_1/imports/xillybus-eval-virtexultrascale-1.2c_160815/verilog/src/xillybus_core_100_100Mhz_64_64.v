module xillybus_core
  (
  input  bus_clk_w,
  input  cfg_err_fatal_out_w,
  input  cfg_interrupt_msi_fail_w,
  input  cfg_interrupt_msi_sent_w,
  input [2:0] cfg_max_payload_w,
  input [2:0] cfg_max_read_req_w,
  input [1:0] cfg_rcb_status_w,
  input [63:0] m_axis_cq_tdata_w,
  input [1:0] m_axis_cq_tkeep_w,
  input  m_axis_cq_tlast_w,
  input  m_axis_cq_tvalid_w,
  input [63:0] m_axis_rc_tdata_w,
  input [1:0] m_axis_rc_tkeep_w,
  input  m_axis_rc_tlast_w,
  input  m_axis_rc_tvalid_w,
  input  pcie_rq_seq_num_vld_w,
  input [3:0] pcie_rq_seq_num_w,
  input [3:0] s_axis_rq_tready_w,
  input [11:0] trn_fc_cpld_w,
  input [7:0] trn_fc_cplh_w,
  input  trn_lnk_up_n_w,
  input  trn_reset_n_w,
  input  trn_terr_drop_n_w,
  input [15:0] user_r_read_16_data_w,
  input  user_r_read_16_empty_w,
  input  user_r_read_16_eof_w,
  input [7:0] user_r_read_8_data_w,
  input  user_r_read_8_empty_w,
  input  user_r_read_8_eof_w,
  input  user_w_write_16_full_w,
  input  user_w_write_8_full_w,
  output [3:0] GPIO_LED_w,
  output [31:0] cfg_interrupt_msi_int_w,
  output [63:0] cfg_interrupt_msi_pending_status_w,
  output [21:0] m_axis_cq_tready_w,
  output [21:0] m_axis_rc_tready_w,
  output  quiesce_w,
  output [63:0] s_axis_rq_tdata_w,
  output [1:0] s_axis_rq_tkeep_w,
  output  s_axis_rq_tlast_w,
  output [59:0] s_axis_rq_tuser_w,
  output  s_axis_rq_tvalid_w,
  output  user_r_read_16_open_w,
  output  user_r_read_16_rden_w,
  output  user_r_read_8_open_w,
  output  user_r_read_8_rden_w,
  output [15:0] user_w_write_16_data_w,
  output  user_w_write_16_open_w,
  output  user_w_write_16_wren_w,
  output [7:0] user_w_write_8_data_w,
  output  user_w_write_8_open_w,
  output  user_w_write_8_wren_w
);
endmodule
