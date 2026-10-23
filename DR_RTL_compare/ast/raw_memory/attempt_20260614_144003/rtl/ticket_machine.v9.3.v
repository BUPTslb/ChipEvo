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

    // DIRECT BIT-INDEXING for one-hot state decode (L6 transform)
    // Eliminates comparator gate level — State is one-hot by construction
    wire state_is_rdy    = State[0];  // RDY = 6'b000001
    wire state_is_disp   = State[1];  // DISP = 6'b000010
    wire state_is_rtn    = State[2];  // RTN = 6'b000100
    wire state_is_bill10 = State[3];  // BILL10 = 6'b001000
    wire state_is_bill20 = State[4];  // BILL20 = 6'b010000
    wire state_is_bill30 = State[5];  // BILL30 = 6'b100000

    // Pre-computed input conditions (L5 assignment-slices)
    wire ten_active    = ten;
    wire twenty_active = twenty;

    // Pre-computed combined conditions (L5 assignment-slices)
    wire rdy_ten       = state_is_rdy & ten_active;
    wire rdy_twenty    = state_is_rdy & ~ten_active & twenty_active;
    wire bill10_ten    = state_is_bill10 & ten_active;
    wire bill10_twenty = state_is_bill10 & ~ten_active & twenty_active;
    wire bill20_ten    = state_is_bill20 & ten_active;
    wire bill20_twenty = state_is_bill20 & ~ten_active & twenty_active;
    wire bill30_ten    = state_is_bill30 & ten_active;
    wire bill30_twenty = state_is_bill30 & ~ten_active & twenty_active;

    // Precomputed state transitions (mux_tree_restructure at L5)
    // Flattened ternaries into precomputed conditions
    wire [5:0] next_from_rdy    = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
    wire [5:0] next_from_bill10 = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
    wire [5:0] next_from_bill20 = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
    wire [5:0] next_from_bill30 = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
    wire [5:0] next_from_disp   = RDY;
    wire [5:0] next_from_rtn    = RDY;

    // L5 DECOMPOSITION: State register update split into two 3-bit slices
    // Each slice is an independent L5 assignment-slice (target + guard + RHS)
    //
    // Slice 1: State[2:0] — guarded by clear, with constant clear-value 3'b001
    // Slice 2: State[5:3] — guarded by clear, with constant clear-value 3'b000
    //
    // Precomputed clear mux values at L5 for parallel 3-bit update
    wire [2:0] clear_or_next_low  = clear ? 3'b001 : NextState[2:0];   // RDY[2:0]
    wire [2:0] clear_or_next_high = clear ? 3'b000 : NextState[5:3];   // RDY[5:3]

    // L5 slice 1: State[2:0] update
    // L5 slice 2: State[5:3] update
    always @(posedge clk) begin
        State[2:0] <= clear_or_next_low;
        State[5:3] <= clear_or_next_high;
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // RESTRUCTURED: Next state logic using precomputed transitions
    // Direct assignment from precomputed state values via one-hot case
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