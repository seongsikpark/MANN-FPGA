`timescale 1ns / 10ps

module xillybus(PCIE_TX_P, PCIE_TX_N, PCIE_RX_P, PCIE_RX_N, PCIE_REFCLK_P,
  PCIE_REFCLK_N, PCIE_PERST_B_LS, bus_clk, quiesce, GPIO_LED,
  user_r_read_16_rden, user_r_read_16_data, user_r_read_16_empty,
  user_r_read_16_eof, user_r_read_16_open, user_w_write_16_wren,
  user_w_write_16_data, user_w_write_16_full, user_w_write_16_open);

  input [7:0] PCIE_RX_P;
  input [7:0] PCIE_RX_N;
  input  PCIE_REFCLK_P;
  input  PCIE_REFCLK_N;
  input  PCIE_PERST_B_LS;
  input [15:0] user_r_read_16_data;
  input  user_r_read_16_empty;
  input  user_r_read_16_eof;
  input  user_w_write_16_full;
  output [7:0] PCIE_TX_P;
  output [7:0] PCIE_TX_N;
  output  bus_clk;
  output  quiesce;
  output [3:0] GPIO_LED;
  output  user_r_read_16_rden;
  output  user_r_read_16_open;
  output  user_w_write_16_wren;
  output [15:0] user_w_write_16_data;
  output  user_w_write_16_open;
  wire  trn_reset_n;
  wire  trn_lnk_up_n;
  wire [3:0] s_axis_rq_tready;
  wire [63:0] s_axis_rq_tdata;
  wire [1:0] s_axis_rq_tkeep;
  wire  s_axis_rq_tlast;
  wire  s_axis_rq_tvalid;
  wire [59:0] s_axis_rq_tuser;
  wire [63:0] m_axis_rc_tdata;
  wire [1:0] m_axis_rc_tkeep;
  wire  m_axis_rc_tlast;
  wire  m_axis_rc_tvalid;
  wire [21:0] m_axis_rc_tready;
  wire [63:0] m_axis_cq_tdata;
  wire [1:0] m_axis_cq_tkeep;
  wire  m_axis_cq_tlast;
  wire  m_axis_cq_tvalid;
  wire [21:0] m_axis_cq_tready;
  wire [31:0] cfg_interrupt_msi_int;
  wire [63:0] cfg_interrupt_msi_pending_status;
  wire  cfg_interrupt_msi_sent;
  wire  cfg_interrupt_msi_fail;
  wire [7:0] trn_fc_cplh;
  wire [11:0] trn_fc_cpld;
  wire  trn_terr_drop_n;
  wire [3:0] pcie_rq_seq_num;
  wire  pcie_rq_seq_num_vld;
  wire [2:0] cfg_max_payload;
  wire [2:0] cfg_max_read_req;
  wire [1:0] cfg_rcb_status;
  wire  cfg_err_fatal_out;
  wire  pcie_ref_clk;
  wire  pcie_ref_clk_gt;
  wire  user_reset_out;
  wire  user_lnk_up;

   IBUFDS_GTE3 pcieclk_ibuf (.O(pcie_ref_clk_gt), .ODIV2(pcie_ref_clk),
			     .I(PCIE_REFCLK_P), .IB(PCIE_REFCLK_N),
			     .CEB(1'b0));
   
   assign 	     trn_reset_n = !user_reset_out;
   assign 	     trn_lnk_up_n = !user_lnk_up;
   assign 	     trn_terr_drop_n = 1;

   pcie_ku pcie
     (
      .pci_exp_txp( PCIE_TX_P ),
      .pci_exp_txn( PCIE_TX_N ),
      .pci_exp_rxp( PCIE_RX_P ),
      .pci_exp_rxn( PCIE_RX_N ),

      .user_clk(bus_clk),
      .user_reset(user_reset_out),
      .user_lnk_up(user_lnk_up),
      
      .s_axis_rq_tlast(s_axis_rq_tlast),
      .s_axis_rq_tdata(s_axis_rq_tdata),
      .s_axis_rq_tuser(s_axis_rq_tuser),
      .s_axis_rq_tkeep(s_axis_rq_tkeep),
      .s_axis_rq_tready(s_axis_rq_tready),
      .s_axis_rq_tvalid(s_axis_rq_tvalid),

      .m_axis_rc_tdata(m_axis_rc_tdata),
      .m_axis_rc_tuser(),
      .m_axis_rc_tlast(m_axis_rc_tlast),
      .m_axis_rc_tkeep(m_axis_rc_tkeep),
      .m_axis_rc_tvalid(m_axis_rc_tvalid),
      .m_axis_rc_tready(m_axis_rc_tready),

      .m_axis_cq_tdata(m_axis_cq_tdata),
      .m_axis_cq_tuser(),
      .m_axis_cq_tlast(m_axis_cq_tlast),
      .m_axis_cq_tkeep(m_axis_cq_tkeep),
      .m_axis_cq_tvalid(m_axis_cq_tvalid),
      .m_axis_cq_tready(m_axis_cq_tready),

      .s_axis_cc_tdata(64'd0),
      .s_axis_cc_tuser(33'd0),
      .s_axis_cc_tlast(1'b0),
      .s_axis_cc_tkeep(2'd0),
      .s_axis_cc_tvalid(1'b0),
      .s_axis_cc_tready(),
 
      .pcie_rq_seq_num(pcie_rq_seq_num),
      .pcie_rq_seq_num_vld(pcie_rq_seq_num_vld),
      .pcie_cq_np_req(1'b1),

      .cfg_max_payload(cfg_max_payload),
      .cfg_max_read_req(cfg_max_read_req),
      .cfg_rcb_status(cfg_rcb_status),

      .cfg_err_fatal_out(cfg_err_fatal_out),
 
      .cfg_fc_cpld(trn_fc_cpld), // Completion Data credits
      .cfg_fc_cplh(trn_fc_cplh), // Completion Header credits
      .cfg_fc_sel(3'd0), // Receive credit available space

      .cfg_per_function_number(4'd0),
      .cfg_per_function_output_request(1'b0),

      .cfg_dsn(64'd0),

      .cfg_power_state_change_ack(1'b1),
      .cfg_err_cor_in(1'b0),
      .cfg_err_uncor_in(1'b0),
      .cfg_flr_done(4'd0), // Never recover from Function Level Reset
      .cfg_vf_flr_done(8'd0), // Ditto
      
      .cfg_link_training_enable(1'b1),
      
      .cfg_ds_port_number(8'd0),
            
      .cfg_interrupt_msi_int(cfg_interrupt_msi_int),
      .cfg_interrupt_msi_pending_status(cfg_interrupt_msi_pending_status),
      .cfg_interrupt_msi_sent(cfg_interrupt_msi_sent),
      .cfg_interrupt_msi_fail(cfg_interrupt_msi_fail),

      .cfg_interrupt_msi_attr(3'd0),
      .cfg_interrupt_msi_tph_present(1'b0),
      .cfg_interrupt_msi_tph_type(2'd0),
      .cfg_interrupt_msi_tph_st_tag(9'd0),
      .cfg_interrupt_msi_pending_status_function_num( 4'b0),
      .cfg_interrupt_msi_pending_status_data_enable( 1'b0),

      .cfg_interrupt_msi_function_number(4'd0), // PF0

      .cfg_interrupt_int(4'd0),
      .cfg_interrupt_pending(4'd0),
      .cfg_interrupt_msi_select(4'd0),

      .cfg_config_space_enable(1'b1),
      .cfg_req_pm_transition_l23_ready(1'b0),
      .cfg_hot_reset_in(1'b0),
      .cfg_ds_bus_number(8'd0), // Ignored
      .cfg_ds_device_number(5'd0), // Ignored
      .cfg_ds_function_number(3'd0), // Ignored

      .cfg_subsys_vend_id(16'h10ee),

      .pcie_perstn1_in(1'b0), // Yes, it should be zero

      .sys_clk(pcie_ref_clk),
      .sys_clk_gt(pcie_ref_clk_gt),
      .sys_reset(PCIE_PERST_B_LS)
      );

  xillybus_core  xillybus_core_ins(.trn_reset_n_w(trn_reset_n),
    .trn_lnk_up_n_w(trn_lnk_up_n), .quiesce_w(quiesce), .GPIO_LED_w(GPIO_LED),
    .s_axis_rq_tready_w(s_axis_rq_tready), .s_axis_rq_tdata_w(s_axis_rq_tdata),
    .s_axis_rq_tkeep_w(s_axis_rq_tkeep), .s_axis_rq_tlast_w(s_axis_rq_tlast),
    .s_axis_rq_tvalid_w(s_axis_rq_tvalid), .s_axis_rq_tuser_w(s_axis_rq_tuser),
    .m_axis_rc_tdata_w(m_axis_rc_tdata), .m_axis_rc_tkeep_w(m_axis_rc_tkeep),
    .m_axis_rc_tlast_w(m_axis_rc_tlast), .m_axis_rc_tvalid_w(m_axis_rc_tvalid),
    .m_axis_rc_tready_w(m_axis_rc_tready), .m_axis_cq_tdata_w(m_axis_cq_tdata),
    .m_axis_cq_tkeep_w(m_axis_cq_tkeep), .m_axis_cq_tlast_w(m_axis_cq_tlast),
    .m_axis_cq_tvalid_w(m_axis_cq_tvalid), .m_axis_cq_tready_w(m_axis_cq_tready),
    .cfg_interrupt_msi_int_w(cfg_interrupt_msi_int),
    .cfg_interrupt_msi_pending_status_w(cfg_interrupt_msi_pending_status),
    .cfg_interrupt_msi_sent_w(cfg_interrupt_msi_sent),
    .cfg_interrupt_msi_fail_w(cfg_interrupt_msi_fail),
    .trn_fc_cplh_w(trn_fc_cplh), .trn_fc_cpld_w(trn_fc_cpld),
    .trn_terr_drop_n_w(trn_terr_drop_n), .pcie_rq_seq_num_w(pcie_rq_seq_num),
    .pcie_rq_seq_num_vld_w(pcie_rq_seq_num_vld), .cfg_max_payload_w(cfg_max_payload),
    .cfg_max_read_req_w(cfg_max_read_req), .cfg_rcb_status_w(cfg_rcb_status),
    .cfg_err_fatal_out_w(cfg_err_fatal_out), .user_r_read_16_rden_w(user_r_read_16_rden),
    .user_r_read_16_data_w(user_r_read_16_data), .user_r_read_16_empty_w(user_r_read_16_empty),
    .user_r_read_16_eof_w(user_r_read_16_eof), .user_r_read_16_open_w(user_r_read_16_open),
    .user_w_write_16_wren_w(user_w_write_16_wren),
    .user_w_write_16_data_w(user_w_write_16_data),
    .user_w_write_16_full_w(user_w_write_16_full),
    .user_w_write_16_open_w(user_w_write_16_open), .bus_clk_w(bus_clk));

endmodule
