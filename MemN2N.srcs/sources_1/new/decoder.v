//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/03/31 17:03:08
// Design Name: 
// Module Name: decoder
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

module decoder
(
    // input
    //type_code,
    data_in,
    // output
    t_train,
    t_sentence,
    t_sentence_done,
    t_question,
    t_question_done,
    t_answer
    //t_answer_done
);

// parameter
parameter BW_DATA_IN = `BW_DATA_IN;
parameter BW_TRAIN = `BW_TRAIN;
parameter BW_TYPE = `BW_TYPE;
parameter BW_TYPE_CODE = `BW_TYPE_CODE;

parameter TYPE_CODE_TRAIN = `TYPE_CODE_TRAIN;
parameter TYPE_CODE_TEST = `TYPE_CODE_TEST;
parameter TYPE_CODE_SENTENCE = `TYPE_CODE_SENTENCE;
parameter TYPE_CODE_SENTENCE_DONE = `TYPE_CODE_SENTENCE_DONE;
parameter TYPE_CODE_QUESTION = `TYPE_CODE_QUESTION;
parameter TYPE_CODE_QUESTION_DONE = `TYPE_CODE_QUESTION_DONE;
parameter TYPE_CODE_ANSWER = `TYPE_CODE_ANSWER;
//parameter TYPE_CODE_ANSWER_DONE = `TYPE_CODE_ANSWER_DONE;



// input
//input wire [BW_TYPE_CODE-1:0] type_code;
input wire [BW_DATA_IN-1:0] data_in;
    
// output
output wire t_train;
output wire t_sentence;
output wire t_sentence_done;
output wire t_question;
output wire t_question_done;
output wire t_answer;
//output wire t_answer_done;

//
wire [BW_TYPE_CODE-1:0] type_code;

wire f_init_data_in;

//wire [BW_TRAIN-1:0] type_train;
wire type_train;
wire [BW_TYPE-1:0] type_input;


//
assign type_code = data_in[`RANGE_TYPE_CODE];
assign f_init_data_in = (data_in == {BW_DATA_IN{1'b0}}) ? 1'b1 : 1'b0;

assign type_train = type_code[BW_TYPE_CODE-1];
assign type_input = type_code[BW_TYPE-1:0];

//assign t_train = (type_train == TYPE_CODE_TRAIN) ? 1'b1 : 1'b0;

/*
assign t_train = type_train;

assign t_sentence = (type_input == TYPE_CODE_SENTENCE) ? 1'b1 : 1'b0;
assign t_sentence_done = (type_input == TYPE_CODE_SENTENCE_DONE) ? 1'b1 : 1'b0;
assign t_question = (type_input == TYPE_CODE_QUESTION) ? 1'b1 : 1'b0;
assign t_question_done = (type_input == TYPE_CODE_QUESTION_DONE) ? 1'b1 : 1'b0;
assign t_answer = (type_input == TYPE_CODE_ANSWER)||(type_input == TYPE_CODE_ANSWER_DONE) ? 1'b1 : 1'b0;
assign t_answer_done = t_answer;
*/

assign t_train = type_train && !f_init_data_in;

assign t_sentence = (type_input == TYPE_CODE_SENTENCE) ? !f_init_data_in : 1'b0;
assign t_sentence_done = (type_input == TYPE_CODE_SENTENCE_DONE) ? !f_init_data_in : 1'b0;
assign t_question = (type_input == TYPE_CODE_QUESTION) ? !f_init_data_in : 1'b0;
assign t_question_done = (type_input == TYPE_CODE_QUESTION_DONE) ? !f_init_data_in : 1'b0;
//assign t_answer = (type_input == TYPE_CODE_ANSWER)||(type_input == TYPE_CODE_ANSWER_DONE) ? !f_init_data_in : 1'b0;
assign t_answer = (type_input == TYPE_CODE_ANSWER) ? !f_init_data_in : 1'b0;
//assign t_answer_done = t_answer && !f_init_data_in ;


endmodule
