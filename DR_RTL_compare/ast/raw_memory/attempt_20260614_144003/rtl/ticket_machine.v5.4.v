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

    // OPTIMIZED: State update using L5 assignment-slice decomposition
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

    // OPTIMIZED: next state logic using case statement with nested ternaries
    // Decomposed into L5 assignment-slices per state with mux-tree restructure
    always @(*) begin
        case (State)
            RDY:    NextState = ten_active ? BILL10 : twenty_active ? BILL20 : RDY;
            BILL10: NextState = ten_active ? BILL20 : twenty_active ? BILL30 : BILL10;
            BILL20: NextState = ten_active ? BILL30 : twenty_active ? DISP : BILL20;
            BILL30: NextState = ten_active ? DISP : twenty_active ? RTN : BILL30;
            DISP:   NextState = RDY;
            RTN:    NextState = RDY;
            default: NextState = RDY;
        endcase
    end

endmodule