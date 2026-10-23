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

    // OPTIMIZED: Pre-compute clear condition directly for state update (L6 expression optimization)
    wire clear_for_state = clear;

    // OPTIMIZED: State update with minimal logic depth (L5 assignment-slice for State register)
    always @(posedge clk) begin 
        State <= clear_for_state ? RDY : NextState;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // OPTIMIZED: Next state logic using parallel one-hot assignment (L5 assignment-slice)
    // Replaces priority if-else chain with direct bit assignments
    always @(*) begin
        // Default: maintain current state if no input (for states with hold conditions)
        NextState[0] = state_is_rdy & ~ten_active & ~twenty_active;  // RDY hold
        NextState[1] = 1'b0;  // DISP (no hold)
        NextState[2] = 1'b0;  // RTN (no hold)
        NextState[3] = state_is_bill10 & ~ten_active & ~twenty_active;  // BILL10 hold
        NextState[4] = state_is_bill20 & ~ten_active & ~twenty_active;  // BILL20 hold
        NextState[5] = state_is_bill30 & ~ten_active & ~twenty_active;  // BILL30 hold
        
        // Transitions from RDY
        NextState[0] = NextState[0] | (state_is_disp | state_is_rtn);  // From DISP/RTN to RDY
        NextState[3] = NextState[3] | (state_is_rdy & ten_active);  // RDY to BILL10
        NextState[4] = NextState[4] | (state_is_rdy & ~ten_active & twenty_active);  // RDY to BILL20
        
        // Transitions from BILL10
        NextState[4] = NextState[4] | (state_is_bill10 & ten_active);  // BILL10 to BILL20
        NextState[5] = NextState[5] | (state_is_bill10 & ~ten_active & twenty_active);  // BILL10 to BILL30
        
        // Transitions from BILL20
        NextState[5] = NextState[5] | (state_is_bill20 & ten_active);  // BILL20 to BILL30
        NextState[1] = NextState[1] | (state_is_bill20 & twenty_active);  // BILL20 to DISP
        
        // Transitions from BILL30
        NextState[1] = NextState[1] | (state_is_bill30 & ten_active);  // BILL30 to DISP
        NextState[2] = NextState[2] | (state_is_bill30 & twenty_active);  // BILL30 to RTN
    end

endmodule