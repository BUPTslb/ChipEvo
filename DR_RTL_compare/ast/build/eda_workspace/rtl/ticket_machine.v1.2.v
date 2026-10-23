module ticket_machine #(
    parameter ON  = 1'b1,
    parameter OFF = 1'b0
) (
    input  clk, clear, ten, twenty,
    output reg ready, dispense, return_sig, bill
);

    // one-hot state definitions
    localparam RDY    = 6'b000001,
               DISP   = 6'b000010,
               RTN    = 6'b000100,
               BILL10 = 6'b001000,
               BILL20 = 6'b010000,
               BILL30 = 6'b100000;

    reg [5:0] State, NextState;

    // Direct bit indexing for one-hot states (L6 optimization)
    wire state_is_rdy    = State[0];
    wire state_is_disp   = State[1];
    wire state_is_rtn    = State[2];
    wire state_is_bill10 = State[3];
    wire state_is_bill20 = State[4];
    wire state_is_bill30 = State[5];

    // Pre-computed input conditions
    wire ten_active   = ten;
    wire twenty_active = twenty;

    // Next state for each state computed in parallel
    wire [5:0] next_rdy    = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
    wire [5:0] next_bill10 = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
    wire [5:0] next_bill20 = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
    wire [5:0] next_bill30 = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
    wire [5:0] next_disp   = RDY;
    wire [5:0] next_rtn    = RDY;

    // One-hot mux for next state (balanced parallel evaluation)
    wire [5:0] NextState_mux;
    assign NextState_mux = ({6{state_is_rdy}}    & next_rdy)    |
                           ({6{state_is_bill10}} & next_bill10) |
                           ({6{state_is_bill20}} & next_bill20) |
                           ({6{state_is_bill30}} & next_bill30) |
                           ({6{state_is_disp}}   & next_disp)   |
                           ({6{state_is_rtn}}    & next_rtn);

    // State register update
    always @(posedge clk) begin
        if (clear)
            State <= RDY;
        else
            State <= NextState_mux;
    end

    // Output logic (already efficient)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // NextState output (direct from mux)
    always @(*) begin
        NextState = NextState_mux;
    end

endmodule