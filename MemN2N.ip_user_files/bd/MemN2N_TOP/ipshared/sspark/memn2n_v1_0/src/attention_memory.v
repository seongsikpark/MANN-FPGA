//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/04/04 19:40:46
// Design Name: 
// Module Name: attention_memory
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

module attention_memory
(
    // clock
    clk,
    // reset_n
    rst_n,
    // input
    en_mem_w,
    en_fwd_path,
    en_bwd_path,
    din_mem,
    din_question,

    // output
    done_mem_w,
    done_fwd_path,
    done_bwd_path,
    we_mem,
    aout_mem,
    dout_attention
);

parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;
parameter BW_IWL_EXP = `BW_IWL_EXP;

parameter DIM_EMB = 1<<`BW_DIM_EMB;
parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_MEM_ADDR) - 1;
parameter NUM_MEM = `NUM_MEM;


// clock
input wire clk;

// reset_n
input wire rst_n;

// input
input wire en_mem_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire [BW_MEM_DATA-1:0] din_mem;
input wire [BW_MEM_DATA-1:0] din_question;

// output
output wire [BW_MEM_ADDR:0] aout_mem;
output wire we_mem;
output reg done_mem_w;
output wire done_fwd_path;
output reg done_bwd_path;

output reg [BW_DATA*NUM_MEM-1:0] dout_attention;

// internal
genvar i;

reg en_mem_w_sync;
reg en_fwd_path_sync;

reg [BW_MEM_ADDR-1:0] addr_mem_a;
wire [BW_MEM_DATA-1:0] data_mem_a;

wire [BW_MEM_DATA-1:0] question;

wire [BW_MEM_DATA-1:0] _reg_mult;

wire [BW_MEM_DATA/2-1:0] _tree_adder_1st;
wire [BW_MEM_DATA/4-1:0] _tree_adder_2nd;
wire [BW_MEM_DATA/8-1:0] _tree_adder_3rd;
wire [BW_MEM_DATA/16-1:0] _tree_adder_4th;

//reg [BW_MEM_ADDR-1:0] dout_addr;

wire rst_n_addr_mem;
wire en_addr_mem;
wire [BW_MEM_ADDR:0] count_addr_mem;
wire done_addr_mem;

wire rst_n_addr_dout;
wire en_addr_dout;
reg en_addr_dout_dot_product;
wire en_addr_dout_div;
//reg en_addr_dout_div;

wire [BW_MEM_ADDR-1:0] count_addr_dout;
wire done_addr_dout;

wire _done_dot_product;
reg done_dot_product;
reg done_exp;
reg done_norm_sum;
//wire [NUM_MEM-1:0] done_div;
wire done_div;
wire done_norm_div;

reg en_norm_div;
reg en_norm_div_init;

reg we_mem_a;


reg [BW_MEM_ADDR-1:0] addr_dout_attention_pre;
reg [BW_MEM_ADDR-1:0] addr_dout_attention;


reg [BW_MEM_ADDR-1:0] addr_exp;
reg [BW_MEM_ADDR-1:0] addr_sum_exp;



//reg [BW_DATA*NUM_MEM-1:0] reg_dot_product;
//reg [BW_DATA-1:0] reg_dot_product;
wire [BW_DATA-1:0] reg_dot_product;
reg [BW_DATA*NUM_MEM-1:0] reg_exp;

wire [BW_DATA-1:0] din_exp;
wire [BW_DATA-1:0] dout_exp;

reg [BW_DATA-1:0] reg_sum_exp;
wire [BW_DATA-1:0] _reg_sum_exp;


reg en_dot_product;
reg en_exp;

//reg en_norm_sum;
wire en_norm_sum;

/*
wire [BW_DATA-1:0] div_norm_q [0:NUM_MEM-1];
wire [BW_DATA-1:0] div_norm_f [0:NUM_MEM-1];
*/

wire [BW_DATA-1:0] div_norm_q;
wire [BW_DATA-1:0] div_norm_f;

reg [BW_DATA-1:0] _dout_attention;

wire we_dout;


// combinational logic
//assign addr_mem_a = count_addr_mem;

/*
always@(*)
begin
    case({en_mem_w_sync,en_fwd_path_sync,en_bwd_path})
        3'b100 :
        begin
            addr_mem_a = count_addr_mem[BW_MEM_ADDR-1:0];
        end
        3'b010 :
        begin
            addr_mem_a = count_addr_dout;
        end
        3'b001 :
        begin
            addr_mem_a = 'b0;
        end
        default
        begin
            addr_mem_a = 'b0;
        end
    endcase
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_mem_a <= 'b0;
    else
    begin
        case({en_mem_w_sync,en_fwd_path_sync,en_bwd_path})
            3'b100 :
            begin
                addr_mem_a <= count_addr_mem[BW_MEM_ADDR-1:0];
            end
            3'b010 :
            begin
                addr_mem_a <= count_addr_dout;
            end
            3'b001 :
            begin
                addr_mem_a <= 'b0;
            end
            default
            begin
                addr_mem_a <= 'b0;
            end
        endcase
    end
end





assign we_mem = we_mem_a;
//assign we_mem_a = en_mem_w_sync;
assign data_mem_a = (we_mem_a==1'b0) ? 'bz : din_mem;
assign question = din_question;



//assign addr_dout_attention = count_addr_dout;
//assign en_addr_dout = en_dot_product && !done_dot_product;


//assign dout_attention = reg_dot_product;

//assign din_exp = reg_dot_product [(addr_exp+1)*BW_DATA-1-:BW_DATA] >> (BW_IWL_EXP-BW_IWL);
assign din_exp = (reg_dot_product >> (BW_IWL_EXP-BW_IWL));

//assign din_exp = _tree_adder_4th;

assign _done_dot_product = (count_addr_mem-1==count_addr_dout) ? 1'b1 : 1'b0;


assign aout_mem = count_addr_mem;

//assign done_norm_div = done_div;
//assign done_norm_div = en_norm_div&&(count_addr_mem-1==count_addr_dout) ? 1'b1 : 1'b0;
//assign done_norm_div = en_norm_div&&(count_addr_mem-1==addr_dout_attention) ? 1'b1 : 1'b0;
assign done_norm_div = en_norm_div&&(count_addr_mem-1==addr_dout_attention) ? done_div : 1'b0;



// should modify later
assign rst_n_addr_mem = rst_n;
assign en_addr_mem = we_mem_a;

assign rst_n_addr_dout = rst_n && !(en_fwd_path_sync&&en_norm_div_init&&(!en_norm_div));


// sequence logic
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_mem_w ==1'b1)
        en_mem_w_sync <= 1'b0;
    else
        if(en_mem_w_sync==1'b0)
            en_mem_w_sync <= en_mem_w;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_mem_w==1'b1)
        we_mem_a <= 1'b0;
    else
        we_mem_a <= en_mem_w_sync;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        en_fwd_path_sync <= 1'b0;
    else
        if(en_fwd_path_sync==1'b0)
            en_fwd_path_sync <= en_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
//    if(rst_n==1'b0 || done_dot_product==1'b1 || _done_dot_product==1'b1)
    if(rst_n==1'b0 || done_dot_product==1'b1)
        en_addr_dout_dot_product <= 1'b0;
    else
        if(en_addr_dout_dot_product ==1'b0)
            en_addr_dout_dot_product <= en_fwd_path_sync;
end

//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&done_div;
//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&div_din_ready;

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_addr_dout_div <= 1'b0;
    else
        //en_addr_dout_div <= div_din_valid;
        en_addr_dout_div <= done_div;
end
*/

//assign en_addr_dout_div = en_fwd_path_sync&&en_norm_div&&done_div;

assign en_addr_dout_div = div_din_valid;

assign en_addr_dout = en_addr_dout_dot_product || en_addr_dout_div;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_dot_product==1'b1)
        en_dot_product <= 1'b0;
    else
        if(en_dot_product==1'b0)
            en_dot_product<=en_addr_dout_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_exp <= 1'b0;
    else
        en_exp <= en_dot_product;
end

assign en_norm_sum = en_exp;

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_norm_sum <= 1'b0;
    else
        en_norm_sum <= en_exp;
end
*/

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_dot_product <= 'b0;
    else
        if(en_fwd_path_sync==1'b1&&done_dot_product==1'b0)
            done_dot_product <= _done_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            done_exp <= done_dot_product;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_fwd_path==1'b1)
        done_norm_sum <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            done_norm_sum <= done_exp;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_mem_w==1'b1)
        done_mem_w <= 'b0;
    else
        if(en_mem_w_sync==1'b1)
            done_mem_w <= en_mem_w_sync;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path <= 1'b0;
    else
        //if(en_fwd_path_sync==1'b1 && count_addr_mem-1==count_addr_dout)
        if(en_fwd_path_sync==1'b1 && done_norm_div==1'b1)
            done_fwd_path <= 1'b1;
end
*/

assign done_fwd_path = en_fwd_path_sync && done_norm_div;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_norm_div==1'b1)
        en_norm_div_init <= 1'b0;
    else
        if(en_fwd_path_sync==1'b1)
            en_norm_div_init <= done_norm_sum;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || done_norm_div==1'b1)
        en_norm_div <= 1'b0;
    else
        if(en_fwd_path_sync==1'b1)
            en_norm_div <= en_norm_div_init;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1&&en_dot_product==1'b1)
            addr_exp <= addr_mem_a;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_sum_exp <= 'b0;
    else
        if(en_fwd_path_sync==1'b1)
            addr_sum_exp <= addr_exp;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_dot_product <= 'b0;
    else
        if(en_fwd_path_sync&&en_dot_product==1'b1)
            reg_dot_product <= _tree_adder_4th;
end
*/

assign reg_dot_product = _tree_adder_4th;


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_exp <= 'b0;
    else
        if(en_fwd_path_sync&&en_exp)
            reg_exp[(addr_exp+1)*BW_DATA-1-:BW_DATA] <= dout_exp;
            //reg_exp[addr_exp] <= dout_exp;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        reg_sum_exp <= 'b0;
    else
        if(en_fwd_path_sync&&en_norm_sum)
            reg_sum_exp <= _reg_sum_exp;
end

//assign we_dout = en_addr_dout_div;
assign we_dout = done_div;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        dout_attention <= 'b0;
    else
        //if(done_norm_div==1'b1)
        if(we_dout==1'b1)
        //if(en_addr_dout_div==1'b1)
            //dout_attention[(count_addr_dout+1)*BW_DATA-1-:BW_DATA] <= _dout_attention;
            dout_attention[(addr_dout_attention+1)*BW_DATA-1-:BW_DATA] <= _dout_attention;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dout_attention_pre <= 'b0;
    else
        if(en_norm_div==1'b1 && en_addr_dout == 1'b1)
            addr_dout_attention_pre <= count_addr_dout;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_dout_attention <= 'b0;
    else
        if(en_norm_div==1'b1)
            addr_dout_attention <= addr_dout_attention_pre;
end




// instance
// multiplier
`ifdef DESIGN_FIXED_POINT
// design fixed point
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier 
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier
        (
            .a(data_mem_a[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(question[(i+1)*BW_DATA-1-:BW_DATA]),
            .c(_reg_mult[(i+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

// tree adder
generate
    for(i=0;i<DIM_EMB;i=i+2)
    begin : tree_adder_1st_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_1st_stage
        (
            .a(_reg_mult[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_reg_mult[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_1st[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/2;i=i+2)
    begin : tree_adder_2nd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_2nd_stage
        (
            .a(_tree_adder_1st[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_1st[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_2nd[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/4;i=i+2)
    begin : tree_adder_3rd_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_3rd_stage
        (
            .a(_tree_adder_2nd[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_2nd[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_3rd[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/8;i=i+2)
    begin : tree_adder_4th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_4th_stage
        (
            .a(_tree_adder_3rd[(i+1)*BW_DATA-1-:BW_DATA]),
            .b(_tree_adder_3rd[(i+2)*BW_DATA-1-:BW_DATA]),
            .c(_tree_adder_4th[(i/2+1)*BW_DATA-1-:BW_DATA])
        );
    end
endgenerate


//
exp_fixed
#
(
    .BW_WL(BW_WL),
    .BW_IWL(BW_IWL_EXP)
)
exp
(
    .din(din_exp),
    .dout(dout_exp)
);



fixed_adder
#(
    .WL(BW_WL),
    .IWL(BW_IWL_EXP)
)
accu_exp
(
    .a(reg_sum_exp),
    .b(dout_exp),
    .c(_reg_sum_exp)
);

wire div_din_ready;

/*
reg div_din_valid;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        div_din_valid <= 1'b0;
    else
        if(en_norm_div==1'b1)
            div_din_valid <= div_din_ready;
end
*/

wire div_din_valid;

assign div_din_valid = (count_addr_mem-1==addr_dout_attention) ? 1'b0 : en_norm_div&&div_din_ready;



div_32
div_32_norm
(
    .aclk(clk),
    .s_axis_dividend_tvalid(div_din_valid),
    .s_axis_dividend_tready(div_din_ready),
    .s_axis_dividend_tdata(reg_exp[(count_addr_dout+1)*BW_DATA-1-:BW_DATA]),
    .s_axis_divisor_tvalid(en_norm_div),
    .s_axis_divisor_tready(),
    .s_axis_divisor_tdata(reg_sum_exp),
    .m_axis_dout_tvalid(done_div),
    .m_axis_dout_tdata({div_norm_q, div_norm_f})
);

always@(*)
begin
    _dout_attention <= {div_norm_q[BW_DATA-1], div_norm_q[BW_IWL-:BW_IWL], div_norm_f[BW_DATA-1-:(BW_WL-BW_IWL-1)]};

end
    

`else
// design floating point

`endif





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
    .addr(addr_mem_a),
    .oe(!we_mem_a),
    .we(we_mem_a),
    // inout
    .data(data_mem_a)
);

//
counter
#(
    .BW(BW_MEM_ADDR+1),
    .COUNT_VALUE(COUNT_VALUE_IN+1)
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
    .en_hold_max(1'b1),
    // output
    .count(count_addr_mem),
    .done(done_addr_mem)
);

//
counter
#(
    .BW(BW_MEM_ADDR),
    .COUNT_VALUE(COUNT_VALUE_IN)
)
addr_dout
(
    // clk
    //.clk(clk_addr_mem),
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_dout),
    // input
    .en(en_addr_dout),
    // output
    .count(count_addr_dout),
    .done(done_addr_dout)
);







endmodule
