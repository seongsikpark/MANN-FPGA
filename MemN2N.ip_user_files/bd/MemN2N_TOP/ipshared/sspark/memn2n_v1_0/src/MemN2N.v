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
    data_in,
    
    // output
    data_out
);
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
output wire [DIM_IN-1:0] data_out;


//
wire [BW_DATA*DIM_EMB-1:0] data_mem_a;
wire [BW_DATA*DIM_EMB-1:0] data_mem_c;


reg [BW_DATA*DIM_EMB-1:0] reg_emb_q;

// answer
reg [BW_WORD_VEC-1:0] reg_answer_vec;
reg [BW_DATA*BW_WORD_VEC-1:0] reg_answer_fixed;
wire en_answer;
reg en_answer_sync;



reg we_sen_sync;
reg we_query_sync;


wire f_w_up_emb_a;
wire f_w_up_emb_q;


genvar i;

//
wire [BW_WORD_VEC-1:0] word_vec;
wire [BW_TYPE_CODE-1:0] type_code;

wire t_sentence;
wire t_sentence_done;
wire t_question;
wire t_question_done;
wire t_answer;
wire t_answer_done;



//



reg mode_query;
wire done_mode_query;

reg mode_query_sync;

wire enable_phase_controller;
reg done_phase_phase_controller;



wire [`NUM_PHASE-1:0] memn2n_phase_phase_controller;

reg en_addr_mem_query;

wire we_mem_c;
wire [BW_MEM_ADDR-1:0] addr_mem_c;

// number of memory entity used 
reg [BW_MEM_ADDR:0] num_mem;

// emb a
wire en_init_w_emb_a;
wire en_fwd_path_emb_a;
wire en_bwd_path_emb_a;
wire [BW_WORD_VEC-1:0] data_in_emb_a;
//grad_in_emb_a;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_a;
//grad_out_emb_a;
wire done_init_w_emb_a;
wire done_fwd_path_emb_a;
wire done_bwd_path_emb_a;


// emb c
wire en_init_w_emb_c;
wire en_fwd_path_emb_c;
wire en_bwd_path_emb_c;
wire [BW_WORD_VEC-1:0] data_in_emb_c;
//grad_in_emb_c;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_c;
//grad_out_emb_c;
wire done_init_w_emb_c;
wire done_fwd_path_emb_c;
wire done_bwd_path_emb_c;


// emb q
wire en_init_w_emb_q;
wire en_fwd_path_emb_q;
wire en_bwd_path_emb_q;
wire [BW_WORD_VEC-1:0] data_in_emb_q;
//grad_in_emb_q;

wire [BW_DATA*DIM_EMB-1:0] data_out_emb_q;
//grad_out_emb_q;
wire done_init_w_emb_q;
wire done_fwd_path_emb_q;
wire done_bwd_path_emb_q;

reg rst_n_buf_out_emb_a;
reg rst_n_buf_out_emb_c;
reg rst_n_buf_out_emb_q;

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

wire [BW_DATA*NUM_MEM-1:0] dout_attention_attention_mem;

// weighted sum
reg [BW_DATA*DIM_EMB-1:0] reg_weighted_sum;
wire [BW_DATA*DIM_EMB-1:0] _reg_weighted_sum;
reg en_fwd_path_weighted_sum_sync;
wire en_weighted_sum;

// addr mem 
reg en_addr_mem;
wire [BW_MEM_ADDR-1:0] count_addr_mem;
wire done_addr_mem;
wire rst_n_addr_mem;


// sum_u_q
reg [BW_DATA*DIM_EMB-1:0] reg_sum_u_q;
wire [BW_DATA*DIM_EMB-1:0] _reg_sum_u_q;


// fully connected with soft max
wire en_init_w_fc_w_sm;
wire en_fwd_path_fc_w_sm;
wire en_bwd_path_fc_w_sm;

wire [BW_DATA*DIM_IN-1:0] data_out_fc_w_sm;
wire done_init_w_fc_w_sm;
wire done_fwd_path_fc_w_sm;
wire done_bwd_path_fc_w_sm;


// phase controller
reg done_emb_q;
reg done_a;

reg en_fwd_path;

reg done_fwd_path_weighted_sum;
reg done_fwd_path_sum_u_q;
//reg done_fwd_path_fc_w_sm;

wire en_fwd_path_attention;
wire en_fwd_path_weighted_sum;
wire en_fwd_path_sum_u_q;
wire en_fwd_path_fully_connected;
wire en_fwd_path_soft_max;
wire en_fwd_path_end;



wire done_fwd_question;

//
/*
always@(posedge en or negedge rst_n or posedge done_mode_query)
begin
    if(rst_n==1'b0 || done_mode_query==1'b1)
        mode_query <= 1'b0;
    else
        if(we_query==1'b1)
            mode_query<= 1'b1;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        mode_query_sync <= 1'b0;
    else
        mode_query_sync <= mode_query;
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
    if(rst_n==1'b0 || en_answer_sync ==1'b1)
        en_answer_sync <= 1'b0;
    else
        if(en_answer_sync ==1'b0)
            en_answer_sync <= en_answer;
end


// reg emb question
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_emb_q <= 'b0;    
    else
        if(done_fwd_question==1'b1)
            reg_emb_q <= data_out_emb_q;
end

// reg answer
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_answer_vec <= 'b0;
    else
        if(en_answer_sync==1'b1)
            reg_answer_vec <= word_vec;
end

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

// for phase controll
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_emb_q <= 1'b0;
    else
        if(done_fwd_question==1'b1)
            done_emb_q <= done_fwd_path_emb_q;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_a <= 1'b0;
    else
        if(en_answer_sync==1'b1)
            done_a <= en_answer_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_fwd_path <= 1'b0;
    else
        en_fwd_path <= done_emb_q && done_a;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        num_mem <= 'b0;
    else
        if(en_fwd_path==1'b0)
            num_mem <= aout_mem_attention_mem;
end




assign en_fwd_path_emb_a = en && (t_sentence||t_sentence_done);
assign en_fwd_path_emb_c = en && (t_sentence||t_sentence_done);
assign en_fwd_path_emb_q = en && (t_question||t_question_done);
assign en_answer = en && t_answer;


// en init weight
assign en_init_w_emb_a = en_init;
assign en_init_w_emb_c = en_init;
assign en_init_w_emb_q = en_init;
assign en_init_w_fc_w_sm = en_init;

// temporary -> f_w_up should follow by end of back propagation
assign f_w_up_emb_a = f_w_up;
assign f_w_up_emb_q = f_w_up;

assign rst_n_addr_mem = rst_n;

//
assign enable_phase_controller = mode_query_sync;




//
assign word_vec = data_in[`RANGE_WORD_VEC];
assign type_code = data_in[`RANGE_TYPE_CODE];

// attention memory
assign en_mem_w_attention_mem = done_fwd_path_emb_a && t_sentence_done;
assign din_mem_attention_mem = data_out_emb_a;
assign din_question_attention_mem = reg_emb_q;

assign en_fwd_path_attention_mem = en_fwd_path_attention;
assign en_bwd_path_attention_mem = 1'b0;

// mem_c
assign data_mem_c = (we_mem_c==1'b1)? data_out_emb_c :'bz;
assign we_mem_c = we_mem_attention_mem;
assign addr_mem_c = (en_fwd_path==1'b0)? aout_mem_attention_mem : count_addr_mem;


// tmp for test data out
generate
    for(i=0;i<DIM_IN;i=i+1)
    begin : d_out
        assign data_out[i] = data_out_fc_w_sm[(i+1)*BW_DATA-1];
    end
endgenerate

assign done_fwd_question = done_fwd_path_emb_q&&t_question_done;


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
    .t_sentence_done(t_sentence_done),
    .t_question(t_question),
    .t_question_done(t_question_done),
    .t_answer(t_answer),
    .t_answer_done(t_answer_done)
);


/*
assign data_in_emb_a = (en_fwd_path_emb_a==1'b1)? word_vec : 'bz;
assign data_in_emb_c = (en_fwd_path_emb_c==1'b1)? word_vec : 'bz;
assign data_in_emb_q = (en_fwd_path_emb_q==1'b1)? word_vec : 'bz;
*/

assign data_in_emb_a = word_vec;
assign data_in_emb_c = word_vec;
assign data_in_emb_q = word_vec;

assign en_bwd_path_emb_a = 1'b0;    // tmp
assign en_bwd_path_emb_c = 1'b0;    // tmp
assign en_bwd_path_emb_q = 1'b0;    // tmp

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_buf_out_emb_a <= 1'b0;
    else
        rst_n_buf_out_emb_a <= !done_mem_w_attention_mem;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_buf_out_emb_c <= 1'b0;
    else
        rst_n_buf_out_emb_c <= !we_mem_c;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        rst_n_buf_out_emb_q <= 1'b0;
    else
        rst_n_buf_out_emb_q <= !done_fwd_question;
end





//
MemN2N_emb
#(
    .BW_DIM_IN(BW_WORD_VEC)
)
emb_a
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_buf_out(rst_n_buf_out_emb_a),
    // input,
    .en_init_w(en_init_w_emb_a),
    .en_fwd_path(en_fwd_path_emb_a),
    .en_bwd_path(en_bwd_path_emb_a),
    .data_in(data_in_emb_a),
    .addr_in(data_in_emb_a),
    //.grad_in(grad_in_emb_a),      //tmp
    // output
    .data_out(data_out_emb_a),
    //.grad_out(grad_out_emb_a),    // tmp
    .done_init_w(done_init_w_emb_a),
    .done_fwd_path(done_fwd_path_emb_a),
    .done_bwd_path(done_bwd_path_emb_a)  
);

MemN2N_emb
#(
    .BW_DIM_IN(BW_WORD_VEC)
)
emb_c
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_buf_out(rst_n_buf_out_emb_c),
    // input,
    .en_init_w(en_init_w_emb_c),
    .en_fwd_path(en_fwd_path_emb_c),
    .en_bwd_path(en_bwd_path_emb_c),
    .data_in(data_in_emb_c),
    .addr_in(data_in_emb_c),
    //.grad_in(grad_in_emb_c),      //tmp
    // output
    .data_out(data_out_emb_c),
    //.grad_out(grad_out_emb_c),    // tmp
    .done_init_w(done_init_w_emb_c),
    .done_fwd_path(done_fwd_path_emb_c),
    .done_bwd_path(done_bwd_path_emb_c)  
);





//
MemN2N_emb
#(
    .BW_DIM_IN(BW_WORD_VEC)
)
emb_q
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    .rst_n_buf_out(rst_n_buf_out_emb_q),
    // input,
    .en_init_w(en_init_w_emb_q),
    .en_fwd_path(en_fwd_path_emb_q),
    .en_bwd_path(en_bwd_path_emb_q),
    .data_in(data_in_emb_q),
    .addr_in(data_in_emb_q),
    //.grad_in(grad_in_emb_q),      //tmp
    // output
    .data_out(data_out_emb_q),
    //.grad_out(grad_out_emb_q),    // tmp
    .done_init_w(done_init_w_emb_q),
    .done_fwd_path(done_fwd_path_emb_q),
    .done_bwd_path(done_bwd_path_emb_q)  
);



ram_sync
#(
    .BW_DATA(BW_MEM_DATA),
    .BW_ADDR(BW_MEM_ADDR)
)
mem_c
(
    // clk
    .clk(clk),
    // reset_n
    .rst_n(rst_n),
    // input
    .addr(addr_mem_c),
    .oe(!we_mem_c),
    .we(we_mem_c),
    // inout
    .data(data_mem_c)
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
    // input
    .en_mem_w(en_mem_w_attention_mem),
    .en_fwd_path(en_fwd_path_attention_mem),
    .en_bwd_path(en_bwd_path_attention_mem),
    .din_mem(din_mem_attention_mem),
    .din_question(din_question_attention_mem),

    // output
    .done_mem_w(done_mem_w_attention_mem),
    .done_fwd_path(done_fwd_path_attention_mem),
    .done_bwd_path(done_bwd_path_attention_mem),
    .we_mem(we_mem_attention_mem),
    .aout_mem(aout_mem_attention_mem),
    .dout_attention(dout_attention_attention_mem)
);

// weighted sum 
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path_weighted_sum==1'b1)
        en_fwd_path_weighted_sum_sync <= 1'b0;
    else
        if(en_fwd_path_weighted_sum==1'b1)
            en_fwd_path_weighted_sum_sync <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path_weighted_sum <= 1'b0;
    else
        if((en_fwd_path==1'b1)&&(num_mem-1==count_addr_mem))
            done_fwd_path_weighted_sum <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path_weighted_sum==1'b1)
        en_addr_mem <= 1'b0;
    else
        if(en_fwd_path_weighted_sum==1'b1)
            en_addr_mem <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_weighted_sum <= 'b0;
    else
        if(en_fwd_path_weighted_sum_sync==1'b1)
            reg_weighted_sum <= _reg_weighted_sum;
end

assign en_weighted_sum = en_fwd_path_weighted_sum_sync && !done_fwd_path_weighted_sum;

// sum u q
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path_sum_u_q <= 1'b0;
    else
        done_fwd_path_sum_u_q <= en_fwd_path_sum_u_q;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path_fc_w_sm <= 1'b0;
    else
        done_fwd_path_fc_w_sm <= ;
end
*/


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_sum_u_q <= 'b0;
    else
        if(en_fwd_path_sum_u_q==1'b1)
            reg_sum_u_q <= _reg_sum_u_q;
end

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
            .a(reg_emb_q[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(reg_weighted_sum[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(_reg_sum_u_q[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

//
accumulator_fixed
#(
)
weighted_sum
(
    .clk(clk),
    .rst_n(rst_n),
    .enable(en_weighted_sum),
    .din_a(data_mem_c),
    .din_b(dout_attention_attention_mem),
    .dout(_reg_weighted_sum)
);


// tmp
assign en_fwd_path_fc_w_sm = en_fwd_path_fully_connected;
assign en_bwd_path_fc_w_sm = 1'b0;


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
    // input
    .en_init_w(en_init_w_fc_w_sm),
    .en_fwd_path(en_fwd_path_fc_w_sm),
    .en_bwd_path(en_bwd_path_fc_w_sm),
    .data_in(reg_sum_u_q),
    .grad_in(),
    // output
    .data_out(data_out_fc_w_sm),
    .grad_out(),
    .done_init_w(done_init_w_fc_w_sm),
    .done_fwd_path(done_fwd_path_fc_w_sm),
    .done_bwd_path(done_bwd_path_fc_w_sm)
);



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



// fwd path controller
MemN2N_fwd_path_controller
#(
)
fwd_path_controller
(
    // clock
    .clk(clk),
    // rst_n
    .rst_n(rst_n),
    // input
    .en_fwd_path(en_fwd_path),    
    .done_fwd_path_attention(done_fwd_path_attention_mem),
    .done_fwd_path_weighted_sum(done_fwd_path_weighted_sum),
    .done_fwd_path_sum_u_q(done_fwd_path_sum_u_q),
    .done_fwd_path_fully_connected(done_fwd_path_fc_w_sm),
    .done_fwd_path_soft_max(),
    // output
    .en_fwd_path_attention(en_fwd_path_attention),
    .en_fwd_path_weighted_sum(en_fwd_path_weighted_sum),
    .en_fwd_path_sum_u_q(en_fwd_path_sum_u_q),
    .en_fwd_path_fully_connected(en_fwd_path_fully_connected),
    .en_fwd_path_soft_max(en_fwd_path_soft_max),
    .en_fwd_path_end(en_fwd_path_end)
);


endmodule
