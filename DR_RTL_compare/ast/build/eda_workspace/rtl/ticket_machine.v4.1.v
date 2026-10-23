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

    // L6: Direct bit indexing for one-hot state decode
    // Eliminates 6 equality comparators (each ~3 logic levels) by exploiting one-hot encoding
    wire state_is_rdy    = State[0];
    wire state_is_disp   = State[1];
    wire state_is_rtn    = State[2];
    wire state_is_bill10 = State[3];
    wire state_is_bill20 = State[4];
    wire state_is_bill30 = State[5];
    
    // Input condition aliases
    wire ten_active    = ten;
    wire twenty_active = twenty;
    
    // Valid state check for default safety (one-hot guarantees exactly one bit set)
    wire any_valid_state = state_is_rdy | state_is_disp | state_is_rtn 
                         | state_is_bill10 | state_is_bill20 | state_is_bill30;

    // State register update (L5 assignment-slice: target=State, guard=clear)
    always @(posedge clk) begin 
        State <= clear ? RDY : NextState;
    end

    // Output logic (Moore machine)
    always @(*) begin
        ready      = state_is_rdy ? ON : OFF;
        bill       = (state_is_bill10 | state_is_bill20 | state_is_bill30) ? ON : OFF;
        dispense   = state_is_disp ? ON : OFF;
        return_sig = state_is_rtn ? ON : OFF;
    end

    // L5: Next state logic - parallel bit equations for one-hot FSM
    // Replaces priority if-else mux chain with flat AND-OR per bit
    // Each bit: 2-level depth (AND then OR) vs original ~4-level mux tree
    always @(*) begin
        // Bit 0 = RDY: idle stay | dispense done | return done | invalid default
        NextState[0] = state_is_rdy & ~ten_active & ~twenty_active
                     | state_is_disp
                     | state_is_rtn
                     | ~any_valid_state;
        // Bit 1 = DISP: bill20+twenty | bill30+ten
        NextState[1] = state_is_bill20 & twenty_active
                     | state_is_bill30 & ten_active;
        // Bit 2 = RTN: bill30+twenty
        NextState[2] = state_is_bill30 & twenty_active;
        // Bit 3 = BILL10: rdy+ten | bill10 stay
        NextState[3] = state_is_rdy & ten_active
                     | state_is_bill10 & ~ten_active & ~twenty_active;
        // Bit 4 = BILL20: rdy+twenty | bill10+ten | bill20 stay
        NextState[4] = state_is_rdy & ~ten_active & twenty_active
                     | state_is_bill10 & ten_active
                     | state_is_bill20 & ~ten_active & ~twenty_active;
        // Bit 5 = BILL30: bill10+twenty | bill20+ten | bill30 stay
        NextState[5] = state_is_bill10 & ~ten_active & twenty_active
                     | state_is_bill20 & ten_active
                     | state_is_bill30 & ~ten_active & ~twenty_active;
    end

endmodule