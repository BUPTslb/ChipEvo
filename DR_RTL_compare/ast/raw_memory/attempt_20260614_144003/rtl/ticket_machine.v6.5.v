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

    // State update using L5 assignment-slice decomposition
    always @(posedge clk) begin 
        if (clear) begin
            State <= RDY;
        end else begin
            State <= NextState;
        end
    end

    // output logic based on current state (Moore state machine)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // PARALLEL EVALUATION WITH BALANCED MUX (L5-L6 transform)
    // Instead of nested if-else, compute all branch outcomes in parallel
    // and select with balanced mux structure
    always @(*) begin
        // Compute all possible next state values in parallel (L6 expressions)
        wire [5:0] next_rdy = RDY;  // Default value
        wire [5:0] next_from_rdy_ten = BILL10;
        wire [5:0] next_from_rdy_twenty = BILL20;
        wire [5:0] next_from_rdy_hold = RDY;
        wire [5:0] next_from_bill10_ten = BILL20;
        wire [5:0] next_from_bill10_twenty = BILL30;
        wire [5:0] next_from_bill10_hold = BILL10;
        wire [5:0] next_from_bill20_ten = BILL30;
        wire [5:0] next_from_bill20_twenty = DISP;
        wire [5:0] next_from_bill20_hold = BILL20;
        wire [5:0] next_from_bill30_ten = DISP;
        wire [5:0] next_from_bill30_twenty = RTN;
        wire [5:0] next_from_bill30_hold = BILL30;
        wire [5:0] next_from_disp = RDY;
        wire [5:0] next_from_rtn = RDY;

        // Select based on conditions using balanced mux tree (L5 assignment-slices)
        // First level: select within each state
        wire [5:0] next_rdy_val = rdy_ten ? next_from_rdy_ten : 
                                 (rdy_twenty ? next_from_rdy_twenty : next_from_rdy_hold);
        wire [5:0] next_bill10_val = bill10_ten ? next_from_bill10_ten : 
                                   (bill10_twenty ? next_from_bill10_twenty : next_from_bill10_hold);
        wire [5:0] next_bill20_val = bill20_ten ? next_from_bill20_ten : 
                                   (bill20_twenty ? next_from_bill20_twenty : next_from_bill20_hold);
        wire [5:0] next_bill30_val = bill30_ten ? next_from_bill30_ten : 
                                   (bill30_twenty ? next_from_bill30_twenty : next_from_bill30_hold);

        // Second level: select between states (balanced mux)
        wire [5:0] next_state_mux1 = state_is_rdy ? next_rdy_val : next_bill10_val;
        wire [5:0] next_state_mux2 = state_is_bill20 ? next_bill20_val : next_bill30_val;
        wire [5:0] next_state_mux3 = state_is_disp ? next_from_disp : 
                                    (state_is_rtn ? next_from_rtn : next_rdy);

        // Final mux
        NextState = (state_is_rdy | state_is_bill10) ? next_state_mux1 : 
                   ((state_is_bill20 | state_is_bill30) ? next_state_mux2 : next_state_mux3);
    end

endmodule