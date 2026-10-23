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

    // Precomputed conditions for next state logic
    wire state_is_rdy    = (State == RDY);
    wire state_is_bill10 = (State == BILL10);
    wire state_is_bill20 = (State == BILL20);
    wire state_is_bill30 = (State == BILL30);
    wire state_is_disp   = (State == DISP);
    wire state_is_rtn    = (State == RTN);
    
    // Condition precomputations for transitions
    wire rdy_ten         = state_is_rdy & ten;
    wire rdy_twenty      = state_is_rdy & twenty;
    wire bill10_ten      = state_is_bill10 & ten;
    wire bill10_twenty   = state_is_bill10 & twenty;
    wire bill20_ten      = state_is_bill20 & ten;
    wire bill20_twenty   = state_is_bill20 & twenty;
    wire bill30_ten      = state_is_bill30 & ten;
    wire bill30_twenty   = state_is_bill30 & twenty;
    
    // Mux tree restructuring for next state
    always @(*) begin
        // Default: stay in current state
        NextState = State;
        
        // BILL10 transitions
        if (bill10_ten)
            NextState = BILL20;
        else if (bill10_twenty)
            NextState = BILL30;
        
        // BILL20 transitions
        if (bill20_ten)
            NextState = BILL30;
        else if (bill20_twenty)
            NextState = DISP;
        
        // BILL30 transitions
        if (bill30_ten)
            NextState = DISP;
        else if (bill30_twenty)
            NextState = RTN;
        
        // RDY transitions
        if (rdy_ten)
            NextState = BILL10;
        else if (rdy_twenty)
            NextState = BILL20;
        
        // DISP and RTN always go back to RDY
        if (state_is_disp | state_is_rtn)
            NextState = RDY;
    end

endmodule