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

    // Precompute one-hot state decode signals (condition_precompute)
    wire state_is_rdy    = (State == RDY);
    wire state_is_disp   = (State == DISP);
    wire state_is_rtn    = (State == RTN);
    wire state_is_bill10 = (State == BILL10);
    wire state_is_bill20 = (State == BILL20);
    wire state_is_bill30 = (State == BILL30);

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

    // next state logic - using precomputed state conditions (condition_precompute)
    always @(State or ten or twenty) begin
        // Default: stay in current state
        NextState = State;
        
        // RDY state transitions (L5 slice 1)
        if (state_is_rdy) begin
            if (ten)
                NextState = BILL10;
            else if (twenty)
                NextState = BILL20;
        end
        // BILL10 state transitions (L5 slice 2)
        else if (state_is_bill10) begin
            if (ten)
                NextState = BILL20;
            else if (twenty)
                NextState = BILL30;
        end
        // BILL20 state transitions (L5 slice 3)
        else if (state_is_bill20) begin
            if (ten)
                NextState = BILL30;
            else if (twenty)
                NextState = DISP;
        end
        // BILL30 state transitions (L5 slice 4)
        else if (state_is_bill30) begin
            if (ten)
                NextState = DISP;
            else if (twenty)
                NextState = RTN;
        end
        // DISP/RTN state transitions (L5 slice 5)
        else if (state_is_disp || state_is_rtn) begin
            NextState = RDY;
        end
        // default case already handled by initial assignment
    end

endmodule