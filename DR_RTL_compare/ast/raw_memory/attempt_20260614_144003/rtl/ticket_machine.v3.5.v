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

    // Pre-computed next state for each state (L5 assignment-slices for mux tree restructuring)
    // RDY next state (3:1 mux balanced tree)
    wire [5:0] rdy_ten_next   = BILL10;
    wire [5:0] rdy_twenty_next = BILL20;
    wire [5:0] rdy_hold        = RDY;
    wire [5:0] next_state_rdy  = ten_active ? rdy_ten_next : 
                                (twenty_active ? rdy_twenty_next : rdy_hold);
    
    // BILL10 next state (3:1 mux balanced tree)
    wire [5:0] bill10_ten_next   = BILL20;
    wire [5:0] bill10_twenty_next = BILL30;
    wire [5:0] bill10_hold        = BILL10;
    wire [5:0] next_state_bill10 = ten_active ? bill10_ten_next : 
                                  (twenty_active ? bill10_twenty_next : bill10_hold);
    
    // BILL20 next state (3:1 mux balanced tree)
    wire [5:0] bill20_ten_next   = BILL30;
    wire [5:0] bill20_twenty_next = DISP;
    wire [5:0] bill20_hold        = BILL20;
    wire [5:0] next_state_bill20 = ten_active ? bill20_ten_next : 
                                  (twenty_active ? bill20_twenty_next : bill20_hold);
    
    // BILL30 next state (3:1 mux balanced tree)
    wire [5:0] bill30_ten_next   = DISP;
    wire [5:0] bill30_twenty_next = RTN;
    wire [5:0] bill30_hold        = BILL30;
    wire [5:0] next_state_bill30 = ten_active ? bill30_ten_next : 
                                  (twenty_active ? bill30_twenty_next : bill30_hold);
    
    // DISP and RTN next states (always RDY)
    wire [5:0] next_state_disp = RDY;
    wire [5:0] next_state_rtn  = RDY;

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

    // next state logic using pre-computed conditions and balanced mux trees
    always @(*) begin
        NextState = {6{1'b0}};
        
        // Mux tree restructuring: select next state based on current state
        // Each state bit selects its next state computation
        NextState = NextState | (state_is_rdy    ? next_state_rdy    : {6{1'b0}});
        NextState = NextState | (state_is_bill10 ? next_state_bill10 : {6{1'b0}});
        NextState = NextState | (state_is_bill20 ? next_state_bill20 : {6{1'b0}});
        NextState = NextState | (state_is_bill30 ? next_state_bill30 : {6{1'b0}});
        NextState = NextState | (state_is_disp   ? next_state_disp   : {6{1'b0}});
        NextState = NextState | (state_is_rtn    ? next_state_rtn    : {6{1'b0}});
    end

endmodule