module spi (
    input wire clk,
    input wire rst,
    input wire [2:0] addr,
    input wire we,
    input wire [31:0] write_data,
    input wire re,
    output reg [31:0] read_data
);
    
    // Register Interface

    localparam ENABLE = 3'b000;
    localparam COMMAND = 3'b001;
    localparam ADDRESS = 3'b010;
    localparam DATA_IN = 3'b011;
    localparam DATA_OUT = 3'b100;
    
    reg enable;
    reg [7:0] command;
    reg [23:0] address;
    reg [31:0] data_in;
    wire [31:0] data_out;

    always @(*) begin
        if (rst) begin
            enable = 0;
            command = 0;
            address = 0;
            data_in = 0;
        end
        else begin
            case (addr)
                ENABLE: begin
                    if (we == 1'b1) begin
                        enable = write_data[0];
                    end
                end
                COMMAND: begin
                    if (we == 1'b1) begin
                        command = write_data[7:0];
                    end
                end
                ADDRESS: begin
                    if (we == 1'b1) begin
                        address = write_data[23:0];
                    end
                end
                DATA_IN: begin
                    if (we == 1'b1) begin
                        data_in = write_data[31:0];
                    end
                end
                DATA_OUT: begin
                    if (re == 1'b1) begin
                        read_data = data_out;
                    end
                end
                // default: 
            endcase
        end
    end

    // Master Slave Interface

    wire cs;
    wire sck;
    wire mosi;
    wire miso;

    spi_master uut_master (
        .clk (clk),
        .rst (rst),
        .en (enable),
        .cs (cs),
        .sck (sck),
        .ext_command_in (command),
        .ext_address_in (address),
        .ext_data_in (data_in),
        .mosi (mosi),
        .miso (miso),
        .ext_data_out (data_out)
    );

    spi_slave uut_slave (
        .clk (clk),
        .rst (rst),
        .cs (cs),
        .sck (sck),
        .mosi (mosi),
        .miso (miso)
    );

endmodule


module spi_master (
    input wire clk,
    input wire rst,
    // Chip Select
    input wire en,
    output reg cs,
    // Serial Clock
    output reg sck,
    // Master Out Slave In
    input wire [7:0] ext_command_in,
    input wire [23:0] ext_address_in,
    input wire [31:0] ext_data_in,
    output reg mosi,
    // Master In Slave Out
    input wire miso,
    output wire [31:0] ext_data_out
);
    
    // Serial Clock
    localparam IDLE = 2'b00;
    localparam ENABLE = 2'b01;
    localparam DATA = 2'b10;

    reg [1:0] current_state, next_state;
    reg clock_count;

    always @(posedge clk) begin
        if (rst) begin
            clock_count <= 0;
        end
        else begin
            if ((current_state == ENABLE) || (current_state == DATA)) begin
                clock_count <= clock_count + 1;
            end
            else begin
                clock_count <= 0;
            end
        end
    end

    // Master Out Slave In

    reg [63:0] data_save;
    reg [5:0] data_count;
    reg data_end;

    // Precompute conditions for data_save update (L6)
    wire cmd_is_zero = (ext_command_in == 8'h00);
    wire state_is_data = (current_state == DATA);
    wire sck_high = (sck == 1'b1);
    wire count_is_max = (data_count == 6'd63);

    // Optimized data_count update logic with balanced condition trees
    // Precompute balanced reset conditions (L5-L6)
    wire reset_by_rst = rst;
    wire reset_by_non_data = ~state_is_data & ~rst;
    wire reset_by_count_max = state_is_data & sck_high & count_is_max;
    wire data_count_reset = reset_by_rst | reset_by_non_data | reset_by_count_max;
    
    // Precompute increment condition (L6)
    wire data_count_inc = state_is_data & sck_high & ~count_is_max;
    
    // Compute next value with balanced mux tree (L5)
    wire [5:0] data_count_plus1 = data_count + 6'd1;
    wire [5:0] data_count_next = data_count_reset ? 6'd0 : 
                                 data_count_inc ? data_count_plus1 : 
                                 data_count;

    always @(posedge clk) begin
        if (rst) begin
            data_save <= 0;
            data_count <= 0;
            data_end <= 0;
        end
        else begin
            // Data_count update with optimized condition tree
            data_count <= data_count_next;
            
            // data_end update
            data_end <= state_is_data & sck_high & count_is_max;
            
            // data_save update
            if (state_is_data) begin
                if (sck_high) begin
                    data_save <= {data_save[62:0],1'b0};
                end
                else begin
                    data_save <= data_save;
                end
            end
            else begin
                if (cmd_is_zero) begin
                    data_save <= {ext_command_in,ext_address_in,ext_data_in};
                end
                else begin
                    data_save <= {ext_command_in,ext_address_in,32'h0000_0000};
                end
            end
        end
    end

    // Master In Slave Out

    reg [31:0] data_in;

    // Precompute conditions for data_in update (L6) - Simplified to bit slice
    wire state_is_data_in = (current_state == DATA);
    wire sck_low = (sck == 1'b0);
    // Simplified: data_count >= 32 is equivalent to data_count[5] == 1
    wire count_in_data_range = data_count[5];

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
            if (state_is_data_in) begin
                if (sck_low) begin
                    // Data being saved from MISO line from LSB
                    if (count_in_data_range) begin
                        data_in <= {data_in[30:0],miso};
                    end
                    else begin
                        data_in <= data_in;
                    end
                end
                else begin
                    data_in <= data_in;
                end
            end
            else begin
                
            end
        end
    end

    assign ext_data_out = data_in;
    
    // Finite State Machine - Optimized with condition precomputation

    // Precompute state conditions (L6)
    wire state_is_idle = (current_state == IDLE);
    wire state_is_enable = (current_state == ENABLE);
    wire state_is_data_fsm = (current_state == DATA);

    // Next state logic (L5 assignment-slice for next_state)
    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end else begin
            case (1'b1)
                state_is_idle: next_state = en ? ENABLE : IDLE;
                state_is_enable: next_state = DATA;
                state_is_data_fsm: next_state = data_end ? IDLE : DATA;
                default: next_state = IDLE;
            endcase
        end
    end

    // Output logic - Balanced mux tree for sck signal (L5-L6)
    // Precompute sck values for each state
    wire sck_val_idle = 1'b1;
    wire sck_val_enable = ~clock_count;
    wire sck_val_data = data_end ? 1'b1 : ~clock_count;
    
    // Balanced 2-level mux tree for sck selection
    wire sck_sel_idle = state_is_idle;
    wire sck_sel_enable = state_is_enable;
    wire sck_sel_data = state_is_data_fsm;
    
    // Level 1: Pairwise selection
    wire sck_l1_idle_enable = sck_sel_idle ? sck_val_idle : sck_val_enable;
    wire sck_l1_data_default = sck_sel_data ? sck_val_data : 1'b1;
    
    // Level 2: Final selection
    wire sck_combined = (sck_sel_idle | sck_sel_enable) ? sck_l1_idle_enable : sck_l1_data_default;

    // L5 Assignment-slice: cs signal with balanced mux tree
    // Precompute cs values for each state
    wire cs_val_idle = 1'b1;
    wire cs_val_enable = 1'b0;
    wire cs_val_data = 1'b0;
    
    // Balanced 2-level mux tree for cs selection
    wire cs_l1_idle_enable = sck_sel_idle ? cs_val_idle : cs_val_enable;
    wire cs_l1_data_default = sck_sel_data ? cs_val_data : 1'b1;
    
    // Final cs selection
    wire cs_combined = (sck_sel_idle | sck_sel_enable) ? cs_l1_idle_enable : cs_l1_data_default;

    always @(*) begin
        if (rst) begin
            cs = 1'b1;
            sck = 1'b1;
            mosi = 1'b0;
        end else begin
            // Use balanced mux trees for cs and sck
            cs = cs_combined;
            sck = sck_combined;
            
            // Default mosi value
            mosi = 1'b0;
            
            // mosi output logic with condition precomputation
            if (state_is_data_fsm) begin
                mosi = data_save[63];
            end
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

endmodule

module spi_slave (
    input wire clk,
    input wire rst,
    // Chip Select
    input wire cs,
    // Serial Clock
    input wire sck,
    // Master Out Slave In
    input wire mosi,
    // Master In Slave Out
    output reg miso
);

    reg [5:0] data_count;
    reg data_end;
    localparam IDLE = 2'b00;
    localparam DATA = 2'b10;
    localparam DISABLE = 2'b11;

    reg [1:0] current_state, next_state;

    // Precomputed data_count ranges (L6 - condition precomputation with bit slicing)
    // data_count < 8 is equivalent to top 3 bits being zero
    wire data_count_in_cmd  = (data_count[5:3] == 3'b000);
    // data_count >= 8 && data_count < 32 is equivalent to top bit zero and (bit4 or bit3 set)
    wire data_count_in_addr = (data_count[5] == 1'b0) && (data_count[4:3] != 2'b00);
    // data_count >= 32 && data_count <= 63 is equivalent to top bit set
    wire data_count_in_data = data_count[5];
    
    // Precompute additional conditions for data_out update (L6)
    // data_count >= 2 && data_count < 8: top 3 bits zero and (bit2 or bit1 set)
    wire data_count_in_cmd_after_first = (data_count[5:3] == 3'b000) && (|data_count[2:1]);
    // data_count > 32: when data_count_in_data is true, this is just lower 5 bits non-zero
    wire data_count_gt_32 = (data_count[4:0] != 5'b00000);

    // Precompute state conditions (L6) for FSM optimization
    wire state_is_idle = (current_state == IDLE);
    wire state_is_data = (current_state == DATA);
    wire state_is_disable = (current_state == DISABLE);

    // Optimized data_count update logic with balanced condition tree (L5-L6)
    wire sck_high = (sck == 1'b1);
    wire count_is_max = (data_count == 6'd63);
    
    // Precompute reset and increment conditions for data_count
    wire data_count_reset = rst | (~state_is_data) | (state_is_data & sck_high & count_is_max);
    wire data_count_inc = state_is_data & sck_high & ~count_is_max;
    
    // Compute next values with balanced mux tree
    wire [5:0] data_count_plus1 = data_count + 6'd1;
    wire [5:0] data_count_next = data_count_reset ? 6'd0 : 
                                 data_count_inc ? data_count_plus1 : 
                                 data_count;
    wire data_end_next = state_is_data & sck_high & count_is_max;

    always @(posedge clk) begin
        data_count <= data_count_next;
        data_end <= data_end_next;
    end

    // Master Out Slave In

    reg [7:0] command_save;
    reg [23:0] address_save;
    reg [31:0] data_save;

    always @(posedge sck) begin
        if (rst) begin
            command_save <= 0;
            address_save <= 0;
            data_save <= 0;
        end
        else begin
            if (current_state == DATA) begin
                // Command, address and data saved from MOSI line from MSB respectively
                if (data_count_in_cmd) begin
                    command_save <= {command_save[6:0],mosi};
                end
                else if (data_count_in_addr) begin
                    address_save <= {address_save[22:0],mosi};
                end
                else if (data_count_in_data) begin
                    data_save <= {data_save[30:0],mosi};
                end
                else begin
                    command_save <= command_save;
                    address_save <= address_save;
                    data_save <= data_save;
                end        
            end
            else begin
                command_save <= command_save;
                address_save <= address_save;
                data_save <= data_save;
            end
        end
    end

    // Master In Slave Out

    reg [31:0] data_out;
    
    // Precompute command check condition (L6)
    wire cmd_is_ff = (command_save == 8'hff);

    // L5 Assignment-slice: miso signal with balanced mux tree
    // Precompute miso conditions (L5-L6)
    wire miso_condition = state_is_data & data_count_in_data & cmd_is_ff;
    wire miso_val = data_out[31];

    always @(negedge sck) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            if (current_state == DATA) begin
                if (data_count_in_cmd_after_first) begin
                    data_out <= data_save;
                end
                else if (data_count_in_addr || data_count_in_data) begin
                    // Data shifted serially on MISO line from MSB respectively
                    if (data_count_in_data && data_count_gt_32) begin
                        data_out <= {data_out[30:0],1'b0};
                    end
                    else begin
                        data_out <= data_out;
                    end
                end
                else begin
                    data_out <= data_out;
                end
            end
            else begin
                data_out <= data_out;
            end
        end
    end

    // Finite State Machine - Optimized with condition precomputation (L5)
    always @(posedge clk) begin
        if (rst) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    // Next state logic (L5 assignment-slice for next_state)
    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end
        else begin
            case (1'b1)
                state_is_idle: next_state = (cs == 1'b0) ? DATA : IDLE;
                state_is_data: next_state = data_end ? DISABLE : DATA;
                state_is_disable: next_state = (cs == 1'b1) ? IDLE : DISABLE;
                default: next_state = IDLE;
            endcase
        end
    end

    // Output logic with balanced mux tree for miso (L5)
    always @(*) begin
        // Use balanced mux tree for miso output
        miso = miso_condition ? miso_val : 1'b0;
    end

endmodule