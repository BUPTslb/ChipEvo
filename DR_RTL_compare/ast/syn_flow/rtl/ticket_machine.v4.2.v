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

    // OPTIMIZED: State update with minimal logic depth (L5 assignment-slice for State register)
    always @(posedge clk) begin 
        State <= clear ? RDY : NextState;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // OPTIMIZED: Next state logic using parallel evaluation with balanced mux
    // L5 decomposition: Compute next state for each current state in parallel
    // Then select using balanced mux tree
    reg [5:0] next_state_rdy, next_state_bill10, next_state_bill20, next_state_bill30, next_state_disp, next_state_rtn;
    
    // L5 assignment-slice: Next state for RDY state
    always @(*) begin
        if (ten_active)
            next_state_rdy = BILL10;
        else if (twenty_active)
            next_state_rdy = BILL20;
        else
            next_state_rdy = RDY;
    end
    
    // L5 assignment-slice: Next state for BILL10 state
    always @(*) begin
        if (ten_active)
            next_state_bill10 = BILL20;
        else if (twenty_active)
            next_state_bill10 = BILL30;
        else
            next_state_bill10 = BILL10;
    end
    
    // L5 assignment-slice: Next state for BILL20 state
    always @(*) begin
        if (ten_active)
            next_state_bill20 = BILL30;
        else if (twenty_active)
            next_state_bill20 = DISP;
        else
            next_state_bill20 = BILL20;
    end
    
    // L5 assignment-slice: Next state for BILL30 state
    always @(*) begin
        if (ten_active)
            next_state_bill30 = DISP;
        else if (twenty_active)
            next_state_bill30 = RTN;
        else
            next_state_bill30 = BILL30;
    end
    
    // L5 assignment-slice: Next state for DISP state
    always @(*) begin
        next_state_disp = RDY;
    end
    
    // L5 assignment-slice: Next state for RTN state
    always @(*) begin
        next_state_rtn = RDY;
    end
    
    // OPTIMIZED: Balanced mux tree selection for NextState (L6 expression)
    // Using 2-level balanced mux tree instead of priority encoder
    wire [5:0] mux_level1_0 = state_is_rdy   ? next_state_rdy   : next_state_bill10;
    wire [5:0] mux_level1_1 = state_is_bill20 ? next_state_bill20 : next_state_bill30;
    wire [5:0] mux_level1_2 = state_is_disp   ? next_state_disp   : next_state_rtn;
    
    wire [5:0] mux_level2_0 = state_is_rdy | state_is_bill10 ? mux_level1_0 : mux_level1_1;
    wire [5:0] mux_level2_1 = state_is_bill20 | state_is_bill30 ? mux_level1_1 : mux_level1_2;
    
    assign NextState = (state_is_rdy | state_is_bill10 | state_is_bill20) ? mux_level2_0 : mux_level2_1;

endmodule