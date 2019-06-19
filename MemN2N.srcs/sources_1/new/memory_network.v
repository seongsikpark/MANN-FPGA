//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/29 16:08:24
// Design Name: 
// Module Name: memory_network
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps
`include "common.h"

module memory_network
(
    // clock
    clk,
    // reset_n
    rst_n,
    // input
    en,
    en_init,
    data_in,
    lr_l2,
    din_exp_shift_bit,
    we_w_init,
    data_w_init,
    addr_w_init,
    // output
    rb_n,
    done_init,
    done,
    data_out
);
////////////////////////////////////////////////////////////
//  parameters
////////////////////////////////////////////////////////////
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;

parameter BW_DATA_IN = `BW_DATA_IN;

parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
//parameter DIM_IN = `BW_WORD_VEC;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter NUM_MEM = `NUM_MEM;

//parameter BW_COUNTER_IN = BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_MEM_ADDR) - 1;

parameter BW_WORD_VEC = `BW_WORD_VEC;
parameter BW_TYPE_CODE = `BW_TYPE_CODE;

parameter MAX_WORD_IN_SEN = `MAX_WORD_IN_SEN;
parameter BW_MAX_WORD_IN_SEN = `BW_MAX_WORD_IN_SEN;

parameter BW_HOP = `BW_HOP;
parameter NUM_HOP = `NUM_HOP;

parameter BW_ADDR_W_INIT = `BW_ADDR_W_INIT;

////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;
// reset_n
input wire rst_n;
// input
input wire en;
input wire en_init;

input wire [BW_DATA_IN-1:0] data_in;

input wire [7:0] lr_l2;
input wire [7:0] din_exp_shift_bit;
input wire we_w_init;
input wire [BW_DATA*DIM_EMB-1:0] data_w_init;
input wire [BW_DATA_IN-1:0] addr_w_init;
 

// output
output wire [BW_DATA_IN-1:0] data_out;
//output reg [BW_DATA_IN-1:0] data_out;
output reg rb_n;
output reg done_init;
output wire done;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
reg en_init_sync;

reg [BW_DATA*DIM_EMB-1:0] reg_emb_q;

wire [BW_DATA-1:0] reg_q [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] reg_q_flat;
reg [BW_DATA-1:0] reg_q_buf [0:NUM_HOP-1][0:DIM_EMB-1];
//wire [BW_DATA-1:0] grad_reg_q [0:DIM_EMB-1];
reg [BW_DATA-1:0] grad_reg_q [0:DIM_EMB-1];

// answer
reg [BW_WORD_VEC-1:0] reg_answer_vec;
reg [BW_WORD_VEC-1:0] reg_answer_ind;   // for test fwd path result
//reg [DIM_IN-1:0] _reg_answer_one_hot;
//reg [DIM_IN-1:0] reg_answer_one_hot;
reg [DIM_IN-1:0] _answer_one_hot;
reg [DIM_IN-1:0] answer_one_hot;
//reg [BW_DATA*BW_WORD_VEC-1:0] reg_answer_fixed;
wire en_answer;
reg en_answer_sync;


genvar i;
genvar j;

//
wire [BW_WORD_VEC-1:0] word_vec;
wire [BW_TYPE_CODE-1:0] type_code;

wire t_train;
wire t_sentence;
wire t_sentence_done;
wire t_question;
wire t_question_done;
wire t_answer;
//wire t_answer_done;


// done init w
reg reg_done_init_w_emb_a;
reg reg_done_init_w_emb_c;
reg reg_done_init_w_emb_q;


// emb a
wire en_init_w_emb_a;
wire en_fwd_path_emb_a;
wire en_bwd_path_emb_a;
wire [BW_WORD_VEC-1:0] data_in_emb_a;
//grad_in_emb_a;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_a_flat;
wire [BW_DATA-1:0] data_out_emb_a [0:DIM_EMB-1];
wire done_init_w_emb_a;
wire done_fwd_path_emb_a;


// emb c
wire en_init_w_emb_c;
wire en_fwd_path_emb_c;
wire en_bwd_path_emb_c;
wire [BW_WORD_VEC-1:0] data_in_emb_c;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_c_flat;
wire [BW_DATA-1:0] data_out_emb_c [0:DIM_EMB-1];
wire done_init_w_emb_c;
wire done_fwd_path_emb_c;


// emb q
wire en_init_w_emb_q;
wire en_fwd_path_emb_q;
wire en_bwd_path_emb_q;
wire [BW_WORD_VEC-1:0] data_in_emb_q;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_q_flat;
wire [BW_DATA-1:0] data_out_emb_q [0:DIM_EMB-1];
wire done_init_w_emb_q;
wire done_fwd_path_emb_q;

reg rst_n_soft_emb_a;
reg rst_n_soft_emb_c;
reg rst_n_soft_emb_q;

// attention memory
wire en_mem_w_attention_mem;
wire en_fwd_path_attention_mem;
wire en_bwd_path_attention_mem;
wire [BW_DATA*DIM_EMB-1:0] din_mem_attention_mem;
wire [BW_DATA*DIM_EMB-1:0] din_question_attention_mem;

wire done_mem_w_attention_mem;
wire done_fwd_path_attention_mem;
wire done_bwd_path_attention_mem;
wire we_mem_attention_mem;
wire [BW_MEM_ADDR-1:0] aout_mem_attention_mem;

wire [BW_DATA-1:0] dout_attention_attention_mem [0:NUM_MEM-1];
wire [BW_DATA*NUM_MEM-1:0] dout_attention_attention_mem_flat;

reg [BW_DATA*DIM_EMB-1:0] reg_weighted_sum;

wire [BW_DATA-1:0] dout_weighted_sum_weighted_mem [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] dout_weighted_sum_weighted_mem_flat;

wire done_mem_w_weighted_mem;

wire en_mem_w_weighted_mem;

// addr mem 
/*
reg en_addr_mem;
wire [BW_MEM_ADDR-1:0] count_addr_mem;
wire done_addr_mem;
wire rst_n_addr_mem;
*/


// sum_u_q
wire [BW_DATA*DIM_EMB-1:0] reg_sum_u_q_flat;
//reg [BW_DATA-1:0] reg_sum_u_q [0:DIM_EMB-1];
wire [BW_DATA-1:0] reg_sum_u_q [0:DIM_EMB-1];
reg [BW_DATA-1:0] reg_sum_u_q_buf [0:NUM_HOP-1][0:DIM_EMB-1];
//wire [BW_DATA*DIM_EMB-1:0] _reg_sum_u_q;
wire [BW_DATA-1:0] _reg_sum_u_q [0:DIM_EMB-1];
//reg [BW_DATA-1:0] _reg_sum_u_q [0:DIM_EMB-1];

wire en_latch_grad_sum_u_q;
wire [BW_DATA-1:0] _grad_sum_u_q [0:DIM_EMB-1];
reg [BW_DATA-1:0] grad_sum_u_q [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_sum_u_q_flat;



// fully connected with soft max
wire rst_n_soft_fc_w_sm;
wire rst_n_batch_fc_w_sm;
wire en_init_w_fc_w_sm;
wire en_bwd_path_fc_w_sm;
wire en_bwd_path_w_up_fc_w_sm;

wire [BW_DATA*DIM_EMB-1:0] data_in_fc_w_sm;
wire [BW_DATA*DIM_IN-1:0] grad_in_fc_w_sm;

wire [7:0] lr_l2_fc_w_sm;
wire [7:0] din_exp_shift_bit_fc_w_sm;

wire [BW_DATA-1:0] data_out_fc_w_sm [0:DIM_IN-1];
wire [BW_DATA*DIM_IN-1:0] data_out_fc_w_sm_flat;
wire [BW_DATA-1:0] grad_out_fc_w_sm [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_out_fc_w_sm_flat;
wire done_init_w_fc_w_sm;
reg reg_done_init_w_fc_w_sm;

wire done_fwd_path_fc_w_sm;
wire done_bwd_path_fc_w_sm;

reg done_bwd_path_w_up_fc_w_sm;
wire _done_bwd_path_w_up_fc_w_sm;
wire [`BW_DEBUG_FC_W_SM-1:0] debug_out_fc_w_sm;

// fully connected
wire rst_n_soft_fc;
wire rst_n_batch_fc;
wire en_init_w_fc;
wire en_fwd_path_fc;
wire en_bwd_path_fc;
wire en_bwd_path_w_up_fc;

wire [BW_DATA*DIM_EMB-1:0] data_in_fc;
wire [BW_DATA*DIM_EMB-1:0] grad_in_fc;

wire [7:0] lr_l2_fc;

wire [BW_DATA-1:0] data_out_fc [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] data_out_fc_flat;
wire [BW_DATA-1:0] grad_out_fc [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_out_fc_flat;
wire done_init_w_fc;
reg reg_done_init_w_fc;

wire done_fwd_path_fc;
wire done_bwd_path_fc;

reg done_bwd_path_w_up_fc;
wire _done_bwd_path_w_up_fc;
wire [`BW_DEBUG_FC-1:0] debug_out_fc;



// phase controller
reg done_emb_q;
reg done_a;

reg en_fwd_path;

reg done_fwd_path_sum_u_q;


// cross entropy
wire done_cross_entropy;
wire [BW_DATA-1:0] cost_out_cross_entropy;
wire [BW_DATA-1:0] grad_out_cross_entropy [0:DIM_IN-1];
wire [BW_DATA*DIM_IN-1:0] grad_out_cross_entropy_flat;

// forward path control
wire en_fwd_path_attention;
wire en_fwd_path_weighted_mem;
wire en_fwd_path_sum_u_q;
wire en_fwd_path_fc_w_sm;
wire en_fwd_path_soft_max;
wire en_fwd_path_end;

wire _done_fwd_path_end;
reg done_fwd_path_end;

reg en_comp_result;
wire en_latch_result;


wire _done_fwd_question;
reg done_fwd_question_pre;
reg done_fwd_question;

// backward path control
reg en_bwd_path;

wire en_bwd_path_cost;
wire en_bwd_path_weighted_mem;
wire en_bwd_path_attention;
wire en_bwd_path_emb;
wire en_bwd_path_w_up;
wire en_bwd_path_end;


wire done_bwd_path_cost;
wire done_bwd_path_attention;
//wire done_bwd_path_emb;
reg done_bwd_path_emb;
wire done_bwd_path_w_up;

// hop
wire rst_n_count_hop;
wire en_count_hop;
wire [BW_HOP-1:0] hop;
wire [BW_HOP-1:0] hop_fwd;
wire [BW_HOP-1:0] hop_bwd;
wire [BW_HOP-1:0] count_count_hop;
wire done_count_hop;
wire en_fwd_path_count_hop;
wire en_bwd_path_count_hop;
wire done_fwd_path_count_hop;
wire done_bwd_path_count_hop;
wire rst_n_hop;

// 
wire [DIM_EMB-1:0] overflow_sum_u_q;
wire [DIM_EMB-1:0] overflow_grad_reg_q;

wire [DIM_EMB-1:0] underflow_sum_u_q;
wire [DIM_EMB-1:0] underflow_grad_reg_q;


//
//assign done_bwd_path_emb = done_bwd_path_emb_a && done_bwd_path_emb_c && done_bwd_path_emb_q;
always@(*)
begin
    if(done_count_hop==1)
        done_bwd_path_emb = done_bwd_path_emb_a && done_bwd_path_emb_c && done_bwd_path_emb_q;
    else
        //done_bwd_path_emb = done_bwd_path_emb_a && done_bwd_path_emb_c && done_bwd_path_emb_q;
        done_bwd_path_emb = done_bwd_path_emb_a && done_bwd_path_emb_c;
end

assign done_bwd_path_w_up = done_bwd_path_w_up_emb_a && done_bwd_path_w_up_emb_c &&done_bwd_path_w_up_emb_q &&done_bwd_path_w_up_fc_w_sm && done_bwd_path_w_up_fc;

// rst fwd_path
wire rst_n_soft;

wire rst_n_weighted_sum;
wire rst_n_soft_attention_mem;

// bwd path control
/*
wire done_bwd_path_weighted_sum;
wire done_bwd_path_attention;
wire done_bwd_path_w_up;
*/

//
wire done_sen;

wire rst_n_sen;

//
wire _busy;
wire _ready;


//
wire [BW_DATA-1:0] result [DIM_IN-1:0];

wire [BW_DATA-1:0] _max_128 [DIM_IN/2-1:0];
wire [BW_DATA-1:0] _max_64 [DIM_IN/4-1:0];
wire [BW_DATA-1:0] _max_32 [DIM_IN/8-1:0];
wire [BW_DATA-1:0] _max_16 [DIM_IN/16-1:0];
wire [BW_DATA-1:0] _max_8 [DIM_IN/32-1:0];
wire [BW_DATA-1:0] _max_4 [DIM_IN/64-1:0];
wire [BW_DATA-1:0] _max_2 [DIM_IN/128-1:0];
wire [BW_DATA-1:0] _max;

wire [BW_WORD_VEC-1:0] _max_128_ind [DIM_IN/2-1:0];
wire [BW_WORD_VEC-1:0] _max_64_ind [DIM_IN/4-1:0];
wire [BW_WORD_VEC-1:0] _max_32_ind [DIM_IN/8-1:0];
wire [BW_WORD_VEC-1:0] _max_16_ind [DIM_IN/16-1:0];
wire [BW_WORD_VEC-1:0] _max_8_ind [DIM_IN/32-1:0];
wire [BW_WORD_VEC-1:0] _max_4_ind [DIM_IN/64-1:0];
wire [BW_WORD_VEC-1:0] _max_2_ind [DIM_IN/128-1:0];
wire [BW_WORD_VEC-1:0] _max_ind;

reg [BW_DATA-1:0] max_128 [DIM_IN/2-1:0];
reg [BW_DATA-1:0] max_64 [DIM_IN/4-1:0];
reg [BW_DATA-1:0] max_32 [DIM_IN/8-1:0];
reg [BW_DATA-1:0] max_16 [DIM_IN/16-1:0];
reg [BW_DATA-1:0] max_8 [DIM_IN/32-1:0];
reg [BW_DATA-1:0] max_4 [DIM_IN/64-1:0];
reg [BW_DATA-1:0] max_2 [DIM_IN/128-1:0];
reg [BW_DATA-1:0] max;

reg [BW_WORD_VEC-1:0] max_128_ind [DIM_IN/2-1:0];
reg [BW_WORD_VEC-1:0] max_64_ind [DIM_IN/4-1:0];
reg [BW_WORD_VEC-1:0] max_32_ind [DIM_IN/8-1:0];
reg [BW_WORD_VEC-1:0] max_16_ind [DIM_IN/16-1:0];
reg [BW_WORD_VEC-1:0] max_8_ind [DIM_IN/32-1:0];
reg [BW_WORD_VEC-1:0] max_4_ind [DIM_IN/64-1:0];
reg [BW_WORD_VEC-1:0] max_2_ind [DIM_IN/128-1:0];
reg [BW_WORD_VEC-1:0] max_ind;

reg valid_max_128;
reg valid_max_64;
reg valid_max_32;
reg valid_max_16;
reg valid_max_8;
reg valid_max_4;
reg valid_max_2;
reg valid_max;






wire [BW_WORD_VEC-1:0] data_word_in_emb_a;
wire we_data_word_in_emb_a;
wire re_data_word_in_emb_a;
wire en_bwd_path_w_up_emb_a;
wire done_data_word_in_emb_a;
wire [`BW_DEBUG_EMB-1:0] debug_out_emb_a;

wire [BW_WORD_VEC-1:0] data_word_in_emb_q;
wire we_data_word_in_emb_q;
wire re_data_word_in_emb_q;
wire en_bwd_path_w_up_emb_q;
wire done_data_word_in_emb_q;
wire [`BW_DEBUG_EMB-1:0] debug_out_emb_q;

reg done_bwd_path_w_up_emb_a;
reg done_bwd_path_w_up_emb_c;
reg done_bwd_path_w_up_emb_q;

wire _done_bwd_path_w_up_emb_a;
wire _done_bwd_path_w_up_emb_c;
wire _done_bwd_path_w_up_emb_q;

wire rst_n_batch_emb_a;
wire rst_n_batch_emb_c;
wire rst_n_batch_emb_q;
wire rst_n_batch;

wire [BW_WORD_VEC-1:0] data_word_in_emb_c;
wire we_data_word_in_emb_c;
wire re_data_word_in_emb_c;
wire en_bwd_path_w_up_emb_c;
wire done_data_word_in_emb_c;
wire [`BW_DEBUG_EMB-1:0] debug_out_emb_c;

reg done_bwd_path_emb_a;
reg done_bwd_path_emb_c;
reg done_bwd_path_emb_q;

wire _done_bwd_path_emb_q;

wire [BW_DATA-1:0] grad_in_emb_a [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_in_emb_a_flat;
wire [BW_DATA-1:0] grad_in_emb_c [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_in_emb_c_flat;
wire [BW_DATA-1:0] grad_in_emb_q [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] grad_in_emb_q_flat;


wire rst_n_count_word_emb_bwd;
wire en_fwd_path_sen_emb_bwd;
wire en_fwd_path_q_emb_bwd;
wire en_count_sen_emb_bwd;
wire en_count_word_sen_emb_bwd;
wire en_count_word_q_emb_bwd;
wire done_emb_q_emb_bwd;
wire en_bwd_path_emb_bwd;
wire [BW_WORD_VEC-1:0] data_in_emb_bwd;

wire done_bwd_path_emb_bwd;
wire done_read_q_emb_bwd;
wire done_read_sen_emb_bwd;
wire [BW_WORD_VEC-1:0] data_out_word_sen_emb_bwd;
wire [BW_WORD_VEC-1:0] data_out_word_q_emb_bwd;
wire en_data_out_word_emb_bwd;
wire [BW_MEM_ADDR-1:0] addr_out_sen_emb_bwd;


wire we_data_out_word_sen_emb_bwd;
wire we_data_out_word_q_emb_bwd;

wire [BW_DATA*NUM_MEM-1:0] gin_attention_mem;
wire [BW_DATA-1:0] gout_mat_attention_mem [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] gout_mat_attention_mem_flat;
wire [BW_DATA-1:0] gout_vec_attention_mem [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] gout_vec_attention_mem_flat;
wire en_bwd_path_grad_attention_mem;
wire [BW_MEM_ADDR-1:0] ain_bwd_path_grad_attention_mem;
wire done_bwd_path_grad_attention_mem;
wire [`BW_DEBUG_ATT_MEM-1:0] debug_out_attention_mem;

// test_170808
/*
reg [BW_DATA-1:0] _add_in_a[0:DIM_EMB-1];
reg [BW_DATA-1:0] _add_in_b [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_out [0:DIM_EMB-1];
*/

wire [BW_DATA-1:0] _add_in_a_sum_u_q [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_in_b_sum_u_q [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_out_sum_u_q [0:DIM_EMB-1];

wire [BW_DATA-1:0] _add_in_a_grad_reg_q [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_in_b_grad_reg_q [0:DIM_EMB-1];
wire [BW_DATA-1:0] _add_out_grad_reg_q [0:DIM_EMB-1];


wire [BW_DATA*DIM_EMB-1:0] din_mem_weighted_mem;
wire [BW_DATA-1:0] din_weight_weighted_mem [0:NUM_MEM-1];
wire [BW_DATA*NUM_MEM-1:0] din_weight_weighted_mem_flat;

wire done_fwd_path_weighted_mem;
wire [BW_DATA*DIM_EMB-1:0] grad_in_weighted_mem;
wire done_bwd_path_weighted_mem;
wire [BW_DATA-1:0] gout_mat_weighted_mem [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] gout_mat_weighted_mem_flat;
wire [BW_DATA-1:0] gout_vec_weighted_mem [0:NUM_MEM-1];
wire [BW_DATA*NUM_MEM-1:0] gout_vec_weighted_mem_flat;
wire [`BW_DEBUG_W_MEM-1:0] debug_out_weighted_mem;
wire en_bwd_path_grad_weighted_mem;
wire done_bwd_path_grad_weigthed_mem;

wire [BW_MEM_ADDR-1:0] addr_in_bwd_path_grad_weighted_mem;
wire done_bwd_path_grad_weighted_mem;

reg [7:0] reg_lr_l2;
reg [7:0] reg_din_exp_shift_bit;

// w_init
wire en_w_init_emb_a;
wire en_w_init_emb_c;
wire en_w_init_emb_q;
wire en_w_init_fc;
wire en_w_init_fc_w_sm;

wire [BW_DATA*DIM_EMB-1:0] data_out_w_init;
wire [BW_ADDR_W_INIT-1:0] addr_out_w_init;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
//assign rst_n_soft = !(en_fwd_path_end&&!t_train) && !(en_bwd_path_end&&t_train);
assign rst_n_soft = !done;
assign rst_n_weighted_sum = rst_n && rst_n_soft;

assign rst_n_soft_attention_mem = rst_n_soft;
assign rst_n_soft_fc_w_sm = rst_n_soft;
assign rst_n_soft_fc = rst_n_soft;

//assign done = (en_fwd_path_end&&!t_train) || (en_bwd_path_end&&t_train);
assign done = (done_fwd_path_end&&!t_train) || (en_bwd_path_end&&t_train);


assign en_mem_w_weighted_mem = done_fwd_path_emb_c && t_sentence_done;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_init_sync <= 1'b0;
    else
        en_init_sync <= !done_init && (en_init_sync || en_init);
end 

assign _done_fwd_path_end = en_latch_result;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path_end <= 1'b0;
    else
        //done_fwd_path_end <= en_fwd_path_end;
        done_fwd_path_end <= _done_fwd_path_end;
end


assign _busy = en_init_sync
            || en_fwd_path_emb_a
            || en_fwd_path_emb_c
            || en_fwd_path_emb_q
            || en_answer
//            || done_a
            || (en_fwd_path&&!t_train);

assign _ready = (en_init_sync&&done_init)
             || done_fwd_path_emb_a
             || done_fwd_path_emb_c
             || done_fwd_path_emb_q
             || (!(en_init_sync||en_fwd_path)&&!done_emb_q&&!t_train)
             || (!(en_init_sync||en_fwd_path||en_bwd_path)&&!done_emb_q&&t_train);
             //|| !((en_fwd_path||en_bwd_path)&&t_train);



assign _en = en && rb_n;

assign en_fwd_path_emb_a = _en && (t_sentence||t_sentence_done);
assign en_fwd_path_emb_c = _en && (t_sentence||t_sentence_done);
assign en_fwd_path_emb_q = _en && (t_question||t_question_done);
assign en_answer = _en && t_answer;


// en init weight
//assign en_init_w_emb_a = en_init;
//assign en_init_w_emb_c = en_init;
//assign en_init_w_emb_q = en_init;
//assign en_init_w_fc_w_sm = en_init;
//assign en_init_w_fc = en_init;

assign en_init_w_emb_a = en_w_init_emb_a;
assign en_init_w_emb_c = en_w_init_emb_c;
assign en_init_w_emb_q = en_w_init_emb_q;
assign en_init_w_fc = en_w_init_fc;
assign en_init_w_fc_w_sm = en_w_init_fc_w_sm;


assign rst_n_addr_mem = rst_n && rst_n_soft;

//
assign word_vec = data_in[`RANGE_WORD_VEC];
assign type_code = data_in[`RANGE_TYPE_CODE];

// 
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign reg_q[i] = reg_q_buf[hop][i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign reg_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = reg_q[i];
    end
endgenerate

// attention memory
assign en_mem_w_attention_mem = done_fwd_path_emb_a && t_sentence_done;
assign din_mem_attention_mem = data_out_emb_a_flat;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out_emb_a[i] = data_out_emb_a_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

//assign din_question_attention_mem = reg_emb_q;

/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign din_question_attention_mem[(i+1)*BW_DATA-1-:BW_DATA] = reg_q[i];
    end
endgenerate
*/

assign din_question_attention_mem = reg_q_flat;

assign en_fwd_path_attention_mem = en_fwd_path_attention;
assign en_bwd_path_attention_mem = en_bwd_path_attention;



assign _done_fwd_question = done_fwd_path_emb_q&&t_question_done;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_question_pre <= 1'b0;
    else
        done_fwd_question_pre <= _done_fwd_question;
end


assign done_bwd_path_cost = done_cross_entropy;

assign data_in_emb_a = word_vec;
assign data_in_emb_c = word_vec;
assign data_in_emb_q = word_vec;

assign en_bwd_path_emb_a = en_bwd_path_emb;
assign en_bwd_path_emb_c = en_bwd_path_emb;
//assign en_bwd_path_emb_q = en_bwd_path_emb;
assign en_bwd_path_emb_q = en_bwd_path_emb && done_bwd_path_count_hop;



//
assign done_sen = done_mem_w_attention_mem;

generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign grad_out_cross_entropy[i] = grad_out_cross_entropy_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

//
assign grad_in_fc_w_sm = grad_out_cross_entropy_flat;


// fc
assign en_fwd_path_fc = en_fwd_path_attention;
assign en_bwd_path_fc = en_bwd_path_weighted_mem;
assign en_bwd_path_w_up_fc = en_bwd_path_w_up;
/*
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign data_in_fc[(i+1)*BW_DATA-1-:BW_DATA] = reg_q[i];
    end
endgenerate
*/
assign data_in_fc = reg_q_flat;
assign grad_in_fc = grad_sum_u_q_flat;
assign lr_l2_fc = reg_lr_l2;


generate
    for(i=0;i<DIM_IN;i=i+1)
    begin
        assign data_out_fc_w_sm[i] = data_out_fc_w_sm_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


//
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : debug_res
        assign result[i] = data_out_fc_w_sm[i];
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_comp_result <= 1'b0;
    else
        if(en_fwd_path_end==1'b1)
            en_comp_result <= 1'b1;
        else
            if(_done_fwd_path_end==1'b1)
                en_comp_result <= 1'b0;
end

assign en_latch_result = en_comp_result && valid_max;


generate
    for(i=0;i<DIM_IN;i=i+2)
    begin : debug_max_128
        assign _max_128[i/2] = ($signed(result[i]) > $signed(result[i+1]))? result[i]:result[i+1];
        assign _max_128_ind[i/2] = ($signed(result[i]) > $signed(result[i+1]))? i:i+1;

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_128[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_128[i/2] <= _max_128[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_128_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_128_ind[i/2] <= _max_128_ind[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_IN/2;i=i+2)
    begin : debug_max_64
        assign _max_64[i/2] = ($signed(max_128[i]) > $signed(max_128[i+1]))? max_128[i]:max_128[i+1];
        assign _max_64_ind[i/2] = ($signed(max_128[i]) > $signed(max_128[i+1]))? max_128_ind[i]:max_128_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_64[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_64[i/2] <= _max_64[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_64_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_64_ind[i/2] <= _max_64_ind[i/2];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN/4;i=i+2)
    begin : debug_max_32
        assign _max_32[i/2] = ($signed(max_64[i]) > $signed(max_64[i+1]))? max_64[i]:max_64[i+1];
        assign _max_32_ind[i/2] = ($signed(max_64[i]) > $signed(max_64[i+1]))? max_64_ind[i]:max_64_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_32[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_32[i/2] <= _max_32[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_32_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_32_ind[i/2] <= _max_32_ind[i/2];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN/8;i=i+2)
    begin : debug_max_16
        assign _max_16[i/2] = ($signed(max_32[i]) > $signed(max_32[i+1]))? max_32[i]:max_32[i+1];
        assign _max_16_ind[i/2] = ($signed(max_32[i]) > $signed(max_32[i+1]))? max_32_ind[i]:max_32_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_16[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_16[i/2] <= _max_16[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_16_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_16_ind[i/2] <= _max_16_ind[i/2];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN/16;i=i+2)
    begin : debug_max_8
        assign _max_8[i/2] = ($signed(max_16[i]) > $signed(max_16[i+1]))? max_16[i]:max_16[i+1];
        assign _max_8_ind[i/2] = ($signed(max_16[i]) > $signed(max_16[i+1]))? max_16_ind[i]:max_16_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_8[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_8[i/2] <= _max_8[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_8_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_8_ind[i/2] <= _max_8_ind[i/2];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN/32;i=i+2)
    begin : debug_max_4
        assign _max_4[i/2] = ($signed(max_8[i]) > $signed(max_8[i+1]))? max_8[i]:max_8[i+1];
        assign _max_4_ind[i/2] = ($signed(max_8[i]) > $signed(max_8[i+1]))? max_8_ind[i]:max_8_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_4[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_4[i/2] <= _max_4[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_4_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_4_ind[i/2] <= _max_4_ind[i/2];
        end
    end
endgenerate


generate
    for(i=0;i<DIM_IN/64;i=i+2)
    begin : debug_max_2
        assign _max_2[i/2] = ($signed(max_4[i]) > $signed(max_4[i+1]))? max_4[i]:max_4[i+1];
        assign _max_2_ind[i/2] = ($signed(max_4[i]) > $signed(max_4[i+1]))? max_4_ind[i]:max_4_ind[i+1];

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_2[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_2[i/2] <= _max_2[i/2];
        end

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                max_2_ind[i/2] <= 'b0;
            else
                //if(en_comp_result==1'b1)
                    max_2_ind[i/2] <= _max_2_ind[i/2];
        end
    end
endgenerate

assign _max = ($signed(max_2[0]) > $signed(max_2[1])) ? max_2[0] : max_2[1];
assign _max_ind = ($signed(max_2[0]) > $signed(max_2[1])) ? max_2_ind[0] : max_2_ind[1];

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_128 <= 1'b0;
    else
        valid_max_128 <= en_comp_result;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_64 <= 1'b0;
    else
        valid_max_64 <= valid_max_128;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_32 <= 1'b0;
    else
        valid_max_32 <= valid_max_64;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_16 <= 1'b0;
    else
        valid_max_16 <= valid_max_32;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_8 <= 1'b0;
    else
        valid_max_8 <= valid_max_16;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_4 <= 1'b0;
    else
        valid_max_4 <= valid_max_8;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max_2 <= 1'b0;
    else
        valid_max_2 <= valid_max_4;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_comp_result==1'b0)
        valid_max <= 1'b0;
    else
        valid_max <= valid_max_2;
end

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_a[i] = gout_mat_attention_mem[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_a_flat[(i+1)*BW_DATA-1-:BW_DATA] = grad_in_emb_a[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_c[i] = gout_mat_weighted_mem[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_c_flat[(i+1)*BW_DATA-1-:BW_DATA] = grad_in_emb_c[i];
    end
endgenerate

assign data_word_in_emb_a = data_out_word_sen_emb_bwd;
assign we_data_word_in_emb_a = we_data_out_word_sen_emb_bwd;
assign en_bwd_path_w_up_emb_a = en_bwd_path_w_up;
assign done_data_word_in_emb_a = done_read_sen_emb_bwd;

assign data_word_in_emb_q = data_out_word_q_emb_bwd;
assign we_data_word_in_emb_q = we_data_out_word_q_emb_bwd;
assign en_bwd_path_w_up_emb_q = en_bwd_path_w_up;
assign done_data_word_in_emb_q = done_read_q_emb_bwd;

assign data_word_in_emb_c = data_out_word_sen_emb_bwd;
assign we_data_word_in_emb_c = we_data_out_word_sen_emb_bwd;
assign en_bwd_path_w_up_emb_c = en_bwd_path_w_up;
assign done_data_word_in_emb_c = done_read_sen_emb_bwd;

assign rst_n_batch = !done_bwd_path_w_up;

assign rst_n_batch_emb_a = rst_n_batch;
assign rst_n_batch_emb_c = rst_n_batch;
assign rst_n_batch_emb_q = rst_n_batch;
assign rst_n_batch_fc_w_sm = rst_n_batch;
assign rst_n_batch_fc = rst_n_batch;

assign rst_n_count_word_emb_bwd = rst_n && rst_n_sen;
assign en_fwd_path_sen_emb_bwd = en_fwd_path_emb_a;
assign en_fwd_path_q_emb_bwd = en_fwd_path_emb_q;
assign en_count_word_sen_emb_bwd = done_fwd_path_emb_a || done_fwd_path_emb_q || (re_data_word_in_emb_c&&re_data_word_in_emb_a);
assign en_count_word_q_emb_bwd = re_data_word_in_emb_q; 
assign en_count_sen_emb_bwd = done_fwd_path_emb_a && t_sentence_done;
assign done_emb_q_emb_bwd = done_fwd_question;
assign en_bwd_path_emb_bwd = en_bwd_path_emb;
assign data_in_emb_bwd = word_vec;

assign gin_attention_mem = gout_vec_weighted_mem_flat;
assign done_bwd_path_attention = done_bwd_path_attention_mem;
assign en_bwd_path_grad_attention_mem = en_bwd_path_emb_a;
assign ain_bwd_path_grad_attention_mem = addr_out_sen_emb_bwd;
assign done_bwd_path_grad_attention_mem = done_bwd_path_emb_bwd;

// count_hop
assign hop_fwd = count_count_hop;
assign hop_bwd = NUM_HOP-1-count_count_hop;
assign hop = (en_fwd_path==1) ? hop_fwd : hop_bwd;
assign rst_n_count_hop = rst_n && !(en_fwd_path&&en_fwd_path_end) && !(en_bwd_path&&en_bwd_path_end);
assign en_count_hop = (en_fwd_path && en_fwd_path_count_hop) || (en_bwd_path && en_bwd_path_count_hop);
assign done_fwd_path_count_hop = en_fwd_path && done_count_hop;
assign done_bwd_path_count_hop = en_bwd_path && done_count_hop;
assign rst_n_hop = !en_count_hop;


//
generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign gout_vec_weighted_mem[i] = gout_vec_weighted_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign gout_mat_weighted_mem[i] = gout_mat_weighted_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate



// test_170808
/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_add_in_a
        always@(*)
        begin
            if(en_fwd_path==1'b1)
                _add_in_a[i] = reg_emb_q[(i+1)*BW_DATA-1-:BW_DATA];
            else if(en_bwd_path==1'b1)
                //_add_in_a[i] = gout_vec_weighted_mem[(i+1)*BW_DATA-1-:BW_DATA];
                _add_in_a[i] = grad_out_fc_w_sm[(i+1)*BW_DATA-1-:BW_DATA];
            else
                _add_in_a[i] = {BW_DATA{1'b0}};
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_add_in_b
        always@(*)
        begin
            if(en_fwd_path==1'b1)
                _add_in_b[i] = reg_weighted_sum[(i+1)*BW_DATA-1-:BW_DATA];
            else if(en_bwd_path==1'b1)
                _add_in_b[i] = gout_vec_attention_mem[(i+1)*BW_DATA-1-:BW_DATA];
            else
                _add_in_b[i] = {BW_DATA{1'b0}};
        end
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign _reg_sum_u_q[(i+1)*BW_DATA-1-:BW_DATA] = (en_fwd_path==1'b1)? _add_out[i] : {BW_DATA{1'b0}};
        //assign _reg_sum_u_q[i] = (en_fwd_path==1'b1)? _add_out[i] : {BW_DATA{1'b0}};
        assign _reg_sum_u_q[i] = _add_out[i];
        
        //
        //always@(*)
        //begin
        //    case({en_fwd_path,en_fwd_path_sum_u_q})
        //        2'b10:
        //        begin
        //            _reg_sum_u_q[i] = reg_sum_u_q[i];
        //        end 
        //        2'b11:
        //        begin
        //            _reg_sum_u_q[i] = _add_out[i];
        //        end
        //        default
        //        begin
        //            _reg_sum_u_q[i] = {BW_DATA{1'b0}};
        //        end
        //    endcase
        //end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_q[(i+1)*BW_DATA-1-:BW_DATA] = (en_bwd_path==1'b1)? _add_out[i] : {BW_DATA{1'b0}};
    end
endgenerate

*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out_fc[i] = data_out_fc_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_a_sum_u_q
        //assign _add_in_a_sum_u_q[i] = reg_emb_q[(i+1)*BW_DATA-1-:BW_DATA];
        //assign _add_in_a_sum_u_q[i] = reg_q[i];
        assign _add_in_a_sum_u_q[i] = data_out_fc[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_b_sum_u_q
        assign _add_in_b_sum_u_q[i] = reg_weighted_sum[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_out_sum_u_q
        assign _reg_sum_u_q[i] = _add_out_sum_u_q[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_out_fc[i] = grad_out_fc_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_a_grad_in_emb_q
        assign _add_in_a_grad_reg_q[i] = gout_vec_attention_mem[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_b_grad_in_emb_q
        assign _add_in_b_grad_reg_q[i] = grad_out_fc[i];
    end
endgenerate




/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_a_grad_in_emb_q
        assign _add_in_a_grad_reg_q[i] = grad_out_fc_w_sm[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin: assign_add_in_b_grad_in_emb_q
        assign _add_in_b_grad_reg_q[i] = gout_vec_attention_mem[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate
*/

/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_reg_q[i] = _add_out_grad_reg_q[i];
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                grad_reg_q[i] <= {BW_DATA{1'b0}};
            else
                if(en_bwd_path_emb==1'b1)
                    grad_reg_q[i] <= _add_out_grad_reg_q[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_q[i] = grad_reg_q[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_in_emb_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = grad_in_emb_q[i];
    end
endgenerate

assign din_mem_weighted_mem = data_out_emb_c_flat;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out_emb_c[i] = data_out_emb_c_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign din_weight_weighted_mem_flat[(i+1)*BW_DATA-1-:BW_DATA] = din_weight_weighted_mem[i];
    end
endgenerate

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign din_weight_weighted_mem[i] = dout_attention_attention_mem[i];
    end
endgenerate

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign dout_attention_attention_mem[i] = dout_attention_attention_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign gout_vec_attention_mem[i] = gout_vec_attention_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign gout_mat_attention_mem[i] = gout_mat_attention_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

assign grad_in_weighted_mem = grad_sum_u_q_flat;
assign en_bwd_path_grad_weighted_mem = en_bwd_path_emb_c;
assign addr_in_bwd_path_grad_weighted_mem = addr_out_sen_emb_bwd;
assign done_bwd_path_grad_weighted_mem = done_bwd_path_emb_bwd;

assign en_bwd_path_w_up_fc_w_sm = en_bwd_path_w_up;

always@(*)
begin
    _answer_one_hot = {DIM_IN{1'b0}};
    _answer_one_hot[reg_answer_vec] = 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        answer_one_hot <= {DIM_IN{1'b0}};
    else
        answer_one_hot <= _answer_one_hot;
end


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_init==1'b1)
        reg_done_init_w_emb_a <= 1'b0;
    else
        if(reg_done_init_w_emb_a==1'b0)
            reg_done_init_w_emb_a <= done_init_w_emb_a;
end
*/
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_done_init_w_emb_a <= 1'b0;
    else
        reg_done_init_w_emb_a <= !done_init && (reg_done_init_w_emb_a||done_init_w_emb_a);
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_init==1'b1)
    if(rst_n==1'b0)
        reg_done_init_w_emb_c <= 1'b0;
    else
        if(done_init==1'b1)
            reg_done_init_w_emb_c <= 1'b0;
        else if(reg_done_init_w_emb_c==1'b0)
            reg_done_init_w_emb_c <= done_init_w_emb_c;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_init==1'b1)
    if(rst_n==1'b0)
        reg_done_init_w_emb_q <= 1'b0;
    else
        if(done_init==1'b1)
            reg_done_init_w_emb_q <= 1'b0;
        else if(reg_done_init_w_emb_q==1'b0)
            reg_done_init_w_emb_q <= done_init_w_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_done_init_w_fc <= 1'b0;
    else
        if(done_init==1'b1)
            reg_done_init_w_fc <= 1'b0;
        else if(reg_done_init_w_fc==1'b0)
            reg_done_init_w_fc <= done_init_w_fc;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_init==1'b1)
    if(rst_n==1'b0)
        reg_done_init_w_fc_w_sm <= 1'b0;
    else
        if(done_init==1'b1)
            reg_done_init_w_fc_w_sm <= 1'b0;
        else if(reg_done_init_w_fc_w_sm ==1'b0)
            reg_done_init_w_fc_w_sm <= done_init_w_fc_w_sm;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_init <= 1'b0;
    else
        if(done_init==1'b0)
            done_init <= reg_done_init_w_emb_a && reg_done_init_w_emb_c && reg_done_init_w_emb_q && reg_done_init_w_fc_w_sm && reg_done_init_w_fc;
        else
            done_init <= 1'b0;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_answer_sync <= 1'b0;
    else
        if(en_answer_sync ==1'b0)
            en_answer_sync <= en_answer;
        else
            en_answer_sync <= 1'b0;
end

// reg emb question
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_question <= 1'b0;
    else
        //done_fwd_question <= _done_fwd_question;
        done_fwd_question <= done_fwd_question_pre;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_emb_q <= 'b0;    
    else
        if(done_fwd_question==1'b1)
            reg_emb_q <= data_out_emb_q;
end
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out_emb_q[i] = data_out_emb_q_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                reg_q_buf[0][i] <= {BW_DATA{1'b0}};
            else
                if(done_fwd_question==1'b1)
                    reg_q_buf[0][i] <= data_out_emb_q[i];
        end
    end
endgenerate

generate
    for(i=1;i<NUM_HOP;i=i+1)
    begin
        for(j=0;j<DIM_EMB;j=j+1)
        begin
            always@(posedge clk or negedge rst_n)
            begin
                if(rst_n==1'b0)
                    reg_q_buf[i][j] <= {BW_DATA{1'b0}};
                else
                    if(en_fwd_path_count_hop==1'b1 && i-1==hop)
                        reg_q_buf[i][j] <= reg_sum_u_q_flat[(j+1)*BW_DATA-1-:BW_DATA];;
            end
        end
    end
endgenerate

// reg answer
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer_vec <= 'b0;
    else
        if(en_answer_sync==1'b1)
            reg_answer_vec <= word_vec;
end

/*
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : answer_one_hot
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                reg_answer_one_hot[i] <= 1'b0;
            else
                if(en_answer_sync==1'b1)
                    if(word_vec == i)
                        reg_answer_one_hot[i] <= 1'b1;
                    else 
                        reg_answer_one_hot[i] <= 1'b0;
        end
    end
endgenerate
*/

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer_one_hot <= {DIM_IN{1'b0}};
    else
        if(en_answer_sync==1'b1)
            reg_answer_one_hot <= _reg_answer_one_hot;
end
*/

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer_one_hot <= {DIM_IN{1'b0}};
    else
        reg_answer_one_hot <= 

end
*/



/*
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : answer_fixed
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                reg_answer_fixed <= 'b0;
            else
                reg_answer_fixed[BW_WL-BW_IWL-1+i*BW_WL] <= reg_answer_vec[i];
        end
    end
endgenerate
*/

// for phase control
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_emb_q <= 1'b0;
    else
        if(en_fwd_path==1'b1)
            done_emb_q <= 1'b0;
        else if(done_fwd_question==1'b1)
            done_emb_q <= done_fwd_question;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_a <= 1'b0;
    else
        if(en_fwd_path==1'b1)
            done_a <= 1'b0;
        else if(en_answer_sync==1'b1)
            done_a <= en_answer_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path <= 1'b0;
    else
        //if(en_fwd_path_end==1'b1)
        //if(done_fwd_path_end==1'b1)
        if(_done_fwd_path_end==1'b1)
            en_fwd_path <= 1'b0;
        else if(en_fwd_path == 1'b0)
            en_fwd_path <= done_emb_q && done_a;
end

// backaward path control
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path <= 1'b0;
    else
        if(en_bwd_path_end==1'b1)
            en_bwd_path <= 1'b0;
        else if(en_bwd_path == 1'b0)
            //en_bwd_path <= en_fwd_path && en_fwd_path_end && t_train;
            //en_bwd_path <= en_fwd_path && done_fwd_path_end && t_train;
            en_bwd_path <= en_fwd_path && _done_fwd_path_end && t_train;
            
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rb_n <= 1'b1;
    else
        if(rb_n==1'b1 && _busy ==1'b1)
            rb_n <= 1'b0;
        else if(rb_n==1'b0 && _ready ==1'b1)
            rb_n <= 1'b1;
end



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_soft_emb_a <= 1'b0;
    else
        rst_n_soft_emb_a <= !done_mem_w_attention_mem;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_soft_emb_c <= 1'b0;
    else
        //rst_n_soft_emb_c <= !we_mem_c;
        rst_n_soft_emb_c <= !done_mem_w_weighted_mem;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_soft_emb_q <= 1'b0;
    else
        rst_n_soft_emb_q <= !done_fwd_question;
end

//
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_sen <= 1'b1;
    else
        rst_n_sen <= !done_sen && !en_fwd_path;
end
*/

assign rst_n_sen = !done_sen && !en_fwd_path;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign dout_weighted_sum_weighted_mem[i] = dout_weighted_sum_weighted_mem_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_weighted_sum <= 'b0;
    else
        //if(done_fwd_path_weighted_mem==1'b1)
        if(en_fwd_path_sum_u_q==1'b1)
            reg_weighted_sum <= dout_weighted_sum_weighted_mem_flat;
end

// sum u q
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path_sum_u_q <= 1'b0;
    else
        done_fwd_path_sum_u_q <= en_fwd_path_sum_u_q;
end

/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_reg_sum_u_q
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                reg_sum_u_q[i] <= {BW_DATA{1'b0}};
            else
                if(en_fwd_path_sum_u_q==1'b1)
                    reg_sum_u_q[i] <= _reg_sum_u_q[i];
                
                //reg_sum_u_q[i] <= _reg_sum_u_q[i];
        end
    end
endgenerate
*/

generate
    for(i=0;i<NUM_HOP;i=i+1)
    begin
        for(j=0;j<DIM_EMB;j=j+1)
        begin
            always@(posedge clk or negedge rst_n)
            begin
                if(rst_n==1'b0)
                    reg_sum_u_q_buf[i][j] <= {BW_DATA{1'b0}};
                else
                    if(done_fwd_path_sum_u_q==1'b1 && i==hop)
                        reg_sum_u_q_buf[i][j] <= _reg_sum_u_q[j];
            end
        end
    end
endgenerate

/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign reg_sum_u_q[i] = reg_sum_u_q_buf[count_count_hop][i];
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_reg_sum_u_q
        //assign reg_sum_u_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = reg_sum_u_q[i];
        //assign reg_sum_u_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = reg_sum_u_q_buf[hop][i];
        assign reg_sum_u_q[i] = reg_sum_u_q_buf[hop][i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_reg_sum_u_q_flat
        assign reg_sum_u_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = reg_sum_u_q[i];
    end
endgenerate

assign en_latch_grad_sum_u_q = en_bwd_path_weighted_mem;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign grad_out_fc_w_sm[i] = grad_out_fc_w_sm_flat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign__grad_sum_u_q
        assign _grad_sum_u_q[i] = (hop==NUM_HOP-1) ? grad_out_fc_w_sm[i] : grad_reg_q[i];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_grad_sum_u_q
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                grad_sum_u_q[i] <= {BW_DATA{1'b0}};
            else
                if(en_latch_grad_sum_u_q==1'b1)
                    grad_sum_u_q[i] <= _grad_sum_u_q[i];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_grad_sum_u_q_flat
        assign grad_sum_u_q_flat[(i+1)*BW_DATA-1-:BW_DATA] = grad_sum_u_q[i];
    end
endgenerate



assign data_in_fc_w_sm = reg_sum_u_q_flat;
/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        max <= 1'b0;
    else
        if(en_fwd_path_end==1'b1)
            if($signed(max_2[0]) > $signed(max_2[1]))
                max <= max_2[0];
            else
                max <= max_2[1];
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        max_ind <= 1'b0;
    else
        if(en_fwd_path_end==1'b1)
            if($signed(max_2[0]) > $signed(max_2[1]))
                max_ind <= max_2_ind[0];
            else
                max_ind <= max_2_ind[1];
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        max <= 1'b0;
    else
        if(en_latch_result==1'b1)
            max <= _max;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        max_ind <= 1'b0;
    else
        if(en_latch_result==1'b1)
            max_ind <= _max_ind;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer_ind<= 1'b0;
    else
        if(en_latch_result==1'b1)
            reg_answer_ind <= reg_answer_vec;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_emb==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_emb_a <= 1'b0;
    else    
        if(done_bwd_path_emb==1'b1)
            done_bwd_path_emb_a <= 1'b0;
        else if(done_bwd_path_emb_a==1'b0)
            done_bwd_path_emb_a <= _done_bwd_path_emb_a;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_emb==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_emb_c <= 1'b0;
    else    
        if(done_bwd_path_emb==1'b1)
            done_bwd_path_emb_c <= 1'b0;
        else if(done_bwd_path_emb_c==1'b0)
            done_bwd_path_emb_c <= _done_bwd_path_emb_c;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_emb==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_emb_q <= 1'b0;
    else    
        if(done_bwd_path_emb==1'b1)
            done_bwd_path_emb_q <= 1'b0;
        else if(done_bwd_path_emb_q==1'b0)
            done_bwd_path_emb_q <= _done_bwd_path_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_w_up==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_w_up_emb_a <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up_emb_a <= 1'b0;
        else if(done_bwd_path_w_up_emb_a==1'b0)
            done_bwd_path_w_up_emb_a <= _done_bwd_path_w_up_emb_a;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_w_up==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_w_up_emb_c <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up_emb_c <= 1'b0;
        else if(done_bwd_path_w_up_emb_c==1'b0)
            done_bwd_path_w_up_emb_c <= _done_bwd_path_w_up_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_w_up==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_w_up_emb_q <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up_emb_q <= 1'b0;
        else if(done_bwd_path_w_up_emb_q==1'b0)
            done_bwd_path_w_up_emb_q <= _done_bwd_path_w_up_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path_w_up_fc<= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up_fc<= 1'b0;
        else if(done_bwd_path_w_up_fc==1'b0)
            done_bwd_path_w_up_fc<= _done_bwd_path_w_up_fc;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_bwd_path_w_up==1'b1)
    if(rst_n==1'b0)
        done_bwd_path_w_up_fc_w_sm <= 1'b0;
    else
        if(done_bwd_path_w_up==1'b1)
            done_bwd_path_w_up_fc_w_sm <= 1'b0;
        else if(done_bwd_path_w_up_fc_w_sm==1'b0)
            done_bwd_path_w_up_fc_w_sm<= _done_bwd_path_w_up_fc_w_sm;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_lr_l2 <= 8'b0;
    else
        reg_lr_l2 <= lr_l2;
end

assign lr_l2_fc_w_sm = reg_lr_l2;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_din_exp_shift_bit <= 8'b0;
    else
        reg_din_exp_shift_bit <= din_exp_shift_bit;
end

assign din_exp_shift_bit_fc_w_sm = reg_din_exp_shift_bit;



assign data_out = {{BW_DATA_IN-BW_WORD_VEC{1'b0}},max_ind};

////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////
// type decoder
decoder
#(
)
type_decoder
(
    // input
    //.type_code(type_code),
    .data_in(data_in),
    // output
    .t_train(t_train),
    .t_sentence(t_sentence),
    .t_sentence_done(t_sentence_done),
    .t_question(t_question),
    .t_question_done(t_question_done),
    .t_answer(t_answer)
    //.t_answer_done(t_answer_done)
);

//
memory_network_emb
#(
`ifdef Q_FORM_Q_7_24
    .INIT_FILE("w_emb_a_init_q7_24_")
`endif
`ifdef Q_FORM_Q_11_20
    .INIT_FILE("w_emb_a_init_q11_20_")
`endif
    //.BW_W_UP_HOP(BW_HOP)
)
emb_a
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_emb_a),
    .rst_n_batch(rst_n_batch_emb_a),
    .rst_n_hop(rst_n_hop),
    // input,
    .en_init_w(en_init_w_emb_a),
    .data_in_init_w(data_out_w_init),
    .addr_in_init_w(addr_out_w_init),
    .en_fwd_path(en_fwd_path_emb_a),
    .en_bwd_path(en_bwd_path_emb_a),
    .en_bwd_path_w_up(en_bwd_path_w_up_emb_a),
    .data_in(data_in_emb_a),
    .grad_in(grad_in_emb_a_flat),
    .data_word_in(data_word_in_emb_a),
    .we_data_word_in(we_data_word_in_emb_a),
    .done_data_word_in(done_data_word_in_emb_a),
    .lr_l2(reg_lr_l2),
    // output
    .data_out(data_out_emb_a_flat),
    .done_init_w(done_init_w_emb_a),
    .done_fwd_path(done_fwd_path_emb_a),
    .done_bwd_path(_done_bwd_path_emb_a),
    .done_bwd_path_w_up(_done_bwd_path_w_up_emb_a),
    .re_data_word_in(re_data_word_in_emb_a),
    //debug
    .debug_out(debug_out_emb_a)
);

memory_network_emb
#(
`ifdef Q_FORM_Q_7_24
    .INIT_FILE("w_emb_c_init_q7_24_")
`endif
`ifdef Q_FORM_Q_11_20
    .INIT_FILE("w_emb_c_init_q11_20_")
`endif
    //.BW_W_UP_HOP(BW_HOP)
)
emb_c
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_emb_c),
    .rst_n_batch(rst_n_batch_emb_c),
    .rst_n_hop(rst_n_hop),
    // input,
    .en_init_w(en_init_w_emb_c),
    .data_in_init_w(data_out_w_init),
    .addr_in_init_w(addr_out_w_init),
    .en_fwd_path(en_fwd_path_emb_c),
    .en_bwd_path(en_bwd_path_emb_c),
    .en_bwd_path_w_up(en_bwd_path_w_up_emb_c),
    .data_in(data_in_emb_c),
    .grad_in(grad_in_emb_c_flat),
    .data_word_in(data_word_in_emb_c),
    .we_data_word_in(we_data_word_in_emb_c),
    .done_data_word_in(done_data_word_in_emb_c),
    .lr_l2(reg_lr_l2),
    // output
    .data_out(data_out_emb_c_flat),
    .done_init_w(done_init_w_emb_c),
    .done_fwd_path(done_fwd_path_emb_c),
    .done_bwd_path(_done_bwd_path_emb_c),
    .done_bwd_path_w_up(_done_bwd_path_w_up_emb_c),
    .re_data_word_in(re_data_word_in_emb_c),
    // debug
    .debug_out(debug_out_emb_c)
);

//
memory_network_emb
#(
`ifdef Q_FORM_Q_7_24
    .INIT_FILE("w_emb_q_init_q7_24_")
`endif
`ifdef Q_FORM_Q_11_20
    .INIT_FILE("w_emb_q_init_q11_20_")
`endif
)
emb_q
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_emb_q),
    .rst_n_batch(rst_n_batch_emb_q),
    .rst_n_hop(rst_n_hop),
    // input,
    .en_init_w(en_init_w_emb_q),
    .data_in_init_w(data_out_w_init),
    .addr_in_init_w(addr_out_w_init),
    .en_fwd_path(en_fwd_path_emb_q),
    .en_bwd_path(en_bwd_path_emb_q),
    .en_bwd_path_w_up(en_bwd_path_w_up_emb_q),
    .data_in(data_in_emb_q),
    .grad_in(grad_in_emb_q_flat),
    .data_word_in(data_word_in_emb_q),
    .we_data_word_in(we_data_word_in_emb_q),
    .done_data_word_in(done_data_word_in_emb_q),
    .lr_l2(reg_lr_l2),
    // output
    .data_out(data_out_emb_q_flat),
    .done_init_w(done_init_w_emb_q),
    .done_fwd_path(done_fwd_path_emb_q),
    .done_bwd_path(_done_bwd_path_emb_q),
    .done_bwd_path_w_up(_done_bwd_path_w_up_emb_q),
    .re_data_word_in(re_data_word_in_emb_q),
    // debug
    .debug_out(debug_out_emb_q)
);

emb_bwd_grad
#(
)
emb_bwd
(
    // clk
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft),
    .rst_n_count_word(rst_n_count_word_emb_bwd),
    .rst_n_hop(rst_n_hop),
    // input
    .en_fwd_path_sen(en_fwd_path_sen_emb_bwd),
    .en_fwd_path_q(en_fwd_path_q_emb_bwd),
    .en_count_sen(en_count_sen_emb_bwd),
    .en_count_word_sen(en_count_word_sen_emb_bwd),
    .en_count_word_q(en_count_word_q_emb_bwd),
    .done_emb_q(done_emb_q_emb_bwd),
    .en_bwd_path(en_bwd_path_emb_bwd),
    .data_in(data_in_emb_bwd),
    // output
    .done_bwd_path(done_bwd_path_emb_bwd),
    .done_read_q(done_read_q_emb_bwd),
    .done_read_sen(done_read_sen_emb_bwd),
    .data_out_word_sen(data_out_word_sen_emb_bwd),
    .data_out_word_q(data_out_word_q_emb_bwd),
    .we_data_out_word_sen(we_data_out_word_sen_emb_bwd),
    .we_data_out_word_q(we_data_out_word_q_emb_bwd),
    .addr_out_sen(addr_out_sen_emb_bwd)
);

attention_memory
#(
)
attention_mem
(
    // clock
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_attention_mem),
    .rst_n_hop(rst_n_hop),
    // input
    .en_mem_w(en_mem_w_attention_mem),
    .en_fwd_path(en_fwd_path_attention_mem),
    .en_bwd_path(en_bwd_path_attention_mem),
    .en_bwd_path_grad(en_bwd_path_grad_attention_mem),
    .din_mem(din_mem_attention_mem),
    .din_question(din_question_attention_mem),
    .gin(gin_attention_mem),
    .ain_bwd_path_grad(ain_bwd_path_grad_attention_mem),
    .done_bwd_path_grad(done_bwd_path_grad_attention_mem),
    .hop(hop),
    // output
    .done_mem_w(done_mem_w_attention_mem),
    .done_fwd_path(done_fwd_path_attention_mem),
    .done_bwd_path(done_bwd_path_attention_mem),
    .we_mem(we_mem_attention_mem),
    .aout_mem(aout_mem_attention_mem),
    .dout_attention(dout_attention_attention_mem_flat),
    .gout_mat(gout_mat_attention_mem_flat),
    .gout_vec(gout_vec_attention_mem_flat),
    //debug
    .debug_out(debug_out_attention_mem)
);

// test_170808
/*
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : adder_sum
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        adder_sum_u_q
        (
            .a(_add_in_a_sum_u_q[i]),
            .b(_add_in_b_sum_u_q[i]),
            .c(_add_out_sum_u_q[i]),
            .overflow(),
            .underflow()
        );
    end
endgenerate
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : adder_fwd_sum_u_q
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        adder_sum_u_q
        (
            .a(_add_in_a_sum_u_q[i]),
            .b(_add_in_b_sum_u_q[i]),
            .c(_add_out_sum_u_q[i]),
            .overflow(overflow_sum_u_q[i]),
            .underflow(underflow_sum_u_q[i])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : adder_bwd_grad_reg_q
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        adder_grad_reg_q
        (
            .a(_add_in_a_grad_reg_q[i]),
            .b(_add_in_b_grad_reg_q[i]),
            .c(_add_out_grad_reg_q[i]),
            .overflow(overflow_grad_reg_q[i]),
            .underflow(underflow_grad_reg_q[i])
        );
    end
endgenerate


weighted_sum_memory
#(
)
weighted_mem
(
    // clock
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft),
    .rst_n_hop(rst_n_hop),
    // input
    .en_mem_w(en_mem_w_weighted_mem),
    .en_fwd_path(en_fwd_path_weighted_mem),
    .en_bwd_path(en_bwd_path_weighted_mem),
    .en_bwd_path_grad(en_bwd_path_grad_weighted_mem),
    .din_mem(din_mem_weighted_mem),
    .din_weight(din_weight_weighted_mem_flat),
    .gin(grad_in_weighted_mem),
    .ain_bwd_path_grad(addr_in_bwd_path_grad_weighted_mem),
    .done_bwd_path_grad(done_bwd_path_grad_weighted_mem),
    .hop(hop),
    // output
    .done_mem_w(done_mem_w_weighted_mem),
    .done_fwd_path(done_fwd_path_weighted_mem),
    .done_bwd_path(done_bwd_path_weighted_mem),
    .dout_weighted_sum(dout_weighted_sum_weighted_mem_flat),
    .gout_mat(gout_mat_weighted_mem_flat),
    .gout_vec(gout_vec_weighted_mem_flat),
    //debug
    .debug_out(debug_out_weighted_mem)
);

// fully connected with soft max
fully_connected_w_soft_max
#(
)
fc_w_sm
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_fc_w_sm),
    .rst_n_batch(rst_n_batch_fc_w_sm),
    // input
    .en_init_w(en_init_w_fc_w_sm),
    .data_in_init_w(data_out_w_init),
    .addr_in_init_w(addr_out_w_init),
    .en_fwd_path(en_fwd_path_fc_w_sm),
    .en_bwd_path(en_bwd_path_fc_w_sm),
    .en_bwd_path_w_up(en_bwd_path_w_up_fc_w_sm),
    .data_in(data_in_fc_w_sm),
    .grad_in(grad_in_fc_w_sm),
    .lr_l2(lr_l2_fc_w_sm),
    .din_exp_shift_bit(din_exp_shift_bit_fc_w_sm),
    .idx_task(0),
    // output
    .data_out(data_out_fc_w_sm_flat),
    .grad_out(grad_out_fc_w_sm_flat),
    .done_init_w(done_init_w_fc_w_sm),
    .done_fwd_path(done_fwd_path_fc_w_sm),
    .done_bwd_path(done_bwd_path_fc_w_sm),
    .done_bwd_path_w_up(_done_bwd_path_w_up_fc_w_sm),
    // debug
    .debug_out(debug_out_fc_w_sm)
);


// fully connected 
fully_connected
#(
    .BW_DIM_OUT(`BW_DIM_EMB),
    .BW_DIM_IN(`BW_DIM_EMB)
)
fc
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    .rst_n_soft(rst_n_soft_fc),
    .rst_n_batch(rst_n_batch_fc),
    .rst_n_hop(rst_n_hop),
    // input
    .en_init_w(en_init_w_fc),
    .data_in_init_w(data_out_w_init),
    .addr_in_init_w(addr_out_w_init),
    .en_fwd_path(en_fwd_path_fc),
    .en_bwd_path(en_bwd_path_fc),
    .en_bwd_path_w_up(en_bwd_path_w_up_fc),
    .data_in(data_in_fc),
    .grad_in(grad_in_fc),
    .lr_l2(lr_l2_fc),
    .hop(hop),
    // output
    .data_out(data_out_fc_flat),
    .grad_out(grad_out_fc_flat),
    .done_init_w(done_init_w_fc),
    .done_fwd_path(done_fwd_path_fc),
    .done_bwd_path(done_bwd_path_fc),
    .done_bwd_path_w_up(_done_bwd_path_w_up_fc),
    //debug
    .debug_out(debug_out_fc)
);


/*
// addr mem
counter
#(
    .BW(BW_MEM_ADDR),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_mem
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_mem),
    // input
    .en(en_addr_mem),
    .en_hold_max(),
    // output
    .count(count_addr_mem),
    .done(done_addr_mem)
);
*/

//
cross_entropy
cost_cross_entropy
(
    // clock
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .en(en_bwd_path_cost),
    .ans_in(answer_one_hot),
    .inference_in(data_out_fc_w_sm_flat),
    // output
    .done(done_cross_entropy),
    .cost_out(cost_out_cross_entropy),
    .grad_out(grad_out_cross_entropy_flat)
);

// fwd path controller
memory_network_fwd_path_controller
#(
)
fwd_path_controller
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .en_fwd_path(en_fwd_path&&!en_comp_result),    
    .done_fwd_path_attention(done_fwd_path_attention_mem),
    .done_fwd_path_weighted_sum(done_fwd_path_weighted_mem),
    .done_fwd_path_fc(done_fwd_path_fc),
    .done_fwd_path_sum_u_q(done_fwd_path_sum_u_q),
    .done_fwd_path_fc_w_sm(done_fwd_path_fc_w_sm),
    .done_fwd_path_soft_max(1'b0),
    .done_fwd_path_count_hop(done_fwd_path_count_hop),
    // output
    .en_fwd_path_attention(en_fwd_path_attention),
    .en_fwd_path_weighted_sum(en_fwd_path_weighted_mem),
    .en_fwd_path_sum_u_q(en_fwd_path_sum_u_q),
    .en_fwd_path_fc_w_sm(en_fwd_path_fc_w_sm),
    .en_fwd_path_soft_max(en_fwd_path_soft_max),
    .en_fwd_path_end(en_fwd_path_end),
    .en_fwd_path_count_hop(en_fwd_path_count_hop)
);



// bwd_path_controller
`ifdef INFER_ONLY_MODE
    memory_network_bwd_path_controller
    bwd_path_controller
    (
        // clock
        .clk(1'b0),
        // rst_n
        .rst_n(1'b0),
        // input
        .en_bwd_path(1'b0),
        .done_bwd_path_cost(1'b0),
        .done_bwd_path_fc_w_sm(1'b0),
        .done_bwd_path_weighted_sum(1'b0),
        .done_bwd_path_attention(1'b0),
        .done_bwd_path_fc(1'b0),
        .done_bwd_path_emb(1'b0),
        .done_bwd_path_w_up(1'b0),
        .done_bwd_path_count_hop(1'b0),

        // output
        .en_bwd_path_cost(en_bwd_path_cost),
        .en_bwd_path_fc_w_sm(en_bwd_path_fc_w_sm),
        .en_bwd_path_weighted_sum(en_bwd_path_weighted_mem),
        .en_bwd_path_attention(en_bwd_path_attention),
        .en_bwd_path_emb(en_bwd_path_emb),
        .en_bwd_path_w_up(en_bwd_path_w_up),
        .en_bwd_path_end(en_bwd_path_end),
        .en_bwd_path_count_hop(en_bwd_path_count_hop)
    );
`else
    memory_network_bwd_path_controller
    bwd_path_controller
    (
        // clock
        .clk(clk),
        // rst_n
        .rst_n(rst_n),
        // input
        .en_bwd_path(en_bwd_path),
        .done_bwd_path_cost(done_bwd_path_cost),
        .done_bwd_path_fc_w_sm(done_bwd_path_fc_w_sm),
        .done_bwd_path_weighted_sum(done_bwd_path_weighted_mem),
        .done_bwd_path_attention(done_bwd_path_attention),
        .done_bwd_path_fc(done_bwd_path_fc),
        .done_bwd_path_emb(done_bwd_path_emb),
        .done_bwd_path_w_up(done_bwd_path_w_up),
        .done_bwd_path_count_hop(done_bwd_path_count_hop),

        // output
        .en_bwd_path_cost(en_bwd_path_cost),
        .en_bwd_path_fc_w_sm(en_bwd_path_fc_w_sm),
        .en_bwd_path_weighted_sum(en_bwd_path_weighted_mem),
        .en_bwd_path_attention(en_bwd_path_attention),
        .en_bwd_path_emb(en_bwd_path_emb),
        .en_bwd_path_w_up(en_bwd_path_w_up),
        .en_bwd_path_end(en_bwd_path_end),
        .en_bwd_path_count_hop(en_bwd_path_count_hop)
    );
`endif

counter
#(
    .BW(BW_HOP),
    .COUNT_VALUE(NUM_HOP-1)
)
count_hop
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n_count_hop),
    // input
    .en(en_count_hop),
    .en_hold_max(1'b0),
    // output
    .count(count_count_hop),
    .done(done_count_hop)
);



w_init
w_init_i
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .en_w_init(we_w_init),
    .data_in(data_w_init),
    .addr_in(addr_w_init),

    // output
    .en_w_init_emb_a(en_w_init_emb_a),
    .en_w_init_emb_c(en_w_init_emb_c),
    .en_w_init_emb_q(en_w_init_emb_q),
    .en_w_init_fc(en_w_init_fc),
    .en_w_init_fc_w_sm(en_w_init_fc_w_sm),
    .data_out(data_out_w_init),
    .addr_out(addr_out_w_init)

);

////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////
`ifdef DEBUG

reg test_pass;

//always@(negedge en_fwd_path_end or negedge rst_n)
always@(negedge en_latch_result or negedge rst_n)
begin
    if(rst_n==1'b0)
        test_pass <= 1'b1;
    else
    begin
        //if(max_ind == reg_answer_vec)
        if(max_ind == reg_answer_ind)
            test_pass <= 1'b1;
        else
            test_pass <= 1'b0;
    end
end

wire [16-1:0] num_sample;
wire [16-1:0] num_pass;

reg en_count_pass;
reg en_fwd_path_end_delayed;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path_end_delayed <= 1'b0;
    else
        //en_fwd_path_end_delayed <= en_fwd_path_end;
        en_fwd_path_end_delayed <= en_latch_result;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_count_pass <= 1'b0;
    else
        en_count_pass <= en_fwd_path_end_delayed && test_pass;
end

counter
#(
    .BW(16),
    .COUNT_VALUE(1024*16)
)
count_num_sample
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    //.en(en_fwd_path_end),
    .en(en_latch_result),
    .en_hold_max(1'b0),
    // output
    .count(num_sample)
);

counter
#(
    .BW(16),
    .COUNT_VALUE(1024*16)
)
count_num_pass
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .en(en_count_pass),
    .en_hold_max(1'b0),
    // output
    .count(num_pass)
);

/*
`ifdef DEBUG_ILA
// ila
ila
ila_memn2n
(
    .clk(clk),

    // 1 bit
    .probe0(rb_n),
    .probe1(en),
    .probe2(en_init),
    .probe3(rst_n),
    .probe4(done_init),
    .probe5(done),
    .probe6(_en ),
    .probe7(),

    // 1 bit
    .probe8(en_fwd_path_emb_a),
    .probe9(en_fwd_path_emb_c),
    .probe10(en_fwd_path_emb_q),
    .probe11(en_answer),
    .probe12(),
    .probe13(),
    .probe14(),
    .probe15(),

    // 16 bit
    .probe16(data_in),
    .probe17(data_out),
    .probe18(num_sample),
    .probe19(num_pass),
    .probe20(reg_lr_l2),
    .probe21(reg_din_exp_shift_bit),
    .probe22(),
    .probe23(),

    // 32 bit
    .probe24(overflow_sum_u_q),
    .probe25(overflow_grad_reg_q),
    .probe26(underflow_sum_u_q),
    .probe27(underflow_grad_reg_q),
    .probe28(),
    .probe29(),
    .probe30(),
    .probe31(),

    // 1 bit
    // fwd path controller
    .probe32(en_fwd_path&&!en_comp_result),
    .probe33(done_fwd_path_attention_mem),
    .probe34(done_fwd_path_weighted_mem),
    .probe35(done_fwd_path_sum_u_q),
    .probe36(done_fwd_path_fc_w_sm),
    .probe37(done_fwd_path_count_hop),
    .probe38(en_fwd_path_attention),
    .probe39(en_fwd_path_weighted_mem),

    // 1 bit
    .probe40(en_fwd_path_sum_u_q),
    .probe41(en_fwd_path_fc_w_sm),
    .probe42(en_fwd_path_soft_max),
    .probe43(en_fwd_path_end),
    .probe44(en_fwd_path_count_hop),
    // bwd path controller
    .probe45(en_bwd_path),
    .probe46(done_bwd_path_cost),
    .probe47(done_bwd_path_fc_w_sm),

    // 1 bit
    .probe48(done_bwd_path_weighted_mem),
    .probe49(done_bwd_path_attention),
    .probe50(done_bwd_path_emb),
    .probe51(done_bwd_path_w_up),
    .probe52(done_bwd_path_count_hop),
    .probe53(en_bwd_path_cost),
    .probe54(en_bwd_path_fc_w_sm),
    .probe55(en_bwd_path_weighted_mem),

    // 1 bit
    .probe56(en_bwd_path_attention),
    .probe57(en_bwd_path_emb),
    .probe58(en_bwd_path_w_up),
    .probe59(en_bwd_path_end),
    .probe60(en_bwd_path_count_hop),
    .probe61(done_fwd_path_fc),
    .probe62(),
    .probe63()
);
`endif  // DEBUG_ILA
*/

`ifdef DEBUG_LIG
// ila
ila
ila_memn2n
(
    .clk(clk),

    // 1 bit
    .probe0(done_bwd_path_weighted_mem),
    .probe1(done_bwd_path_attention),
    .probe2(done_bwd_path_emb),
    .probe3(done_bwd_path_w_up),
    .probe4(done_bwd_path_count_hop),
    .probe5(en_bwd_path_cost),
    .probe6(en_bwd_path_fc_w_sm),
    .probe7(en_bwd_path_weighted_mem),

    // 1 bit
    .probe8(en_bwd_path_attention),
    .probe9(en_bwd_path_emb),
    .probe10(en_bwd_path_w_up),
    .probe11(en_bwd_path_end),
    .probe12(en_bwd_path_count_hop),
    .probe13(done_fwd_path_fc),
    .probe14(done_bwd_path_cost),
    .probe15(done_bwd_path_fc_w_sm),

    // 16 bit
    .probe16(reg_lr_l2),
    .probe17(reg_din_exp_shift_bit),
    .probe18(overflow_sum_u_q[31:16]),
    .probe19(overflow_sum_u_q[15:0]),
    .probe20(overflow_grad_reg_q[31:16]),
    .probe21(overflow_grad_reg_q[15:0]),
    .probe22(addr_w_init),
    //.probe23(),

    // 32 bit
    .probe24(underflow_grad_reg_q),
    .probe25(underflow_sum_u_q),
    //.probe26(grad_in_emb_q[3]),
    .probe27(),
    //.probe28(grad_in_fc_w_sm[BW_DATA*3-1-:BW_DATA]),
    //.probe29(grad_in_weighted_mem[BW_DATA*3-1-:BW_DATA]),
    //.probe30(gin_attention_mem[BW_DATA*3-1-:BW_DATA]),
    //.probe31(_grad_sum_u_q[3]),

    // 1 bit
    .probe32(debug_out_emb_a[0]),
    .probe33(debug_out_emb_a[1]),
    .probe34(debug_out_emb_a[2]),
    .probe35(debug_out_emb_a[3]),
    .probe36(debug_out_emb_c[0]),
    .probe37(debug_out_emb_c[1]),
    .probe38(debug_out_emb_c[2]),
    .probe39(debug_out_emb_c[3]),

    // 1 bit
    .probe40(debug_out_emb_q[0]),
    .probe41(debug_out_emb_q[1]),
    .probe42(debug_out_emb_q[2]),
    .probe43(debug_out_emb_q[3]),
    .probe44(debug_out_attention_mem[0]),
    .probe45(debug_out_attention_mem[1]),
    .probe46(debug_out_attention_mem[2]),
    .probe47(debug_out_attention_mem[3]),

    // 1 bit
    .probe48(debug_out_attention_mem[4]),
    .probe49(debug_out_attention_mem[5]),
    .probe50(debug_out_attention_mem[6]),
    .probe51(debug_out_attention_mem[7]),
    .probe52(debug_out_fc[0]),
    .probe53(debug_out_fc[1]),
    .probe54(debug_out_fc[2]),
    .probe55(debug_out_fc[3]),

    /*
    // 1 bit
    .probe56(debug_out_weighted_mem[0]),
    .probe57(debug_out_weighted_mem[1]),
    .probe58(debug_out_fc_w_sm[0]),
    .probe59(debug_out_fc_w_sm[1]),
    .probe60(debug_out_fc_w_sm[2]),
    .probe61(debug_out_fc_w_sm[3]),
    .probe62(debug_out_fc_w_sm[4]),
    .probe63(debug_out_fc_w_sm[5])

    */

    // 1 bit
    .probe56(rb_n),
    .probe57(en),
    .probe58(en_w_init),
    .probe59(rst_n),
    .probe60(en_fwd_path_emb_a),
    .probe61(en_fwd_path_emb_c),
    .probe62(en_fwd_path_emb_q),
    .probe63(en_answer)
);
`endif

`endif  // DEBUG

endmodule
