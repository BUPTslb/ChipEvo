module ticket_machine #(
    parameter ON  = 1'b1,
    parameter OFF = 1'b0
) (
    input  clk, clear, ten, twenty,
    output reg ready, dispense, return_sig, bill
);

    // use one-hot encoding to define states
    localparam RDY    = 6'b000001,
               DISP   = 6'b000010,
               RTN    = 6'b000100,
               BILL10 = 6'b001000,
               BILL20 = 6'b010000,
               BILL30 = 6'b100000;

    reg [5:0] State, NextState;

    // Pre-computed state conditions (L5 assignment-slices)
    wire state_is_rdy    = (State == RDY);
    wire state_is_disp   = (State == DISP);
    wire state_is_rtn    = (State == RTN);
    wire state_is_bill10 = (State == BILL10);
    wire state_is_bill20 = (State == BILL20);
    wire state_is_bill30 = (State == BILL30);
    
    // Pre-computed input conditions (L5 assignment-slices)
    wire ten_active   = ten;
    wire twenty_active = twenty;
    wire ten_inactive   = ~ten;
    wire twenty_inactive = ~twenty;
    
    // NEW: Parallel next-state computation (L5 mux-tree restructure with priority preservation)
    // Preserve original priority via mutually exclusive conditions
    wire [5:0] next_state_parallel;
    assign next_state_parallel[0] = state_is_disp | state_is_rtn | 
                                   (state_is_rdy & ten_inactive & twenty_inactive);
    assign next_state_parallel[1] = (state_is_bill20 & ten_inactive & twenty_active) |
                                   (state_is_bill30 & ten_active);
    assign next_state_parallel[2] = (state_is_bill30 & ten_inactive & twenty_active);
    assign next_state_parallel[3] = (state_is_rdy & ten_active) |
                                   (state_is_bill10 & ten_inactive & twenty_inactive);
    assign next_state_parallel[4] = (state_is_rdy & ten_inactive & twenty_active) |
                                   (state_is_bill10 & ten_active) |
                                   (state_is_bill20 & ten_inactive & twenty_inactive);
    assign next_state_parallel[5] = (state_is_bill10 & ten_inactive & twenty_active) |
                                   (state_is_bill20 & ten_active) |
                                   (state_is_bill30 & ten_inactive & twenty_inactive);

    // Pre-computed clear condition (L6 condition pre-computation)
    wire clear_active = clear;

    // update state on clock rising edge - using pre-computed clear condition
    always @(posedge clk) begin 
        if (clear_active)
            State <= RDY;
        else
            State <= NextState;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // next state logic using parallel computation (replaces priority if-else chain)
    always @(*) begin
        NextState = next_state_parallel;
    end

endmodule