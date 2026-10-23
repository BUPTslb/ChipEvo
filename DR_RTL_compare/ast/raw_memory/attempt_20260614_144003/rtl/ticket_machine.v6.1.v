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

    reg [5:0] State_A, State_B, NextState;

    // Pre-computed state conditions from State_A for output logic (L5 assignment-slices)
    wire state_is_rdy_a    = (State_A == RDY);
    wire state_is_disp_a   = (State_A == DISP);
    wire state_is_rtn_a    = (State_A == RTN);
    wire state_is_bill10_a = (State_A == BILL10);
    wire state_is_bill20_a = (State_A == BILL20);
    wire state_is_bill30_a = (State_A == BILL30);
    
    // Pre-computed input conditions (L5 assignment-slices)
    wire ten_active   = ten;
    wire twenty_active = twenty;
    
    // OPTIMIZED: State update using register duplication (L5 assignment-slice decomposition)
    // Decomposed the ternary into explicit clear/no-clear paths with dual registers
    // L5 slice 1: clear condition path
    // L5 slice 2: normal next state path
    always @(posedge clk) begin 
        if (clear) begin  // L5 slice: clear condition
            State_A <= RDY;
            State_B <= RDY;
        end else begin    // L5 slice: normal next state
            State_A <= NextState;
            State_B <= NextState;
        end
    end

    // output logic based on State_A (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy_a ? ON : OFF;
        bill       = (state_is_bill10_a | state_is_bill20_a | state_is_bill30_a) ? ON : OFF;
        dispense   = state_is_disp_a ? ON : OFF;
        return_sig = state_is_rtn_a ? ON : OFF;
    end

    // Next state logic using State_B with direct condition computation
    // This reduces fanout on State_A by using a dedicated copy for next state computation
    always @(*) begin
        NextState = RDY; // default
        
        // Compute conditions from State_B directly
        wire state_is_rdy_b    = (State_B == RDY);
        wire state_is_disp_b   = (State_B == DISP);
        wire state_is_rtn_b    = (State_B == RTN);
        wire state_is_bill10_b = (State_B == BILL10);
        wire state_is_bill20_b = (State_B == BILL20);
        wire state_is_bill30_b = (State_B == BILL30);
        
        // Use direct conditions for faster evaluation
        if (state_is_rdy_b && ten)        NextState = BILL10;
        else if (state_is_rdy_b && !ten && twenty) NextState = BILL20;
        else if (state_is_rdy_b) NextState = RDY;
        
        else if (state_is_bill10_b && ten) NextState = BILL20;
        else if (state_is_bill10_b && !ten && twenty) NextState = BILL30;
        else if (state_is_bill10_b) NextState = BILL10;
        
        else if (state_is_bill20_b && ten) NextState = BILL30;
        else if (state_is_bill20_b && !ten && twenty) NextState = DISP;
        else if (state_is_bill20_b) NextState = BILL20;
        
        else if (state_is_bill30_b && ten) NextState = DISP;
        else if (state_is_bill30_b && !ten && twenty) NextState = RTN;
        else if (state_is_bill30_b) NextState = BILL30;
        
        else if (state_is_disp_b) NextState = RDY;
        else if (state_is_rtn_b) NextState = RDY;
        else NextState = RDY;
    end

endmodule