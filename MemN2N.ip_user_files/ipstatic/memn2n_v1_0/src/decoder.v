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
    t_question,
    t_answer
);

// parameter
parameter BW_TYPE_CODE = `BW_TYPE_CODE;
parameter TYPE_CODE_SENTENCE = `TYPE_CODE_SENTENCE;
parameter TYPE_CODE_QUESTION = `TYPE_CODE_QUESTION;
parameter TYPE_CODE_ANSWER = `TYPE_CODE_ANSWER;

// rst
input wire rst;

// input
input wire [BW_TYPE_CODE-1:0] type_code;
    
// output
output wire t_sentence;
output wire t_question;
output wire t_answer;

assign t_sentence = (type_code == TYPE_CODE_SENTENCE) ? 1'b1 : 1'b0;
assign t_question = (type_code == TYPE_CODE_QUESTION) ? 1'b1 : 1'b0;
assign t_answer = (type_code == TYPE_CODE_ANSWER) ? 1'b1 : 1'b0;


endmodule
