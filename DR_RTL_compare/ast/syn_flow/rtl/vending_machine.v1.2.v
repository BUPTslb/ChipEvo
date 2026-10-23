// vending-machine
module vending_machine(
                    clk,
                    reset,
                    condition,
                    sel,
                    discountA,
                    discountB,
                    discountC,
                    discountD,
                    total_discount,
                    sell_signal
                    );

    // State encoding
    localparam  S0 = 4'b0000,
               S1 = 4'b0001,
               S2 = 4'b0010,
               S3 = 4'b0011,
               S4 = 4'b0100,
               S5 = 4'b0101,
               S6 = 4'b0110,
               S7 = 4'b0111,
               S8 = 4'b1000,
               S9 = 4'b1001,
               S10 = 4'b1010;

    parameter DATA_WIDTH = 64;
    parameter K = 16;

    input wire clk, reset, condition, sel;
    input wire [K*DATA_WIDTH-1:0] discountA, discountB, discountC, discountD;

    output reg sell_signal;
    output reg [K*DATA_WIDTH-1:0] total_discount;

    reg [3:0] next_state;
    reg [3:0] state;  // 4-bit state representation for S0 to S10


    // Sequential logic for state transitions
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;  // Reset to state S0
        end else begin
            state <= next_state;
        end
    end


    // Pre-decode state into one-hot signals (L6 expression-level)
    wire state_is_s0  = (state == S0);
    wire state_is_s1  = (state == S1);
    wire state_is_s2  = (state == S2);
    wire state_is_s3  = (state == S3);
    wire state_is_s4  = (state == S4);
    wire state_is_s5  = (state == S5);
    wire state_is_s6  = (state == S6);
    wire state_is_s7  = (state == S7);
    wire state_is_s8  = (state == S8);
    wire state_is_s9  = (state == S9);
    wire state_is_s10 = (state == S10);

    // L5 Optimization 1: Condition pre-computation for sell_signal
    // Pre-compute common sell conditions
    wire sell_group_a = state_is_s0 | state_is_s1 | state_is_s3;
    wire sell_group_b = state_is_s8 | state_is_s10;
    wire sell_condition = sell_group_a | sell_group_b;

    // L5 Optimization 2: Balanced carry-select style addition for total_discount
    // Break the 1024-bit addition into 4 x 256-bit blocks
    localparam BLOCK_SIZE = 256; // 1024/4 = 256 bits per block
    localparam NUM_BLOCKS = K*DATA_WIDTH / BLOCK_SIZE;
    
    // Pre-compute the two sums using carry-select structure
    wire [K*DATA_WIDTH-1:0] sum_ab;
    wire [K*DATA_WIDTH-1:0] sum_cd;
    
    // Generate block-level additions with carry-select
    genvar i;
    generate
        for (i = 0; i < NUM_BLOCKS; i = i + 1) begin : gen_carry_select
            localparam HIGH_BIT = (i+1)*BLOCK_SIZE - 1;
            localparam LOW_BIT = i*BLOCK_SIZE;
            
            // For sum_ab: discountA + discountB
            wire [BLOCK_SIZE:0] sum0_ab = discountA[HIGH_BIT:LOW_BIT] + discountB[HIGH_BIT:LOW_BIT];
            wire [BLOCK_SIZE:0] sum1_ab = discountA[HIGH_BIT:LOW_BIT] + discountB[HIGH_BIT:LOW_BIT] + 1;
            
            // For sum_cd: discountC + discountD
            wire [BLOCK_SIZE:0] sum0_cd = discountC[HIGH_BIT:LOW_BIT] + discountD[HIGH_BIT:LOW_BIT];
            wire [BLOCK_SIZE:0] sum1_cd = discountC[HIGH_BIT:LOW_BIT] + discountD[HIGH_BIT:LOW_BIT] + 1;
            
            if (i == 0) begin : first_block
                // First block: carry-in = 0
                assign sum_ab[HIGH_BIT:LOW_BIT] = sum0_ab[BLOCK_SIZE-1:0];
                assign sum_cd[HIGH_BIT:LOW_BIT] = sum0_cd[BLOCK_SIZE-1:0];
            end else begin : middle_blocks
                // For other blocks, select based on carry from previous block
                wire carry_ab_prev = gen_carry_select[i-1].carry_ab;
                wire carry_cd_prev = gen_carry_select[i-1].carry_cd;
                
                assign sum_ab[HIGH_BIT:LOW_BIT] = carry_ab_prev ? 
                    sum1_ab[BLOCK_SIZE-1:0] : sum0_ab[BLOCK_SIZE-1:0];
                assign sum_cd[HIGH_BIT:LOW_BIT] = carry_cd_prev ? 
                    sum1_cd[BLOCK_SIZE-1:0] : sum0_cd[BLOCK_SIZE-1:0];
            end
            
            // Carry out signals
            wire carry_ab = (i == 0) ? sum0_ab[BLOCK_SIZE] : 
                           (gen_carry_select[i-1].carry_ab ? sum1_ab[BLOCK_SIZE] : sum0_ab[BLOCK_SIZE]);
            wire carry_cd = (i == 0) ? sum0_cd[BLOCK_SIZE] : 
                           (gen_carry_select[i-1].carry_cd ? sum1_cd[BLOCK_SIZE] : sum0_cd[BLOCK_SIZE]);
        end
    endgenerate

    // Final mux for total_discount (late select)
    always @(*) begin
        total_discount = sel ? sum_ab : sum_cd;
    end


    // Combinational logic for next_state and sell_signal
    // Decomposed from case statement into L5 assignment-slices per target signal

    // L5 slice: next_state when condition == 1
    wire [3:0] next_state_on_true =
        {4{state_is_s0 }} & S2  |
        {4{state_is_s1 }} & S5  |
        {4{state_is_s2 }} & S4  |
        {4{state_is_s3 }} & S6  |
        {4{state_is_s4 }} & S2  |
        {4{state_is_s5 }} & S3  |
        {4{state_is_s6 }} & S6  |
        {4{state_is_s7 }} & S4  |
        {4{state_is_s8 }} & S6  |
        {4{state_is_s9 }} & S0  |
        {4{state_is_s10}} & S5  ;

    // L5 slice: next_state when condition == 0
    wire [3:0] next_state_on_false =
        {4{state_is_s0 }} & S1   |
        {4{state_is_s1 }} & S3   |
        {4{state_is_s2 }} & S5   |
        {4{state_is_s3 }} & S1   |
        {4{state_is_s4 }} & S5   |
        {4{state_is_s5 }} & S4   |
        {4{state_is_s6 }} & S5   |
        {4{state_is_s7 }} & S9   |
        {4{state_is_s8 }} & S10  |
        {4{state_is_s9 }} & S2   |
        {4{state_is_s10}} & S0   ;

    // L5 slice: next_state final mux (late select)
    always @(*) begin
        next_state = condition ? next_state_on_true : next_state_on_false;
    end

    // L5 slice: sell_signal using pre-computed conditions
    always @(*) begin
        sell_signal = sell_condition;
    end

endmodule