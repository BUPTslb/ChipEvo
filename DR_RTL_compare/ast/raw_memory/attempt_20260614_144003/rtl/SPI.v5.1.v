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

    // Precompute non-DATA state values for data_save (L6)
    wire [63:0] data_save_load_cmd = {ext_command_in, ext_address_in, ext_data_in};
    wire [63:0] data_save_load_no_cmd = {ext_command_in, ext_address_in, 32'h0000_0000};
    wire [63:0] data_save_shift = {data_save[62:0], 1'b0};
    
    // L5 assignment-slice: data_save with condition precomputed mux tree
    wire [63:0] data_save_next;
    assign data_save_next = rst ? 64'b0 :
                            state_is_data ? (sck_high ? data_save_shift : data_save) :
                            (cmd_is_zero ? data_save_load_cmd : data_save_load_no_cmd);

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

    // Precompute conditions for data_in update (L6)
    wire state_is_data_in = (current_state == DATA);
    wire sck_low = (sck == 1'b0);
    wire count_in_data_range = (data_count >= 6'd32) && (data_count <= 6'd63);

    // Precompute data_in next values (L6)
    wire [31:0] data_in_shift = {data_in[30:0], miso};
    
    // L5 assignment-slice: data_in with condition precomputed mux tree
    wire [31:0] data_in_next;
    assign data_in_next = rst ? 32'b0 :
                          state_is_data_in ? (sck_low ? (count_in_data_range ? data_in_shift : data_in) : data_in) :
                          data_in;

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
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

    // Output logic (L5 assignment-slices for cs, sck, mosi)
    always @(*) begin
        if (rst) begin
            cs = 1'b1;
            sck = 1'b1;
            mosi = 1'b0;
        end else begin
            // Default values
            cs = 1'b1;
            sck = 1'b1;
            mosi = 1'b0;
            case (1'b1)
                state_is_idle: begin
                    cs = 1'b1;
                    sck = 1'b1;
                    mosi = 1'b0;
                end
                state_is_enable: begin
                    cs = 1'b0;
                    sck = ~clock_count;
                    mosi = 1'b0;
                end
                state_is_data_fsm: begin
                    cs = 1'b0;
                    sck = data_end ? 1'b1 : ~clock_count;
                    mosi = data_save[63];
                end
            endcase
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

    // Precomputed data_count ranges (L6 - condition precomputation)
    wire data_count_in_cmd  = (data_count < 6'd8);
    wire data_count_in_addr = (data_count >= 6'd8) && (data_count < 6'd32);
    wire data_count_in_data = (data_count >= 6'd32) && (data_count <= 6'd63);
    
    // Precompute additional conditions for data_out update (L6)
    wire data_count_in_cmd_after_first = (data_count >= 6'd2) && (data_count < 6'd8);
    wire data_count_gt_32 = (data_count > 6'd32);

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

    // Precompute shift conditions (L6)
    wire cmd_shift_en = state_is_data & data_count_in_cmd;
    wire addr_shift_en = state_is_data & data_count_in_addr;
    wire data_shift_en = state_is_data & data_count_in_data;
    
    // L5 assignment-slices for slave registers with precomputed conditions
    always @(posedge sck) begin
        if (rst) begin
            command_save <= 0;
            address_save <= 0;
            data_save <= 0;
        end
        else begin
            if (cmd_shift_en) begin
                command_save <= {command_save[6:0], mosi};
            end
            else begin
                command_save <= command_save;
            end
            
            if (addr_shift_en) begin
                address_save <= {address_save[22:0], mosi};
            end
            else begin
                address_save <= address_save;
            end
            
            if (data_shift_en) begin
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
    
    // Precompute conditions for data_out update (L6)
    wire load_data_out = state_is_data & data_count_in_cmd_after_first;
    wire shift_data_out = state_is_data & (data_count_in_addr || data_count_in_data) & (data_count_in_data & data_count_gt_32);
    
    // L5 assignment-slice for data_out with balanced condition tree
    wire [31:0] data_out_next;
    assign data_out_next = rst ? 32'b0 :
                           load_data_out ? data_save :
                           shift_data_out ? {data_out[30:0], 1'b0} :
                           data_out;

    always @(negedge sck) begin
        data_out <= data_out_next;
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

    // Output logic (L5 assignment-slice for miso)
    always @(*) begin
        miso = 1'b0; // Default value
        if (!rst) begin
            case (1'b1)
                state_is_data: begin
                    if (data_count_in_data && cmd_is_ff) begin
                        miso = data_out[31];
                    end
                end
                default: miso = 1'b0;
            endcase
        end
    end

endmodule