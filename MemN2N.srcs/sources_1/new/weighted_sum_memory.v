//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/20 20:07:53
// Design Name: 
// Module Name: weighted_sum_memory
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

module weighted_sum_memory
(
    // clock
    clk,
    // reset_n
    rst_n,
    rst_n_soft,
    rst_n_hop,
    // input
    en_mem_w,
    en_fwd_path,
    en_bwd_path,
    en_bwd_path_grad,
    din_mem,
    din_weight,
    gin,
    ain_bwd_path_grad,
    done_bwd_path_grad,
    hop,

    // output
    done_mem_w,
    done_fwd_path,
    done_bwd_path,
    dout_weighted_sum,
    gout_mat,
    gout_vec,

    // debug
    debug_out
);

////////////////////////////////////////////////////////////
// parameters
////////////////////////////////////////////////////////////
parameter BW_WL = `BW_WL;
parameter BW_IWL = `BW_IWL;

parameter DIM_EMB = 1<<`BW_DIM_EMB;
parameter BW_DATA = `BW_DATA_EMB_W;

parameter BW_MEM_DATA = BW_DATA*DIM_EMB;
parameter BW_MEM_ADDR = `BW_MEM_ADDR;
parameter COUNT_VALUE_IN = (1 << BW_MEM_ADDR) - 1;
parameter NUM_MEM = `NUM_MEM;

parameter BW_HOP = `BW_HOP;
parameter NUM_HOP = `NUM_HOP;
////////////////////////////////////////////////////////////
// ports
////////////////////////////////////////////////////////////
// clock
input wire clk;
// reset_n
input wire rst_n;
input wire rst_n_soft;
input wire rst_n_hop;
// input
input wire en_mem_w;
input wire en_fwd_path;
input wire en_bwd_path;
input wire en_bwd_path_grad;
input wire [BW_DATA*DIM_EMB-1:0] din_mem;
input wire [BW_DATA*NUM_MEM-1:0] din_weight;
input wire [BW_DATA*DIM_EMB-1:0] gin;
input wire [BW_MEM_ADDR-1:0] ain_bwd_path_grad;
input wire done_bwd_path_grad;
input wire [BW_HOP-1:0] hop;

// output
output reg done_mem_w;
output reg done_fwd_path;
output reg done_bwd_path;
//output reg [BW_DATA*DIM_EMB-1:0] dout_weighted_sum;
output wire [BW_DATA*DIM_EMB-1:0] dout_weighted_sum;
output reg [BW_DATA*DIM_EMB-1:0] gout_mat;     
output reg [BW_DATA*NUM_MEM-1:0] gout_vec;

output reg [`BW_DEBUG_W_MEM-1:0] debug_out;

////////////////////////////////////////////////////////////
// internal signals
////////////////////////////////////////////////////////////
genvar i;
genvar j;

wire [BW_DATA-1:0] _din_mem [0:DIM_EMB-1];
wire [BW_DATA-1:0] _din_weight [0:NUM_MEM-1];
wire [BW_DATA-1:0] _gin [0:DIM_EMB-1];

wire [BW_DATA-1:0] data_in_mem_c [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_mem_c [0:DIM_EMB-1];
wire [BW_DATA*DIM_EMB-1:0] data_out_mem_c_flat;
wire [BW_DATA-1:0] data_in_mem_grad [0:DIM_EMB-1];
wire [BW_DATA-1:0] data_out_mem_grad [0:DIM_EMB-1];

reg [BW_MEM_ADDR-1:0] addr_mem_c;



reg en_mem_w_sync;
reg en_fwd_path_sync;
reg en_bwd_path_sync;
reg en_bwd_path_grad_sync;

reg _done_fwd_path;
reg __done_fwd_path;
reg ___done_fwd_path;
reg _done_bwd_path;

wire rst_n_addr_mem;
wire en_addr_mem;
wire [BW_MEM_ADDR:0] count_addr_mem;
wire done_addr_mem;

wire rst_n_addr_dout;
wire en_addr_dout;
wire [BW_MEM_ADDR-1:0] count_addr_dout;
wire done_addr_dout;

reg we_mem_c;

reg [BW_MEM_ADDR-1:0] addr_weighted_sum;
wire [BW_DATA-1:0] weight_weighted_sum;
reg [BW_DATA*DIM_EMB-1:0] reg_weighted_sum;
//reg en_fwd_path_weighted_sum_sync;
wire _en_weighted_sum;


//wire [BW_DATA-1:0] weight;
//reg [BW_MEM_ADDR-1:0] addr_weight;

reg [BW_DATA-1:0] weight;
wire [BW_MEM_ADDR-1:0] addr_weight;


reg en_weighted_sum;

wire rst_n_weighted_sum;

reg [BW_MEM_ADDR-1:0] _addr_mem_grad;
reg [BW_MEM_ADDR-1:0] addr_mem_grad;

wire we_mem_grad;
reg _we_mem_grad;

wire [BW_DATA-1:0] _mult_in_mat_a [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_mat_b [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_out_mat [0:DIM_EMB-1];

wire [BW_DATA-1:0] _mult_in_vec_a [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_in_vec_b [0:DIM_EMB-1];
wire [BW_DATA-1:0] _mult_out_vec [0:DIM_EMB-1];
reg [BW_DATA-1:0] mult_out_vec [0:DIM_EMB-1];


wire [BW_DATA-1:0] _tree_adder_1st [0:DIM_EMB/2-1];
wire [BW_DATA-1:0] _tree_adder_2nd [0:DIM_EMB/4-1];
wire [BW_DATA-1:0] _tree_adder_3rd [0:DIM_EMB/8-1];
wire [BW_DATA-1:0] _tree_adder_4th [0:DIM_EMB/16-1];
wire [BW_DATA-1:0] _tree_adder_5th;

reg [BW_DATA-1:0] tree_adder_1st [0:DIM_EMB/2-1];
reg [BW_DATA-1:0] tree_adder_2nd [0:DIM_EMB/4-1];
reg [BW_DATA-1:0] tree_adder_3rd [0:DIM_EMB/8-1];
reg [BW_DATA-1:0] tree_adder_4th [0:DIM_EMB/16-1];
reg [BW_DATA-1:0] tree_adder_5th;

reg tree_adder_1st_input_valid;
reg tree_adder_1st_valid;
reg tree_adder_2nd_valid;
reg tree_adder_3rd_valid;
reg tree_adder_4th_valid;
reg tree_adder_5th_valid;
wire tree_adder_valid;


reg en_addr_gout_vec;


wire [BW_DATA*DIM_EMB-1:0] _dout_weighted_sum;
wire [BW_DATA*DIM_EMB-1:0] _gout_mat;     


reg [BW_DATA-1:0] dout_weighted_sum_buf [0:NUM_HOP-1][0:DIM_EMB-1];

//
wire overflow_tree_adder_5th;
wire [DIM_EMB-1:0] overflow_mult_out_mat;
wire [DIM_EMB-1:0] overflow_mult_out_vec;

wire underflow_tree_adder_5th;
wire [DIM_EMB-1:0] underflow_mult_out_mat;
wire [DIM_EMB-1:0] underflow_mult_out_vec;

////////////////////////////////////////////////////////////
// combinational logic
////////////////////////////////////////////////////////////
generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_din_mem
        assign _din_mem[i] = din_mem[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_gin
        assign _gin[i] = gin[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin : assign_din_weight
        assign _din_weight[i] = din_weight[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

assign en_addr_mem = we_mem_c;

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        //assign data_in_mem_c[i] = (we_mem_c==1'b0)? {BW_DATA{1'b0}} : din_mem[(i+1)*BW_DATA-1-:BW_DATA];
        assign data_in_mem_c[i] = (we_mem_c==1'b1)? din_mem[(i+1)*BW_DATA-1-:BW_DATA] : {BW_DATA{1'b0}};
    end
endgenerate


// should modify later
assign rst_n_addr_mem = rst_n && rst_n_soft;
assign rst_n_addr_dout = rst_n && rst_n_soft && (en_fwd_path_sync||en_bwd_path_sync);
//assign rst_n_addr_dout = rst_n && rst_n_soft;

always@(*)
begin
    if(rst_n==1'b0)
        addr_mem_c = 'b0;
    else
    begin
        case({en_mem_w_sync,en_fwd_path_sync,en_bwd_path_sync})
            3'b100 :
            begin
                addr_mem_c = count_addr_mem[BW_MEM_ADDR-1:0];
            end
            3'b010 :
            begin
                addr_mem_c = count_addr_dout;
            end
            3'b001 :
            begin
                addr_mem_c = count_addr_dout;
            end
            default
            begin
                addr_mem_c = 'b0;
            end
        endcase
    end
end

//assign weight = _din_weight[addr_weight];


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        weight <= {BW_DATA{1'b0}};
    else
        weight <= _din_weight[addr_weight];
end


assign rst_n_weighted_sum = rst_n && rst_n_soft && rst_n_hop;

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        dout_weighted_sum <= {BW_DATA*DIM_EMB{1'b0}};
    else
        dout_weighted_sum <= _dout_weighted_sum;
end
*/

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign dout_weighted_sum[(i+1)*BW_DATA-1-:BW_DATA] = dout_weighted_sum_buf[hop][i];
    end
endgenerate

generate
    for(i=0;i<NUM_HOP;i=i+1)
    begin
        for(j=0;j<DIM_EMB;j=j+1)
        begin
            always@(posedge clk or negedge rst_n)
            begin
                if(rst_n==1'b0)
                    dout_weighted_sum_buf[i][j] <= {BW_DATA{1'b0}};
                else
                    if(done_fwd_path==1'b1 && i==hop)
                        dout_weighted_sum_buf[i][j] <= _dout_weighted_sum[(j+1)*BW_DATA-1-:BW_DATA];
            end
        end
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_addr_gout_vec <= 1'b0;
    else
        if(en_addr_gout_vec==1'b1||_done_bwd_path==1'b1)
            en_addr_gout_vec <= 1'b0;
        else
            //if(count_addr_dout=={COUNT_VALUE_IN{1'b0}}&&count_addr_dout!=count_addr_mem-1)
            if(count_addr_dout=={COUNT_VALUE_IN{1'b0}})
                en_addr_gout_vec <= en_bwd_path_sync;
            else
                if(tree_adder_valid==1'b1&&addr_mem_grad!=count_addr_mem-1)
                    en_addr_gout_vec <= en_bwd_path_sync;
                else
                    en_addr_gout_vec <= 1'b0;
end

assign tree_adder_valid = tree_adder_5th_valid;

assign en_addr_dout = (en_fwd_path_sync && !_done_fwd_path) || (en_bwd_path_sync && !_done_bwd_path && en_addr_gout_vec);


always@(*)
begin
    if(en_bwd_path_grad_sync==1'b1)
        addr_mem_grad = ain_bwd_path_grad;
    else 
        addr_mem_grad = _addr_mem_grad;
end

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_gout_mat
        assign _gout_mat[(i+1)*BW_DATA-1-:BW_DATA] = (en_bwd_path_grad_sync==1'b1)? data_out_mem_grad[i] : {BW_DATA{1'b0}};
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        gout_mat <= 'b0;
    else
        gout_mat <= _gout_mat;
end

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_bwd_mult_in
        // gout_mat
        assign _mult_in_mat_a[i] = (en_bwd_path_sync==1'b1)? _din_weight[addr_mem_grad]:{BW_DATA{1'b0}};
        assign _mult_in_mat_b[i] = (en_bwd_path_sync==1'b1)? _gin[i]:{BW_DATA{1'b0}};
        
        // gout_vec
        assign _mult_in_vec_a[i] = (en_bwd_path_sync==1'b1)? data_out_mem_c[i]:{BW_DATA{1'b0}};
        assign _mult_in_vec_b[i] = (en_bwd_path_sync==1'b1)? _gin[i]:{BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : assign_bwd_mult_out_vec
        assign data_in_mem_grad[i] = (en_bwd_path_sync==1'b1)? _mult_out_mat[i]:{BW_DATA{1'b0}};
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign data_out_mem_c_flat[(i+1)*BW_DATA-1-:BW_DATA] = data_out_mem_c[i];
    end
endgenerate


////////////////////////////////////////////////////////////
// sequential logic
////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_mem_w==1'b1)
    if(rst_n==1'b0)
        en_mem_w_sync <= 1'b0;
    else
        if(done_mem_w==1'b1)
            en_mem_w_sync <= 1'b0;
        else if(en_mem_w_sync==1'b0)
            en_mem_w_sync <= en_mem_w;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || done_mem_w==1'b1)
    if(rst_n==1'b0)
        done_mem_w <= 1'b0;
    else
        if(done_mem_w==1'b1)
            done_mem_w <= 1'b0;
        else if(en_mem_w_sync==1'b1)
            done_mem_w <= en_mem_w_sync;
end

always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || _done_fwd_path==1'b1)
    if(rst_n==1'b0)
        en_fwd_path_sync <= 1'b0;
    else
        if(_done_fwd_path==1'b1)
            en_fwd_path_sync <= 1'b0;
        else if(en_fwd_path==1'b1)
            en_fwd_path_sync <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        _done_fwd_path <= 1'b0;
    else
        if(_done_fwd_path==1'b1)
            _done_fwd_path <= 1'b0;
        else if(en_fwd_path_sync==1'b1 && count_addr_mem-1==addr_mem_c)
            _done_fwd_path <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_fwd_path <= 1'b0;
    else    
        done_fwd_path <= ___done_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        ___done_fwd_path <= 1'b0;
    else    
        ___done_fwd_path <= __done_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        __done_fwd_path <= 1'b0;
    else
        __done_fwd_path <= _done_fwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        we_mem_c <= 1'b0;
    else    
        if(done_mem_w==1'b1)
            we_mem_c <= 1'b0;
        else 
            we_mem_c <= en_mem_w_sync;
end


always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_sync <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            en_bwd_path_sync <= 1'b0;
        else if(en_bwd_path_sync==1'b0)
            en_bwd_path_sync <= en_bwd_path;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_bwd_path_grad_sync <= 1'b0;
    else
        if(done_bwd_path_grad==1'b1)
            en_bwd_path_grad_sync <= 1'b0;
        else if(en_bwd_path_grad_sync==1'b0)
            en_bwd_path_grad_sync <= en_bwd_path_grad;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        _done_bwd_path <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            _done_bwd_path <= 1'b0;
        //else if(en_bwd_path_sync==1'b1 && count_addr_mem-1==addr_mem_c)
        else if(en_bwd_path_sync==1'b1 && count_addr_mem==addr_mem_grad)
            _done_bwd_path <= 1'b1;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        done_bwd_path <= 1'b0;
    else    
        done_bwd_path <= _done_bwd_path;
end

/*
always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        addr_weight <= {BW_MEM_ADDR{1'b0}};
    else
        addr_weight <= addr_mem_c;
end
*/
assign addr_weight = addr_mem_c;

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        en_weighted_sum <= 1'b0;
    else
        en_weighted_sum <= en_fwd_path_sync && !_done_fwd_path;
end

//always@(posedge clk or negedge rst_n or negedge rst_n_soft)
always@(posedge clk or negedge rst_n)
begin
    //if(rst_n==1'b0 || rst_n_soft==1'b0)
    if(rst_n==1'b0)
        gout_vec <= {BW_DATA*NUM_MEM{1'b0}};
    else
        if(we_mem_grad==1'b1)
            gout_vec[(addr_mem_grad+1)*BW_DATA-1-:BW_DATA] <= tree_adder_5th;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0 || en_bwd_path_sync==1'b0)
        _addr_mem_grad <= {BW_MEM_ADDR{1'b0}};
    else
        if(en_bwd_path_sync==1'b1&&tree_adder_valid==1'b1)
            _addr_mem_grad <= addr_mem_c;
end



always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        _we_mem_grad <= 1'b0;
    else
        if(_done_bwd_path==1'b1)
            _we_mem_grad <= 1'b0;
        else 
            _we_mem_grad <= en_bwd_path_sync;
end

assign we_mem_grad = _we_mem_grad && tree_adder_valid;



////////////////////////////////////////////////////////////
// instances
////////////////////////////////////////////////////////////

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : memory_c
        ram_sync
        #(
            .BW_DATA(BW_DATA),
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
            .data_in(data_in_mem_c[i]),
            // inout
            .data_out(data_out_mem_c[i])
        );
    end
endgenerate


generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier_mat
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier_out_mat
        (
            .a(_mult_in_mat_a[i]),
            .b(_mult_in_mat_b[i]),
            .c(_mult_out_mat[i]),
            .overflow(overflow_mult_out_mat[i]),
            .underflow(underflow_mult_out_mat[i])
        );
    end
endgenerate

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : multiplier_vec
        fixed_mult
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        fixed_multiplier_out_vec
        (
            .a(_mult_in_vec_a[i]),
            .b(_mult_in_vec_b[i]),
            .c(_mult_out_vec[i]),
            .overflow(overflow_mult_out_vec[i]),
            .underflow(underflow_mult_out_vec[i])
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                mult_out_vec[i] <= {BW_DATA{1'b0}};
            else
                mult_out_vec[i] <= _mult_out_vec[i];
        end
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
            //.a(_mult_out_vec[i]),
            //.b(_mult_out_vec[i+1]),
            .a(mult_out_vec[i]),
            .b(mult_out_vec[i+1]),
            .c(_tree_adder_1st[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_1st[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_1st[i/2] <= _tree_adder_1st[i/2];
        end
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
            .a(tree_adder_1st[i]),
            .b(tree_adder_1st[i+1]),
            .c(_tree_adder_2nd[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_2nd[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_2nd[i/2] <= _tree_adder_2nd[i/2];
        end
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
            .a(tree_adder_2nd[i]),
            .b(tree_adder_2nd[i+1]),
            .c(_tree_adder_3rd[i/2]),
            .overflow(),
            .underflow()
        );
        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
            tree_adder_3rd[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_3rd[i/2] <= _tree_adder_3rd[i/2];
        end
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
            .a(tree_adder_3rd[i]),
            .b(tree_adder_3rd[i+1]),
            .c(_tree_adder_4th[i/2]),
            .overflow(),
            .underflow()
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_4th[i/2] <= {BW_DATA{1'b0}};
            else
                tree_adder_4th[i/2] <= _tree_adder_4th[i/2];
        end
    end
endgenerate

generate
    for(i=0;i<DIM_EMB/16;i=i+2)
    begin : tree_adder_5th_stage
        fixed_adder
        #(
            .WL(BW_WL),
            .IWL(BW_IWL)
        )
        tree_adder_5th_stage
        (
            .a(tree_adder_4th[i]),
            .b(tree_adder_4th[i+1]),
            .c(_tree_adder_5th),
            .overflow(overflow_tree_adder_5th),
            .underflow(underflow_tree_adder_5th)
        );

        always@(posedge clk or negedge rst_n)
        begin
            if(rst_n==1'b0)
                tree_adder_5th <= {BW_DATA{1'b0}};
            else
                tree_adder_5th <= _tree_adder_5th;
        end
    end
endgenerate

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_1st_input_valid <= 1'b0;
    else
        tree_adder_1st_input_valid <= en_addr_gout_vec;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_1st_valid <= 1'b0;
    else
        tree_adder_1st_valid <= tree_adder_1st_input_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_2nd_valid <= 1'b0;
    else
        tree_adder_2nd_valid <= tree_adder_1st_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_3rd_valid <= 1'b0;
    else
        tree_adder_3rd_valid <= tree_adder_2nd_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_4th_valid <= 1'b0;
    else
        tree_adder_4th_valid <= tree_adder_3rd_valid;
end

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        tree_adder_5th_valid <= 1'b0;
    else
        tree_adder_5th_valid <= tree_adder_4th_valid;
end



generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin : mem_grad
        ram_sync
        #(
            .BW_DATA(BW_DATA),
            .BW_ADDR(BW_MEM_ADDR)
        )
        mem_grad
        (
            // clk
            .clk(clk),
            // reset_n
            .rst_n(rst_n),
            // input
            .addr(addr_mem_grad),
            .oe(!we_mem_grad),
            .we(we_mem_grad),
            .data_in(data_in_mem_grad[i]),
            // inout
            .data_out(data_out_mem_grad[i])
        );
    end
endgenerate


//
counter
#(
    .BW(BW_MEM_ADDR+1),
    .COUNT_VALUE(COUNT_VALUE_IN+1)
)
addr_mem
(
    // clk
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
    .clk(clk),
    // reset_n
    .rst_n(rst_n_addr_dout),
    // input
    .en(en_addr_dout),
    .en_hold_max(1'b0),
    // output
    .count(count_addr_dout),
    .done(done_addr_dout)
);



//
mult_accumulator_fixed
#(
)
weighted_sum
(
    .clk(clk),
    .rst_n(rst_n_weighted_sum),
    .enable(en_weighted_sum),
    .din_a(data_out_mem_c_flat),
    .din_b({DIM_EMB{weight}}),
    .dout(_dout_weighted_sum)
);



////////////////////////////////////////////////////////////
// debug
////////////////////////////////////////////////////////////

always@(posedge clk or negedge rst_n)
begin
    if(rst_n==1'b0)
        debug_out <= {`BW_DEBUG_W_MEM{1'b0}};
    else
        debug_out <= {overflow_tree_adder_5th,underflow_tree_adder_5th};
end


`ifdef DEBUG
wire [BW_DATA-1:0] debug_gout_vec [0:NUM_MEM-1];

generate
    for(i=0;i<NUM_MEM;i=i+1)
    begin
        assign debug_gout_vec[i] = gout_vec[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate

wire [BW_DATA-1:0] debug_gout_mat [0:DIM_EMB-1];

generate
    for(i=0;i<DIM_EMB;i=i+1)
    begin
        assign debug_gout_mat[i] = gout_mat[(i+1)*BW_DATA-1-:BW_DATA];
    end
endgenerate


`ifdef DEBUG_ILA
ila
ila_weighted_mem
(
    .clk(clk),

    // 1 bit
    .probe0(rst_n_addr_mem),
    .probe1(rst_n_addr_dout),
    .probe2(rst_n_weighted_sum),
    .probe3(en_mem_w_sync),
    //.probe4(en_fwd_path_weighted_sum_sync),
    .probe4(),
    .probe5(_en_weighted_sum),
    .probe6(en_weighted_sum),
    .probe7(en_addr_gout_vec),

    // 1 bit
    .probe8(en_fwd_path_sync),
    .probe9(en_bwd_path_sync),
    .probe10(en_bwd_path_grad_sync),
    .probe11(en_addr_mem),
    .probe12(en_addr_dout),
    .probe13(we_mem_c),
    .probe14(we_mem_grad),
    .probe15(_we_mem_grad),

    // 16 bit
    .probe16(addr_mem_c),
    .probe17(count_addr_mem),
    .probe18(count_addr_dout),
    .probe19(addr_weighted_sum),
    .probe20(addr_weight),
    .probe21(_addr_mem_grad),
    .probe22(addr_mem_grad),
    .probe23(),

    // 32 bit
    .probe24(weight_weighted_sum),
    .probe25(weight),
    .probe26(overflow_mult_out_mat),
    .probe27(overflow_mult_out_vec),
    .probe28(underflow_mult_out_mat),
    .probe29(underflow_mult_out_vec),
    .probe30(),
    .probe31(),

    // 1 bit
    .probe32(done_addr_mem),
    .probe33(done_addr_dout),
    .probe34(_done_fwd_path),
    .probe35(__done_fwd_path),
    .probe36(___done_fwd_path),
    .probe37(_done_bwd_path),
    .probe38(tree_adder_valid),
    .probe39(),

    // 1 bit
    .probe40(overflow_tree_adder_5th),
    .probe41(underflow_tree_adder_5th),
    .probe42(),
    .probe43(),
    .probe44(),
    .probe45(),
    .probe46(),
    .probe47(),

    // 1 bit
    .probe48(),
    .probe49(),
    .probe50(),
    .probe51(),
    .probe52(),
    .probe53(),
    .probe54(),
    .probe55()

);
`endif  // DEBUG_ILA

/*
ila_1x4x2048
ila_weighted_mem
(
    .clk(clk),

    // 1 bit
    .probe0(overflow_tree_adder_5th),
    .probe1(underflow_tree_adder_5th)
    //.probe2(),
    //.probe3()
);
*/
`endif  // DEBUG

endmodule
