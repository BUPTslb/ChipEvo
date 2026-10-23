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
    wire ten_active    = ten;
    wire twenty_active = twenty;
    wire no_coin       = ~ten_active & ~twenty_active;
    
    // Pre-computed combined conditions (L5 assignment-slices)
    wire rdy_ten      = state_is_rdy & ten_active;
    wire rdy_twenty   = state_is_rdy & ~ten_active & twenty_active;
    wire bill10_ten   = state_is_bill10 & ten_active;
    wire bill10_twenty = state_is_bill10 & ~ten_active & twenty_active;
    wire bill20_ten   = state_is_bill20 & ten_active;
    wire bill20_twenty = state_is_bill20 & ~ten_active & twenty_active;
    wire bill30_ten   = state_is_bill30 & ten_active;
    wire bill30_twenty = state_is_bill30 & ~ten_active & twenty_active;
    
    // Pre-computed next-state conditions (L5 assignment-slices for mux restructuring)
    wire rdy_hold      = state_is_rdy & no_coin;
    wire bill10_hold   = state_is_bill10 & no_coin;
    wire bill20_hold   = state_is_bill20 & no_coin;
    wire bill30_hold   = state_is_bill30 & no_coin;
    
    // OPTIMIZED: Mux tree restructuring for next state - compute all transitions first
    // then select with balanced 2-level mux
    wire [5:0] rdy_next      = rdy_ten ? BILL10 : (rdy_twenty ? BILL20 : RDY);
    wire [5:0] bill10_next   = bill10_ten ? BILL20 : (bill10_twenty ? BILL30 : BILL10);
    wire [5:0] bill20_next   = bill20_ten ? BILL30 : (bill20_twenty ? DISP : BILL20);
    wire [5:0] bill30_next   = bill30_ten ? DISP : (bill30_twenty ? RTN : BILL30);
    
    // Balanced mux tree for next state selection
    wire [5:0] next_state_mux;
    assign next_state_mux = state_is_rdy ? rdy_next :
                           (state_is_bill10 ? bill10_next :
                           (state_is_bill20 ? bill20_next :
                           (state_is_bill30 ? bill30_next : RDY)));

    // State update
    always @(posedge clk) begin 
        if (clear) begin
            State <= RDY;
        end else begin
            State <= next_state_mux;
        end
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // NextState register for compatibility (though not used in state update)
    always @(*) begin
        NextState = next_state_mux;
    end

endmodule