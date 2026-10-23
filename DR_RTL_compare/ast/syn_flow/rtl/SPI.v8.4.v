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

    // Precomputed address decode conditions (L6)
    wire addr_is_enable = (addr == ENABLE);
    wire addr_is_command = (addr == COMMAND);
    wire addr_is_address = (addr == ADDRESS);
    wire addr_is_data_in = (addr == DATA_IN);
    wire addr_is_data_out = (addr == DATA_OUT);

    always @(*) begin
        if (rst) begin
            enable = 0;
            command = 0;
            address = 0;
            data_in = 0;
        end
        else begin
            case (1'b1)
                addr_is_enable: begin
                    if (we == 1'b1) begin
                        enable = write_data[0];
                    end
                end
                addr_is_command: begin
                    if (we == 1'b1) begin
                        command = write_data[7:0];
                    end
                end
                addr_is_address: begin
                    if (we == 1'b1) begin
                        address = write_data[23:0];
                    end
                end
                addr_is_data_in: begin
                    if (we == 1'b1) begin
                        data_in = write_data[31:0];
                    end
                end
                addr_is_data_out: begin
                    if (re == 1'b1) begin
                        read_data = data_out;
                    end
                end
                default: ;
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

    // Precomputed data_save shift and load values (L5-L6)
    wire [63:0] data_save_shift = {data_save[62:0], 1'b0};
    wire [63:0] data_save_load = cmd_is_zero ? {ext_command_in, ext_address_in, ext_data_in} :
                                               {ext_command_in, ext_address_in, 32'h0000_0000};
    
    // Optimized data_save next value with balanced mux tree (L5)
    wire [63:0] data_save_next = state_is_data ? (sck_high ? data_save_shift : data_save) :
                                                 data_save_load;

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
            
            // data_save update with precomputed next value
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

    // Precomputed data_in shift value (L6)
    wire [31:0] data_in_shift = {data_in[30:0], miso};
    
    // Optimized data_in next value with balanced mux tree (L5)
    wire [31:0] data_in_next = state_is_data_in ? (sck_low ? (count_in_data_range ? data_in_shift : data_in) : data_in) :
                                                  data_in;

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
            // data_in update with precomputed next value
            data_in <= data_in_next;
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

    // Precomputed cs and mosi values for each state (L5)
    wire cs_val_idle = 1'b1;
    wire cs_val_enable = 1'b0;
    wire cs_val_data = 1'b0;
    
    wire mosi_val_idle = 1'b0;
    wire mosi_val_enable = 1'b0;
    wire mosi_val_data = data_save[63];
    
    // Balanced mux tree for cs and mosi (L5)
    wire cs_combined = sck_sel_idle ? cs_val_idle : (sck_sel_enable ? cs_val_enable : cs_val_data);
    wire mosi_combined = sck_sel_idle ? mosi_val_idle : (sck_sel_enable ? mosi_val_enable : mosi_val_data);

    always @(*) begin
        if (rst) begin
            cs = 1'b1;
            sck = 1'b1;
            mosi = 1'b0;
        end else begin
            // Use precomputed mux tree results
            cs = cs_combined;
            sck = sck_combined;
            mosi = mosi_combined;
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

    // Precomputed next values for command_save, address_save, data_save (L5)
    wire [7:0] command_save_next = (current_state == DATA) ? 
                                   (data_count_in_cmd ? {command_save[6:0], mosi} : command_save) : 
                                   command_save;
    wire [23:0] address_save_next = (current_state == DATA) ? 
                                    (data_count_in_addr ? {address_save[22:0], mosi} : address_save) : 
                                    address_save;
    wire [31:0] data_save_next = (current_state == DATA) ? 
                                 (data_count_in_data ? {data_save[30:0], mosi} : data_save) : 
                                 data_save;

    always @(posedge sck) begin
        if (rst) begin
            command_save <= 0;
            address_save <= 0;
            data_save <= 0;
        end
        else begin
            command_save <= command_save_next;
            address_save <= address_save_next;
            data_save <= data_save_next;
        end
    end

    // Master In Slave Out

    reg [31:0] data_out;
    
    // Precompute command check condition (L6)
    wire cmd_is_ff = (command_save == 8'hff);

    // Precomputed next values for data_out (L5)
    wire [31:0] data_out_load = data_save;
    wire [31:0] data_out_shift = {data_out[30:0], 1'b0};
    
    wire [31:0] data_out_next = (current_state == DATA) ? 
                                (data_count_in_cmd_after_first ? data_out_load :
                                 (data_count_in_addr || data_count_in_data) ? 
                                 (data_count_in_data && data_count_gt_32 ? data_out_shift : data_out) : 
                                 data_out) : 
                                data_out;

    always @(negedge sck) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            data_out <= data_out_next;
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

    // Output logic - Precomputed miso condition (L6) with simplified assignment (L5)
    // Precompute the condition for miso output
    wire miso_condition = state_is_data & data_count_in_data & cmd_is_ff;
    
    // Simplified miso output logic
    always @(*) begin
        if (rst) begin
            miso = 1'b0;
        end else begin
            miso = miso_condition ? data_out[31] : 1'b0;
        end
    end

endmodule