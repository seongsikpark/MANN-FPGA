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
    // rst
    rst,
    // input
    type_code,
    // output
    t_sentence,
    t_sentence_done,
    t_question,
    t_question_done,
    t_answer,
    t_answer_done
);

// parameter
parameter BW_TYPE_CODE = `BW_TYPE_CODE;
parameter TYPE_CODE_SENTENCE = `TYPE_CODE_SENTENCE;
parameter TYPE_CODE_SENTENCE_DONE = `TYPE_CODE_SENTENCE_DONE;
parameter TYPE_CODE_QUESTION = `TYPE_CODE_QUESTION;
parameter TYPE_CODE_QUESTION_DONE = `TYPE_CODE_QUESTION_DONE;
parameter TYPE_CODE_ANSWER = `TYPE_CODE_ANSWER;


// rst
input wire rst;

// input
input wire [BW_TYPE_CODE-1:0] type_code;
    
// output
output wire t_sentence;
output wire t_sentence_done;
output wire t_question;
output wire t_question_done;
output wire t_answer;
output wire t_answer_done;

assign t_sentence = (type_code == TYPE_CODE_SENTENCE) ? 1'b1 : 1'b0;
assign t_sentence_done = (type_code == TYPE_CODE_SENTENCE_DONE) ? 1'b1 : 1'b0;
assign t_question = (type_code == TYPE_CODE_QUESTION) ? 1'b1 : 1'b0;
assign t_question_done = (type_code == TYPE_CODE_QUESTION_DONE) ? 1'b1 : 1'b0;
assign t_answer = (type_code == TYPE_CODE_ANSWER) ? 1'b1 : 1'b0;
assign t_answer_done = t_answer;


endmodule
