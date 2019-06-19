//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/01/29 16:08:24
// Design Name: 
// Module Name: MemN2N
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

module MemN2N
(
    // clock
    clk,
    // reset_n
    rst_n,
    // input
    en,
    en_init,
    f_w_up,
    we_sen,
    we_query,
    data_in
    
    // output
);
parameter BW_DATA_IN = `BW_DATA_IN;

parameter BW_DIM_IN = `BW_DIM_IN;
parameter BW_DIM_EMB = `BW_DIM_EMB;

parameter DIM_IN = BW_DIM_IN;
parameter DIM_EMB = 1<<BW_DIM_EMB;

parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter NUM_MEM = `NUM_MEM;

parameter BW_COUNTER_IN = BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_COUNTER_IN) - 1;

parameter BW_WORD_VEC = `BW_WORD_VEC;
parameter BW_TYPE_CODE = `BW_TYPE_CODE;



// clock
input wire clk;
// reset_n
input wire rst_n;
// input
input wire en;
input wire en_init;
input wire f_w_up;
input wire we_sen;
input wire we_query;

input wire [BW_DATA_IN-1:0] data_in;
// output


//
wire [BW_DATA*DIM_EMB-1:0] data_mem_a;
wire [BW_DATA*DIM_EMB-1:0] data_out_emb_a;
wire [BW_DATA*DIM_EMB-1:0] data_out_emb_q;


reg [BW_DATA*DIM_EMB-1:0] emb_q;

// answer
reg [BW_WORD_VEC-1:0] reg_answer;
wire en_answer;


wire done_data_out_emb_a;
wire we_mem;

reg clk_addr_mem;
wire en_addr_mem;
wire [BW_COUNTER_IN-1:0] count_addr_mem;
wire done_addr_mem;

reg we_sen_sync;
reg we_query_sync;

wire en_init_w_emb_a;
wire en_init_w_emb_q;

wire f_w_up_emb_a;
wire f_w_up_emb_q;

wire rst_n_addr_mem;

genvar i;

//
wire [BW_WORD_VEC-1:0] word_vec;
wire [BW_TYPE_CODE-1:0] type_code;

wire t_sentence;
wire t_question;
wire t_answer;


//
wire [BW_DATA*DIM_EMB-1:0] input_a_mult_dim_emb;
wire [BW_DATA*DIM_EMB-1:0] input_b_mult_dim_emb;
wire [BW_DATA*DIM_EMB-1:0] output_c_mult_dim_emb;

reg [BW_DATA*NUM_MEM-1:0] weight_sentence;
wire [BW_DATA-1:0] _weight_sentence;


reg mode_query;
wire done_mode_query;

reg mode_query_sync;

wire enable_phase_controller;
reg done_phase_phase_controller;



wire [`NUM_PHASE-1:0] memn2n_phase_phase_controller;

//reg en_emb_q;
wire en_emb_q;
reg en_addr_mem_query;
reg en_up_weight_sentence;

//
always@(posedge en or negedge rst_n or posedge done_mode_query)
begin
    if(rst_n==1'b0 || done_mode_query==1'b1)
        mode_query <= 1'b0;
    else
        if(we_query==1'b1)
            mode_query<= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        mode_query_sync <= 1'b0;
    else
        mode_query_sync <= mode_query;
end

//
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        clk_addr_mem <= 1'b0;
    else
        clk_addr_mem <= done_data_out_emb_a;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_sen_sync <= 1'b0;
    else
        we_sen_sync <= we_sen;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_query_sync <= 1'b0;
    else
        we_query_sync <= we_query;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        emb_q <= 'b0;    
    else
        if(done_data_out_emb_q==1'b1)
            emb_q <= data_out_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        weight_sentence <= 'b0;
    else
        if(en_up_weight_sentence==1'b1)
            weight_sentence[count_addr_mem] <= _weight_sentence;
end

// reg answer
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer <= 'b0;
    else
        if(en_answer==1'b1)
            reg_answer <= word_vec;
end


//
/*
assign we_mem = we_sen_sync && done_data_out_emb_a;
assign data_mem_a = (we_mem==1'b0) ? 'bz : data_out_emb_a;

assign en_addr_mem = (we_sen_sync && done_data_out_emb_a) || (mode_query_sync && en_addr_mem_query);

assign en_emb_a = en && we_sen_sync;
*/


assign we_mem = t_sentence && done_data_out_emb_a;
assign data_mem_a = (we_mem==1'b0) ? 'bz : data_out_emb_a;

assign en_addr_mem = (t_sentence && done_data_out_emb_a) || (mode_query_sync && en_addr_mem_query);

assign en_emb_a = en && t_sentence;

assign en_emb_q = en && t_question;

assign en_answer = en && t_answer;



assign en_init_w_emb_a = en_init;
assign en_init_w_emb_q = en_init;

// temporary -> f_w_up should follow by end of back propagation
assign f_w_up_emb_a = f_w_up;
assign f_w_up_emb_q = f_w_up;

assign rst_n_addr_mem = rst_n;

//
assign enable_phase_controller = mode_query_sync;

assign input_a_mult_dim_emb = data_mem_a;
assign input_a_mult_dim_emb = emb_q;

assign _weight_sentence = output_c_mult_dim_emb;


//
assign word_vec = data_in[`RANGE_WORD_VEC];
assign type_code = data_in[`RANGE_TYPE_CODE];

// change controll method
/* 
// phase controll
always@(*)
begin
    done_phase_phase_controller <= 1'b0;
    en_emb_q <= 1'b0;
    en_addr_mem_query <= 1'b0;
    en_up_weight_sentence <= 1'b0;

    case(memn2n_phase_phase_controller)
        `PHASE_EMB_Q :
        begin
            en_emb_q <= 1'b1;
            done_phase_phase_controller <= done_data_out_emb_q;
        end
        `PHASE_DOT_PROD_MEM_EMB_Q :
        begin
            en_addr_mem_query <= 1'b1;
            en_up_weight_sentence <= 1'b1;
            done_phase_phase_controller <= done_addr_mem;
        end
    endcase
end
*/

// type decoder
decoder
#(
)
type_decoder
(
    // rst
    .rst(!rst_n),
    // input
    .type_code(type_code),
    // output
    .t_sentence(t_sentence),
    .t_question(t_question),
    .t_answer(t_answer)
);

//
MemN2N_emb
#(
    .BW_DIM_IN(BW_WORD_VEC)
)
MemN2N_emb_a
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input,
    .en(en_emb_a),
    .en_init_w(en_init_w_emb_a),
    .f_w_up(f_w_up_emb_a),
    .data_in(word_vec),
    .grad_in(),
    // output
    .data_out(data_out_emb_a),
    .grad_out(),
    .done_data_out(done_data_out_emb_a)
);


//
MemN2N_emb
#(
    .BW_DIM_IN(BW_WORD_VEC)
)
MemN2N_emb_q
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input,
    .en(en_emb_q),
    .en_init_w(en_init_w_emb_q),
    .f_w_up(f_w_up_emb_q),
    .data_in(word_vec),
    .grad_in(),
    // output
    .data_out(data_out_emb_q),
    .grad_out(),
    .done_data_out(done_data_out_emb_q)
);


//
ram_sync
#(
    .BW_DATA(BW_MEM_DATA),
    .BW_ADDR(BW_MEM_ADDR)
)
mem_a
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .addr(count_addr_mem),
    .oe(!we_mem),
    .we(we_mem),
    // inout
    .data(data_mem_a)
);

//
counter
#(
    .BW(BW_COUNTER_IN),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_mem
(
    // clk
    //.clk(clk_addr_mem),
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_mem),
    // input
    .en(en_addr_mem),
    // output
    .count(count_addr_mem),
    .done(done_addr_mem)
);



//
MemN2N_phase_controller
phase_controller
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .enable(enable_phase_controller),
    .done_phase(done_phase_phase_controller),
    // output
    .memn2n_phase(memn2n_phase_phase_controller)
);



generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        fixed_mult
        #(
            .WL(`BW_WL),
            .IWL(`BW_IWL)
        )
        mult_dim_emb
        (
            // input
            .a(input_a_mult_dim_emb[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(input_b_mult_dim_emb[(i+1)*BW_DATA-1-:BW_DATA]),
            // output
            .c(output_c_mult_dim_emb[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

endmodule
