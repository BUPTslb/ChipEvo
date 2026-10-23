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

    // Pre-computed state conditions using direct bit indexing (L5 assignment-slices)
    // Optimized: direct bit access instead of equality comparison
    wire state_is_rdy    = State[0];  // RDY is bit 0
    wire state_is_disp   = State[1];  // DISP is bit 1
    wire state_is_rtn    = State[2];  // RTN is bit 2
    wire state_is_bill10 = State[3];  // BILL10 is bit 3
    wire state_is_bill20 = State[4];  // BILL20 is bit 4
    wire state_is_bill30 = State[5];  // BILL30 is bit 5
    
    // Pre-computed input conditions (L5 assignment-slices)
    wire ten_active   = ten;
    wire twenty_active = twenty;
    
    // Precomputed state transitions (L5 assignment-slices)
    // Maintain same structure but use optimized state conditions
    wire [5:0] next_from_rdy    = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
    wire [5:0] next_from_bill10 = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
    wire [5:0] next_from_bill20 = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
    wire [5:0] next_from_bill30 = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
    wire [5:0] next_from_disp   = RDY;
    wire [5:0] next_from_rtn    = RDY;

    // State update logic (unchanged)
    wire [2:0] rd_low = RDY[2:0];
    wire [2:0] rd_high = RDY[5:3];
    
    wire [2:0] clear_or_next_low  = clear ? rd_low : NextState[2:0];
    wire [2:0] clear_or_next_high = clear ? rd_high : NextState[5:3];

    always @(posedge clk) begin 
        State[2:0] <= clear_or_next_low;
        State[5:3] <= clear_or_next_high;
    end

    // Output logic using optimized state conditions (L5 assignment-slices)
    // Simplified: direct bit checks instead of OR of multiple conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        // Simplified: bill is ON if any of bits 3,4,5 are set (one-hot guarantees only one)
        bill       = (State[3] | State[4] | State[5]) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // Next state logic (unchanged but uses optimized state conditions)
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