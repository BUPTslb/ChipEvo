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
    
    // NEW: Pre-computed clear condition for state update optimization
    wire clear_active = clear;
    wire not_clear = ~clear;

    // OPTIMIZED: State update with pre-computed clear condition
    // This reduces combinational depth in the critical path
    always @(posedge clk) begin 
        // Parallel evaluation of both conditions
        if (clear_active) begin
            State <= RDY;
        end
        // Use else-if for clear/not_clear to maintain priority
        if (not_clear) begin
            State <= NextState;
        end
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // Next state logic using pre-computed combined conditions
    always @(*) begin
        NextState = RDY; // default
        
        // Use pre-computed combined conditions for faster evaluation
        if (rdy_ten)        NextState = BILL10;
        else if (rdy_twenty) NextState = BILL20;
        else if (state_is_rdy) NextState = RDY;
        
        else if (bill10_ten) NextState = BILL20;
        else if (bill10_twenty) NextState = BILL30;
        else if (state_is_bill10) NextState = BILL10;
        
        else if (bill20_ten) NextState = BILL30;
        else if (bill20_twenty) NextState = DISP;
        else if (state_is_bill20) NextState = BILL20;
        
        else if (bill30_ten) NextState = DISP;
        else if (bill30_twenty) NextState = RTN;
        else if (state_is_bill30) NextState = BILL30;
        
        else if (state_is_disp) NextState = RDY;
        else if (state_is_rtn) NextState = RDY;
        else NextState = RDY;
    end

endmodule