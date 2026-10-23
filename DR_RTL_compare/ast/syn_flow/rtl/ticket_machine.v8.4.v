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

    // Precomputed state transitions (mux_tree_restructure at L5)
    // Flattened ternaries into precomputed conditions
    wire [5:0] next_from_rdy    = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
    wire [5:0] next_from_bill10 = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
    wire [5:0] next_from_bill20 = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
    wire [5:0] next_from_bill30 = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
    wire [5:0] next_from_disp   = RDY;
    wire [5:0] next_from_rtn    = RDY;

    // Precomputed clear mux value (condition_precompute at L5)
    wire [5:0] clear_or_next = clear ? RDY : NextState;

    // OPTIMIZED: State update using precomputed mux (L5 assignment-slice)
    always @(posedge clk) begin 
        State <= clear_or_next;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // L5 OPTIMIZATION: Restructured NextState assignment using balanced mux tree
    // Instead of case statement, use parallel selection with precomputed state conditions
    wire [5:0] next_state_sel0 = state_is_rdy ? next_from_rdy : 6'b0;
    wire [5:0] next_state_sel1 = state_is_bill10 ? next_from_bill10 : 6'b0;
    wire [5:0] next_state_sel2 = state_is_bill20 ? next_from_bill20 : 6'b0;
    wire [5:0] next_state_sel3 = state_is_bill30 ? next_from_bill30 : 6'b0;
    wire [5:0] next_state_sel4 = state_is_disp ? next_from_disp : 6'b0;
    wire [5:0] next_state_sel5 = state_is_rtn ? next_from_rtn : 6'b0;

    // Combine selections using balanced OR tree
    wire [5:0] next_state_or0 = next_state_sel0 | next_state_sel1;
    wire [5:0] next_state_or1 = next_state_sel2 | next_state_sel3;
    wire [5:0] next_state_or2 = next_state_sel4 | next_state_sel5;
    wire [5:0] next_state_or3 = next_state_or0 | next_state_or1;
    
    always @(*) begin
        NextState = next_state_or3 | next_state_or2;
        // Default case when no state matches (should not happen with one-hot)
        if (NextState == 6'b0)
            NextState = RDY;
    end

endmodule