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

    // Idle hold condition (L6)
    wire rdy_idle = state_is_rdy & ~ten_active & ~twenty_active;

    // OPTIMIZED: Ternary mux for state update (L5 assignment-slice for State register)
    always @(posedge clk) begin 
        State <= clear_active ? RDY : NextState;
    end

    // output logic based on current state (Moore state machine)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // OPTIMIZED: Direct bit assignment for NextState using one-hot encoding
    // Eliminates if-else priority chain; each bit is a parallel OR of transitions
    // L5 slices: NextState[0]..NextState[5]
    always @(*) begin
        // RDY bit: idle hold, or returning from DISP/RTN
        NextState[0] = rdy_idle | state_is_disp | state_is_rtn;
        // DISP bit: transition from BILL20+20 or BILL30+10
        NextState[1] = bill20_twenty | bill30_ten;
        // RTN bit: transition from BILL30+20
        NextState[2] = bill30_twenty;
        // BILL10 bit: transition from RDY+10
        NextState[3] = rdy_ten;
        // BILL20 bit: transition from RDY+20 or BILL10+10
        NextState[4] = rdy_twenty | bill10_ten;
        // BILL30 bit: transition from BILL10+20 or BILL20+10
        NextState[5] = bill10_twenty | bill20_ten;
    end

endmodule