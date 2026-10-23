module ticket_machine #(
    parameter ON  = 1'b1,
    parameter OFF = 1'b0
) (
    input  clk, clear, ten, twenty,
    output reg ready, dispense, return_sig, bill
);

    // one-hot state encoding
    localparam RDY    = 6'b000001,
               DISP   = 6'b000010,
               RTN    = 6'b000100,
               BILL10 = 6'b001000,
               BILL20 = 6'b010000,
               BILL30 = 6'b100000;

    reg [5:0] State, NextState;

    // L5 assignment-slices: direct indexing for one-hot state (replaces equality comparisons)
    wire state_is_rdy    = State[0];  // RDY
    wire state_is_disp   = State[1];  // DISP
    wire state_is_rtn    = State[2];  // RTN
    wire state_is_bill10 = State[3];  // BILL10
    wire state_is_bill20 = State[4];  // BILL20
    wire state_is_bill30 = State[5];  // BILL30

    // L5 assignment-slices: removed intermediate ten_active/twenty_active wires
    // Pre-computed state transitions using direct input signals
    wire [5:0] next_from_rdy    = ten ? BILL10 : (twenty ? BILL20 : RDY);
    wire [5:0] next_from_bill10 = ten ? BILL20 : (twenty ? BILL30 : BILL10);
    wire [5:0] next_from_bill20 = ten ? BILL30 : (twenty ? DISP   : BILL20);
    wire [5:0] next_from_bill30 = ten ? DISP   : (twenty ? RTN    : BILL30);
    wire [5:0] next_from_disp   = RDY;
    wire [5:0] next_from_rtn    = RDY;

    // L5 assignment-slice: clear mux value
    wire [5:0] clear_or_next = clear ? RDY : NextState;

    // State update using precomputed mux (L5)
    always @(posedge clk) begin 
        State <= clear_or_next;
    end

    // Output logic using direct-indexed state conditions (L5)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // Next state logic using precomputed transitions (L5)
    always @(*) begin
        case (1'b1)
            state_is_rdy:    NextState = next_from_rdy;
            state_is_bill10: NextState = next_from_bill10;
            state_is_bill20: NextState = next_from_bill20;
            state_is_bill30: NextState = next_from_bill30;
            state_is_disp:   NextState = next_from_disp;
            state_is_rtn:    NextState = next_from_rtn;
            default:         NextState = RDY;
        endcase
    end

endmodule