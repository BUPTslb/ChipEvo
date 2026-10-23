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

    // Pre-computed next state candidates (L5 assignment-slices)
    wire [5:0] next_rdy    = rdy_ten ? BILL10 : (rdy_twenty ? BILL20 : RDY);
    wire [5:0] next_bill10 = bill10_ten ? BILL20 : (bill10_twenty ? BILL30 : BILL10);
    wire [5:0] next_bill20 = bill20_ten ? BILL30 : (bill20_twenty ? DISP : BILL20);
    wire [5:0] next_bill30 = bill30_ten ? DISP : (bill30_twenty ? RTN : BILL30);

    // OPTIMIZED: Ternary mux for state update (L5 assignment-slice for State register)
    always @(posedge clk) begin 
        State <= clear_active ? RDY : NextState;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // next state logic using pre-computed next state candidates (L5 parallel mux structure)
    always @(*) begin
        NextState = state_is_rdy    ? next_rdy :
                    state_is_bill10 ? next_bill10 :
                    state_is_bill20 ? next_bill20 :
                    state_is_bill30 ? next_bill30 :
                    state_is_disp   ? RDY :
                    state_is_rtn    ? RDY : RDY;
    end

endmodule