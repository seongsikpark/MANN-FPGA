// 

`define BW_DATA 32
`define BW_DATA_EMB_W `BW_DATA
//`define BW_ADDR_EMB_W 6


`define BW_DIM_IN 32        // BW_DIM_IN = DIM_IN
`define BW_DIM_EMB 4        // BW_DIM_EMB = log2(DIM_EMB)

`define BW_MEM_ADDR 4

`define NUM_MEM 1 << `BW_MEM_ADDR


`define BW_WL BW_DATA
`define BW_IWL 8

`define NUM_PHASE 10

`define PHASE_IDLE                 'b00_0000_0001
`define PHASE_INIT                 'b00_0000_0010
`define PHASE_EMB_Q                'b00_0000_0100
`define PHASE_DOT_PROD_MEM_EMB_Q   'b00_0000_1000
`define PHASE_ATTENTION            'b00_0001_0000
`define PHASE_WEIGHTED_SUM         'b00_0010_0000
`define PHASE_SUM_U_Q              'b00_0100_0000
`define PHASE_FULLY_CONNECTED      'b00_1000_0000
`define PHASE_SOFT_MAX             'b01_0000_0000
`define PHASE_END_FWD              'b10_0000_0000

//
`define BW_DATA_IN 32       // bw of data input from fifo


// type decoder
`define BW_TYPE_CODE    2

`define TYPE_CODE_SENTENCE 'b00
`define TYPE_CODE_QUESTION 'b01
`define TYPE_CODE_ANSWER   'b10

//
`define BW_WORD_VEC `BW_DATA_IN - `BW_TYPE_CODE

// index of data
`define RANGE_WORD_VEC  `BW_DATA_IN-1:`BW_TYPE_CODE
`define RANGE_TYPE_CODE `BW_TYPE_CODE-1:0
