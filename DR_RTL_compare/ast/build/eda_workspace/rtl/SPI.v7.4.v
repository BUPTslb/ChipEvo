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

    // Precompute register write conditions (L6)
    wire write_enable = we & (addr == ENABLE);
    wire write_command = we & (addr == COMMAND);
    wire write_address = we & (addr == ADDRESS);
    wire write_data_in = we & (addr == DATA_IN);
    wire read_data_out = re & (addr == DATA_OUT);

    always @(*) begin
        if (rst) begin
            enable = 0;
            command = 0;
            address = 0;
            data_in = 0;
        end
        else begin
            // Default: hold values
            enable = enable;
            command = command;
            address = address;
            data_in = data_in;
            read_data = read_data; // Default hold
            
            if (write_enable) enable = write_data[0];
            if (write_command) command = write_data[7:0];
            if (write_address) address = write_data[23:0];
            if (write_data_in) data_in = write_data[31:0];
            if (read_data_out) read_data = data_out;
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

    // Precompute data_save load values (L5)
    wire [63:0] data_save_load_cmd_zero = {ext_command_in, ext_address_in, ext_data_in};
    wire [63:0] data_save_load_cmd_nonzero = {ext_command_in, ext_address_in, 32'h0000_0000};
    
    // Compute data_save with balanced mux tree (L5)
    wire data_save_shift_cond = state_is_data & sck_high;
    wire data_save_load_cond = ~state_is_data;
    wire data_save_hold_cond = state_is_data & ~sck_high;
    
    wire [63:0] data_save_shifted = {data_save[62:0], 1'b0};
    wire [63:0] data_save_loaded = cmd_is_zero ? data_save_load_cmd_zero : data_save_load_cmd_nonzero;
    
    // Balanced 2-level mux tree for data_save (L5)
    wire [63:0] data_save_val_shift_load = data_save_shift_cond ? data_save_shifted : data_save_loaded;
    wire [63:0] data_save_next = data_save_hold_cond ? data_save : data_save_val_shift_load;

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
            
            // data_save update with balanced mux tree
            data_save <= data_save_next;
        end
    end

    // Master In Slave Out
    reg [31:0] data_in;

    // Precompute conditions for data_in update (L6) - Simplified to bit slice
    wire state_is_data_in = (current_state == DATA);
    wire sck_low = (sck == 1'b0);
    // Simplified: data_count >= 32 is equivalent to data_count[5] == 1
    wire count_in_data_range = data_count[5];

    // Precompute data_in shift condition (L5)
    wire data_in_shift_cond = state_is_data_in & sck_low & count_in_data_range;
    wire [31:0] data_in_shifted = {data_in[30:0], miso};

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
            // Balanced mux for data_in update
            data_in <= data_in_shift_cond ? data_in_shifted : data_in;
        end
    end

    assign ext_data_out = data_in;
    
    // Finite State Machine - Optimized with condition precomputation
    // Precompute state conditions (L6)
    wire state_is_idle = (current_state == IDLE);
    wire state_is_enable = (current_state == ENABLE);
    wire state_is_data_fsm = (current_state == DATA);

    // Next state logic (L5 assignment-slice for next_state)
    // Using direct bit assignment with precomputed conditions
    wire [1:0] next_state_idle = en ? ENABLE : IDLE;
    wire [1:0] next_state_enable = DATA;
    wire [1:0] next_state_data = data_end ? IDLE : DATA;
    
    // Balanced mux tree for next_state
    wire [1:0] next_state_val1 = state_is_idle ? next_state_idle : next_state_enable;
    wire [1:0] next_state_val2 = state_is_data_fsm ? next_state_data : IDLE;
    wire [1:0] next_state_combined = (state_is_idle | state_is_enable) ? next_state_val1 : next_state_val2;

    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end else begin
            next_state = next_state_combined;
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

    // Precompute mosi values (L5)
    wire mosi_val_data = data_save[63];
    wire mosi_sel_data = state_is_data_fsm;

    always @(*) begin
        if (rst) begin
            cs = 1'b1;
            sck = 1'b1;
            mosi = 1'b0;
        end else begin
            // Default values
            cs = 1'b1;
            sck = sck_combined;
            mosi = 1'b0;
            
            // Select outputs based on state
            if (state_is_idle) begin
                cs = 1'b1;
                mosi = 1'b0;
            end
            else if (state_is_enable) begin
                cs = 1'b0;
                mosi = 1'b0;
            end
            else if (state_is_data_fsm) begin
                cs = 1'b0;
                mosi = mosi_val_data;
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

    // Precompute shift conditions (L5)
    wire cmd_shift_cond = state_is_data & data_count_in_cmd;
    wire addr_shift_cond = state_is_data & ~data_count_in_cmd & data_count_in_addr;
    wire data_shift_cond = state_is_data & ~data_count_in_cmd & ~data_count_in_addr & data_count_in_data;

    always @(posedge sck) begin
        if (rst) begin
            command_save <= 0;
            address_save <= 0;
            data_save <= 0;
        end
        else begin
            // Command, address and data saved from MOSI line from MSB respectively
            if (cmd_shift_cond) begin
                command_save <= {command_save[6:0], mosi};
            end
            else begin
                command_save <= command_save;
            end
            
            if (addr_shift_cond) begin
                address_save <= {address_save[22:0], mosi};
            end
            else begin
                address_save <= address_save;
            end
            
            if (data_shift_cond) begin
                data_save <= {data_save[30:0], mosi};
            end
            else begin
                data_save <= data_save;
            end
        end
    end

    // Master In Slave Out
    reg [31:0] data_out;
    
    // Precompute command check condition (L6)
    wire cmd_is_ff = (command_save == 8'hff);
    
    // Precompute data_out update conditions (L5)
    wire data_out_load_cond = state_is_data & data_count_in_cmd_after_first;
    wire data_out_shift_cond = state_is_data & ~data_count_in_cmd_after_first & 
                              (data_count_in_addr || data_count_in_data) & 
                              data_count_in_data & data_count_gt_32;
    wire data_out_hold_cond = ~data_out_load_cond & ~data_out_shift_cond;

    always @(negedge sck) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            // Balanced mux for data_out update
            data_out <= data_out_load_cond ? data_save :
                       data_out_shift_cond ? {data_out[30:0], 1'b0} :
                       data_out;
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
    // Using direct bit assignment with precomputed conditions
    wire [1:0] next_state_idle = (cs == 1'b0) ? DATA : IDLE;
    wire [1:0] next_state_data = data_end ? DISABLE : DATA;
    wire [1:0] next_state_disable = (cs == 1'b1) ? IDLE : DISABLE;
    
    // Balanced mux tree for next_state
    wire [1:0] next_state_val1 = state_is_idle ? next_state_idle : next_state_data;
    wire [1:0] next_state_val2 = state_is_disable ? next_state_disable : IDLE;
    wire [1:0] next_state_combined = (state_is_idle | state_is_data) ? next_state_val1 : next_state_val2;

    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end
        else begin
            next_state = next_state_combined;
        end
    end

    // Output logic (L5 assignment-slice for miso)
    // Precompute miso output condition (L5)
    wire miso_output_cond = state_is_data & data_count_in_data & cmd_is_ff;
    
    always @(*) begin
        miso = miso_output_cond ? data_out[31] : 1'b0;
    end

endmodule