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
    
    // Pre-computed combined conditions (L5 assignment-slices)
    wire rdy_ten     = state_is_rdy & ten_active;
    wire rdy_twenty  = state_is_rdy & ~ten_active & twenty_active;
    wire bill10_ten  = state_is_bill10 & ten_active;
    wire bill10_twenty = state_is_bill10 & ~ten_active & twenty_active;
    wire bill20_ten  = state_is_bill20 & ten_active;
    wire bill20_twenty = state_is_bill20 & ~ten_active & twenty_active;
    wire bill30_ten  = state_is_bill30 & ten_active;
    wire bill30_twenty = state_is_bill30 & ~ten_active & twenty_active;

    // OPTIMIZED: State update using L5 assignment-slice decomposition
    // Decomposed the ternary into explicit clear/no-clear paths
    always @(posedge clk) begin 
        if (clear) begin  // L5 slice: clear condition
            State <= RDY;
        end else begin    // L5 slice: normal next state
            State <= NextState;
        end
    end

    // output logic based on current state (Moore state machine) - using pre-computed conditions
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // OPTIMIZED: next state logic using one-hot case statement (L5 restructuring)
    always @(*) begin
        NextState = RDY; // default
        case (1'b1)
            state_is_rdy: begin
                if (ten_active)
                    NextState = BILL10;
                else if (twenty_active)
                    NextState = BILL20;
                else
                    NextState = RDY;
            end
            state_is_bill10: begin
                if (ten_active)
                    NextState = BILL20;
                else if (twenty_active)
                    NextState = BILL30;
                else
                    NextState = BILL10;
            end
            state_is_bill20: begin
                if (ten_active)
                    NextState = BILL30;
                else if (twenty_active)
                    NextState = DISP;
                else
                    NextState = BILL20;
            end
            state_is_bill30: begin
                if (ten_active)
                    NextState = DISP;
                else if (twenty_active)
                    NextState = RTN;
                else
                    NextState = BILL30;
            end
            state_is_disp: begin
                NextState = RDY;
            end
            state_is_rtn: begin
                NextState = RDY;
            end
            default: begin
                NextState = RDY;
            end
        endcase
    end

endmodule