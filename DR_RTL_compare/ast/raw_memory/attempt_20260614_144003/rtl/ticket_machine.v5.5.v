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

    // Pre-computed next-state mux selects (L5 assignment-slices)
    // Mux tree: state × input combination
    wire sel_rdy_ten      = rdy_ten;
    wire sel_rdy_twenty   = rdy_twenty;
    wire sel_bill10_ten   = bill10_ten;
    wire sel_bill10_twenty = bill10_twenty;
    wire sel_bill20_ten   = bill20_ten;
    wire sel_bill20_twenty = bill20_twenty;
    wire sel_bill30_ten   = bill30_ten;
    wire sel_bill30_twenty = bill30_twenty;
    wire sel_disp         = state_is_disp;
    wire sel_rtn          = state_is_rtn;

    // State update using L5 assignment-slice decomposition
    always @(posedge clk) begin 
        if (clear) begin  // L5 slice: clear condition
            State <= RDY;
        end else begin    // L5 slice: normal next state
            State <= NextState;
        end
    end

    // output logic - direct assignments using pre-computed state conditions
    always @(*) begin
        ready      = state_is_rdy;
        bill       = state_is_bill10 | state_is_bill20 | state_is_bill30;
        dispense   = state_is_disp;
        return_sig = state_is_rtn;
    end

    // next state logic - restructured mux tree
    always @(*) begin
        // Default: maintain current state
        NextState = State;
        
        // Parallel mux tree: compute next states in parallel
        if (sel_rdy_ten)      NextState = BILL10;
        if (sel_rdy_twenty)   NextState = BILL20;
        if (sel_bill10_ten)   NextState = BILL20;
        if (sel_bill10_twenty) NextState = BILL30;
        if (sel_bill20_ten)   NextState = BILL30;
        if (sel_bill20_twenty) NextState = DISP;
        if (sel_bill30_ten)   NextState = DISP;
        if (sel_bill30_twenty) NextState = RTN;
        if (sel_disp)         NextState = RDY;
        if (sel_rtn)          NextState = RDY;
    end

endmodule