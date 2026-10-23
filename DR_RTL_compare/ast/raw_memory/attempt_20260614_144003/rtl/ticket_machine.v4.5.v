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
    wire clear_for_state = clear;  // Direct connection to minimize logic depth

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

    // L5 assignment-slices for next state vectors (mux-tree restructuring)
    wire [5:0] next_rdy_vector    = ten ? BILL10 : (twenty ? BILL20 : RDY);
    wire [5:0] next_bill10_vector = ten ? BILL20 : (twenty ? BILL30 : BILL10);
    wire [5:0] next_bill20_vector = ten ? BILL30 : (twenty ? DISP : BILL20);
    wire [5:0] next_bill30_vector = ten ? DISP : (twenty ? RTN : BILL30);
    wire [5:0] next_disp_vector   = RDY;
    wire [5:0] next_rtn_vector    = RDY;

    // Final next state selection using OR of active state's vector (L5 assignment-slice)
    NextState = (state_is_rdy    ? next_rdy_vector    : 6'b0) |
                (state_is_bill10 ? next_bill10_vector : 6'b0) |
                (state_is_bill20 ? next_bill20_vector : 6'b0) |
                (state_is_bill30 ? next_bill30_vector : 6'b0) |
                (state_is_disp   ? next_disp_vector   : 6'b0) |
                (state_is_rtn    ? next_rtn_vector    : 6'b0);

endmodule