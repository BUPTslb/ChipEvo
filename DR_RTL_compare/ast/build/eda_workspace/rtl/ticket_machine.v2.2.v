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

    // NEW: Pre-computed clear condition (L6 condition pre-computation)
    wire clear_active = clear;

    // NEW: Late mux-select optimization for next-state logic
    // Compute all possible next states in parallel
    wire [5:0] next_state_rdy_ten = BILL10;
    wire [5:0] next_state_rdy_twenty = BILL20;
    wire [5:0] next_state_rdy_hold = RDY;
    wire [5:0] next_state_bill10_ten = BILL20;
    wire [5:0] next_state_bill10_twenty = BILL30;
    wire [5:0] next_state_bill10_hold = BILL10;
    wire [5:0] next_state_bill20_ten = BILL30;
    wire [5:0] next_state_bill20_twenty = DISP;
    wire [5:0] next_state_bill20_hold = BILL20;
    wire [5:0] next_state_bill30_ten = DISP;
    wire [5:0] next_state_bill30_twenty = RTN;
    wire [5:0] next_state_bill30_hold = BILL30;
    wire [5:0] next_state_disp = RDY;
    wire [5:0] next_state_rtn = RDY;
    wire [5:0] next_state_default = RDY;

    // Mux-select signals (derived from pre-computed conditions)
    wire sel_rdy_ten = rdy_ten;
    wire sel_rdy_twenty = rdy_twenty & ~ten_active;  // Use pre-computed rdy_twenty which already includes ~ten_active
    wire sel_rdy_hold = state_is_rdy & ~ten_active & ~twenty_active;
    
    wire sel_bill10_ten = bill10_ten;
    wire sel_bill10_twenty = bill10_twenty & ~ten_active;  // bill10_twenty already includes ~ten_active
    wire sel_bill10_hold = state_is_bill10 & ~ten_active & ~twenty_active;
    
    wire sel_bill20_ten = bill20_ten;
    wire sel_bill20_twenty = bill20_twenty & ~ten_active;  // bill20_twenty already includes ~ten_active
    wire sel_bill20_hold = state_is_bill20 & ~ten_active & ~twenty_active;
    
    wire sel_bill30_ten = bill30_ten;
    wire sel_bill30_twenty = bill30_twenty & ~ten_active;  // bill30_twenty already includes ~ten_active
    wire sel_bill30_hold = state_is_bill30 & ~ten_active & ~twenty_active;
    
    wire sel_disp = state_is_disp;
    wire sel_rtn = state_is_rtn;
    wire sel_default = ~(state_is_rdy | state_is_disp | state_is_rtn | 
                         state_is_bill10 | state_is_bill20 | state_is_bill30);

    // Final next-state mux tree
    wire [5:0] next_state_mux = 
        sel_rdy_ten ? next_state_rdy_ten :
        sel_rdy_twenty ? next_state_rdy_twenty :
        sel_rdy_hold ? next_state_rdy_hold :
        sel_bill10_ten ? next_state_bill10_ten :
        sel_bill10_twenty ? next_state_bill10_twenty :
        sel_bill10_hold ? next_state_bill10_hold :
        sel_bill20_ten ? next_state_bill20_ten :
        sel_bill20_twenty ? next_state_bill20_twenty :
        sel_bill20_hold ? next_state_bill20_hold :
        sel_bill30_ten ? next_state_bill30_ten :
        sel_bill30_twenty ? next_state_bill30_twenty :
        sel_bill30_hold ? next_state_bill30_hold :
        sel_disp ? next_state_disp :
        sel_rtn ? next_state_rtn :
        sel_default ? next_state_default : next_state_default;

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

    // next state logic using mux-select structure
    always @(*) begin
        NextState = next_state_mux;
    end

endmodule