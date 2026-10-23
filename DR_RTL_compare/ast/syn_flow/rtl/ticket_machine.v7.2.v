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

    // Direct indexing for one-hot state bits (L6 expression optimization)
    wire state_is_rdy    = State[0];
    wire state_is_disp   = State[1];
    wire state_is_rtn    = State[2];
    wire state_is_bill10 = State[3];
    wire state_is_bill20 = State[4];
    wire state_is_bill30 = State[5];
    
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

    // Output logic using direct state bit indexing (L6 optimization)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // Next state logic with direct indexing (L5/L6 optimization)
    always @(*) begin
        case (1'b1)
            state_is_rdy:    NextState = ten_active ? BILL10 : (twenty_active ? BILL20 : RDY);
            state_is_bill10: NextState = ten_active ? BILL20 : (twenty_active ? BILL30 : BILL10);
            state_is_bill20: NextState = ten_active ? BILL30 : (twenty_active ? DISP   : BILL20);
            state_is_bill30: NextState = ten_active ? DISP   : (twenty_active ? RTN    : BILL30);
            state_is_disp:   NextState = RDY;
            state_is_rtn:    NextState = RDY;
            default:         NextState = RDY;
        endcase
    end

endmodule