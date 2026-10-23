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

    // ---------------------------------------------------------------
    // L5: State one-hot decode (direct bit indexing, pattern #4)
    // ---------------------------------------------------------------
    wire state_is_rdy    = State[0];
    wire state_is_disp   = State[1];
    wire state_is_rtn    = State[2];
    wire state_is_bill10 = State[3];
    wire state_is_bill20 = State[4];
    wire state_is_bill30 = State[5];

    // ---------------------------------------------------------------
    // L5: Input one-hot decode (patterns #1, #3)
    // Inputs ten/twenty are mutually exclusive in protocol
    // ---------------------------------------------------------------
    wire ten_active    = ten;
    wire twenty_active = twenty & ~ten;   // one-hot guarantee
    wire no_input      = ~ten & ~twenty;

    // ---------------------------------------------------------------
    // L5: Combined state×input conditions (pattern #2)
    // Each term is unique — no priority needed
    // ---------------------------------------------------------------
    wire rdy_ten       = state_is_rdy    & ten_active;
    wire rdy_twenty    = state_is_rdy    & twenty_active;
    wire rdy_none      = state_is_rdy    & no_input;

    wire bill10_ten    = state_is_bill10 & ten_active;
    wire bill10_twenty = state_is_bill10 & twenty_active;

    wire bill20_ten    = state_is_bill20 & ten_active;
    wire bill20_twenty = state_is_bill20 & twenty_active;

    wire bill30_ten    = state_is_bill30 & ten_active;
    wire bill30_twenty = state_is_bill30 & twenty_active;

    wire disp_or_rtn   = state_is_disp | state_is_rtn;

    // ---------------------------------------------------------------
    // L5: State register — clear path (sequential, safe L5 slice)
    // ---------------------------------------------------------------
    always @(posedge clk) begin
        if (clear)
            State <= RDY;
        else
            State <= NextState;
    end

    // ---------------------------------------------------------------
    // L5: Output logic — direct bit assignment (Moore)
    //   Pattern #4: state_is_rdy = State[0], etc.
    // ---------------------------------------------------------------
    always @(*) begin
        ready      = state_is_rdy    ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp   ? ON : OFF;
        return_sig = state_is_rtn    ? ON : OFF;
    end

    // ---------------------------------------------------------------
    // L5: NextState — direct AND-OR bit equations (pattern #11)
    //   Eliminates if-else priority mux chain.
    //   Each bit is an OR of mutually-exclusive contributing terms.
    // ---------------------------------------------------------------
    // RDY    : idle with no input, or exiting DISP/RTN
    // BILL10 : entering from RDY+ten
    // BILL20 : entering from RDY+twenty or BILL10+ten
    // BILL30 : entering from BILL10+twenty or BILL20+ten
    // DISP   : entering from BILL20+twenty or BILL30+ten
    // RTN    : entering from BILL30+twenty
    always @(*) begin
        NextState[0] = rdy_none | disp_or_rtn;                // RDY
        NextState[1] = rdy_ten;                                // BILL10
        NextState[2] = rdy_twenty | bill10_ten;                // BILL20
        NextState[3] = bill10_twenty | bill20_ten;             // BILL30
        NextState[4] = bill20_twenty | bill30_ten;             // DISP
        NextState[5] = bill30_twenty;                          // RTN
    end

endmodule