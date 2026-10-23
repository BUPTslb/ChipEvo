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

    // update state on clock rising edge
    always @(posedge clk) begin 
        if (clear)
            State <= RDY;
        else
            State <= NextState;
    end

    // --- Pre-decoded one-hot state bits (L6: direct bit indexing) ---
    wire st_rdy    = State[0];
    wire st_disp   = State[1];
    wire st_rtn    = State[2];
    wire st_bill10 = State[3];
    wire st_bill20 = State[4];
    wire st_bill30 = State[5];

    // --- Pre-computed condition combinations (L5–L6: condition_precompute) ---
    wire disp_or_rtn      = st_disp | st_rtn;          // states that auto-return to RDY
    wire rdy_and_ten      = st_rdy    & ten;
    wire rdy_and_twenty   = st_rdy    & twenty;
    wire bill10_and_ten   = st_bill10 & ten;
    wire bill10_and_twenty = st_bill10 & twenty;
    wire bill20_and_ten   = st_bill20 & ten;
    wire bill20_and_twenty = st_bill20 & twenty;
    wire bill30_and_ten   = st_bill30 & ten;
    wire bill30_and_twenty = st_bill30 & twenty;

    // next state logic (L5: flat bit assignments with precomputed conditions)
    always @(State or ten or twenty) begin
        // Bit 0 — RDY: set when returning from DISP/RTN, or holding in RDY with no input
        NextState[0] = disp_or_rtn ? 1'b1
                       : st_rdy ? ~rdy_and_ten & ~rdy_and_twenty
                       : 1'b0;
        // Bit 1 — DISP: set when BILL20 receives twenty or BILL30 receives ten
        NextState[1] = bill20_and_twenty | bill30_and_ten;
        // Bit 2 — RTN: set when BILL30 receives twenty
        NextState[2] = bill30_and_twenty;
        // Bit 3 — BILL10: set when RDY receives ten
        NextState[3] = rdy_and_ten;
        // Bit 4 — BILL20: set when RDY receives twenty or BILL10 receives ten
        NextState[4] = rdy_and_twenty | bill10_and_ten;
        // Bit 5 — BILL30: set when BILL10 receives twenty or BILL20 receives ten
        NextState[5] = bill10_and_twenty | bill20_and_ten;
    end

    // output logic based on current state (Moore state machine)
    always @(State) begin
        case (State)
            RDY:    begin
                ready     = ON;
                bill      = OFF;
                dispense  = OFF;
                return_sig = OFF;
            end

            DISP:   begin
                ready     = OFF;
                bill      = OFF;
                dispense  = ON;
                return_sig = OFF;
            end

            RTN:    begin
                ready     = OFF;
                bill      = OFF;
                dispense  = OFF;
                return_sig = ON;
            end

            BILL10: begin
                ready     = OFF;
                bill      = ON;
                dispense  = OFF;
                return_sig = OFF;
            end

            BILL20: begin
                ready     = OFF;
                bill      = ON;
                dispense  = OFF;
                return_sig = OFF;
            end

            BILL30: begin
                ready     = OFF;
                bill      = ON;
                dispense  = OFF;
                return_sig = OFF;
            end

            default: begin
                ready     = OFF;
                bill      = OFF;
                dispense  = OFF;
                return_sig = OFF;
            end
        endcase
    end

endmodule