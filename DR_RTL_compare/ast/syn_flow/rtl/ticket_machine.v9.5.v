module ticket_machine #(
    parameter ON  = 1'b1,
    parameter OFF = 1'b0
) (
    input  clk, clear, ten, twenty,
    output reg ready, dispense, return_sig, bill
);

    // One-hot state encoding
    localparam RDY    = 6'b000001,
               DISP   = 6'b000010,
               RTN    = 6'b000100,
               BILL10 = 6'b001000,
               BILL20 = 6'b010000,
               BILL30 = 6'b100000;

    reg [5:0] State, NextState;

    // L6 OPTIMIZATION: Direct bit indexing for one-hot state decode
    // Replaces 6-bit equality comparator (AND-tree) with single-bit read
    wire state_is_rdy    = State[0];  // RDY    = 6'b000001
    wire state_is_disp   = State[1];  // DISP   = 6'b000010
    wire state_is_rtn    = State[2];  // RTN    = 6'b000100
    wire state_is_bill10 = State[3];  // BILL10 = 6'b001000
    wire state_is_bill20 = State[4];  // BILL20 = 6'b010000
    wire state_is_bill30 = State[5];  // BILL30 = 6'b100000

    // L5 OPTIMIZATION: Pre-decode input conditions into mutually exclusive set
    // Computed once, reused across all state transitions
    wire ten_active    = ten;
    wire twenty_active = twenty;
    wire not_ten       = ~ten_active;
    wire ten_goes      = ten_active;               // ten takes priority
    wire twenty_goes   = not_ten & twenty_active;  // twenty only if not ten
    wire idle_hold     = not_ten & ~twenty_active; // neither input

    // L5 OPTIMIZATION: Direct bit-level NextState equations
    // Eliminates 6-bit ternary mux chains (next_from_*); computes each
    // bit of NextState as a 1-bit AND of state_bit & input_condition.
    // Mux depth reduced from 6-bit 2:1 mux to 1-bit gate per output bit.
    always @(*) begin
        NextState = 6'b000000;
        case (1'b1)
            state_is_rdy: begin
                NextState[0] = idle_hold;    // stay RDY
                NextState[3] = ten_goes;     // -> BILL10
                NextState[4] = twenty_goes;  // -> BILL20
            end
            state_is_bill10: begin
                NextState[3] = idle_hold;    // stay BILL10
                NextState[4] = ten_goes;     // -> BILL20
                NextState[5] = twenty_goes;  // -> BILL30
            end
            state_is_bill20: begin
                NextState[4] = idle_hold;    // stay BILL20
                NextState[5] = ten_goes;     // -> BILL30
                NextState[1] = twenty_goes;  // -> DISP
            end
            state_is_bill30: begin
                NextState[5] = idle_hold;    // stay BILL30
                NextState[1] = ten_goes;     // -> DISP
                NextState[2] = twenty_goes;  // -> RTN
            end
            state_is_disp: begin
                NextState[0] = 1'b1;         // -> RDY
            end
            state_is_rtn: begin
                NextState[0] = 1'b1;         // -> RDY
            end
            default: begin
                NextState[0] = 1'b1;         // -> RDY
            end
        endcase
    end

    // L5 OPTIMIZATION: Simplified state register
    // Removed artificial 3-bit carry-select split (not an adder path).
    // Canonical form: single 6-bit 2:1 mux on clear, fed to register.
    always @(posedge clk) begin
        if (clear)
            State <= RDY;
        else
            State <= NextState;
    end

    // Output logic — directly uses bit-indexed state decode (L6 signals)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
    end

endmodule