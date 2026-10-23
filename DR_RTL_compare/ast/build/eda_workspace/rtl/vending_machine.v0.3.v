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


    always @(*) begin
        if (sel) begin
            total_discount = discountA + discountB;
        end else begin
            total_discount = discountC + discountD;
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

    // L5 slice: sell_signal
    // Active-high: S0, S1, S3, S8, S10
    always @(*) begin
        sell_signal = state_is_s0 | state_is_s1 | state_is_s3 | state_is_s8 | state_is_s10;
    end

endmodule