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

    // Pre-computed state conditions using direct bit indexing (L6)
    wire state_is_rdy    = State[0];
    wire state_is_disp   = State[1];
    wire state_is_rtn    = State[2];
    wire state_is_bill10 = State[3];
    wire state_is_bill20 = State[4];
    wire state_is_bill30 = State[5];
    
    // Pre-computed input conditions (L5)
    wire ten_active   = ten;
    wire twenty_active = twenty;
    
    // update state on clock rising edge
    always @(posedge clk) begin 
        if (clear)
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

    // next state logic restructured to parallel bit assignments (L5 assignment-slices)
    always @(*) begin
        // Default: stay in current state if no inputs
        NextState[0] = (state_is_rdy & ~ten_active & ~twenty_active) | 
                       state_is_disp | 
                       state_is_rtn;
        NextState[1] = (state_is_bill20 & twenty_active) | 
                       (state_is_bill30 & ten_active);
        NextState[2] = state_is_bill30 & twenty_active;
        NextState[3] = (state_is_rdy & ten_active) | 
                       (state_is_bill10 & ~ten_active & ~twenty_active);
        NextState[4] = (state_is_rdy & twenty_active) | 
                       (state_is_bill10 & ten_active) | 
                       (state_is_bill20 & ~ten_active & ~twenty_active);
        NextState[5] = (state_is_bill10 & twenty_active) | 
                       (state_is_bill20 & ten_active) | 
                       (state_is_bill30 & ~ten_active & ~twenty_active);
    end

endmodule