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
    
    // Pre-computed combined conditions (L5 assignment-slices)
    wire rdy_ten     = state_is_rdy & ten_active;
    wire rdy_twenty  = state_is_rdy & ~ten_active & twenty_active;
    wire bill10_ten  = state_is_bill10 & ten_active;
    wire bill10_twenty = state_is_bill10 & ~ten_active & twenty_active;
    wire bill20_ten  = state_is_bill20 & ten_active;
    wire bill20_twenty = state_is_bill20 & ~ten_active & twenty_active;
    wire bill30_ten  = state_is_bill30 & ten_active;
    wire bill30_twenty = state_is_bill30 & ~ten_active & twenty_active;

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

    // ================================================================
    // next state logic — flat mux tree restructure using one-hot state
    // Each NextState bit is an independent L5 assignment-slice.
    // Ternary depth per bit: ~3 gates (2:1 + 2:1 + OR)
    // vs. original if-else priority chain depth: ~6+ gates
    // ================================================================
    always @(*) begin
        NextState = RDY; // safe default

        // L5 slice: NextState[0] — transitions that return to RDY
        NextState[0] = state_is_rdy ? (~ten_active & ~twenty_active) :
                       state_is_disp ? 1'b1 :
                       state_is_rtn  ? 1'b1 :
                       1'b1;

        // L5 slice: NextState[1] — transitions to DISP (collecting→dispense)
        NextState[1] = state_is_bill20 ? twenty_active :
                       state_is_bill30 ? ten_active :
                       1'b0;

        // L5 slice: NextState[2] — transitions to RTN (overpay→return)
        NextState[2] = state_is_bill30 ? (~ten_active & twenty_active) :
                       1'b0;

        // L5 slice: NextState[3] — transitions to BILL10 (idle→10)
        NextState[3] = state_is_rdy ? (ten_active & ~twenty_active) :
                       1'b0;

        // L5 slice: NextState[4] — transitions to BILL20 (idle→20, bill10→+10)
        NextState[4] = state_is_rdy    ? (~ten_active & twenty_active) :
                       state_is_bill10 ? ten_active :
                       1'b0;

        // L5 slice: NextState[5] — transitions to BILL30 (idle→30, bill10→+20, bill20→+10)
        NextState[5] = state_is_rdy    ? (ten_active & twenty_active) :
                       state_is_bill10 ? (~ten_active & twenty_active) :
                       state_is_bill20 ? ten_active :
                       1'b0;
    end

endmodule