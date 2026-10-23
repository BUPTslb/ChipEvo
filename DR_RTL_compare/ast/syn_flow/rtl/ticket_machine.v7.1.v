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

    // L5 assignment-slice: pre-compute clear condition for state update
    wire do_clear = clear;

    // OPTIMIZED: State update using ternary operator for balanced mux
    // Single L5 assignment-slice with pre-computed condition
    always @(posedge clk) 
        State <= do_clear ? RDY : NextState;

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // RESTRUCTURED: Next state logic using case statement for balanced mux tree
    // Decomposed L5 assignment-slices per state with balanced mux selection
    always @(*) begin
        case (1'b1)
            state_is_rdy:    NextState = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
            state_is_bill10: NextState = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
            state_is_bill20: NextState = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
            state_is_bill30: NextState = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
            state_is_disp:   NextState = RDY;
            state_is_rtn:    NextState = RDY;
            default:         NextState = RDY;
        endcase
    end

endmodule