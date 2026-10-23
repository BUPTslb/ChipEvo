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

    // Precompute address decode conditions (L6)
    wire addr_is_enable = (addr == ENABLE);
    wire addr_is_command = (addr == COMMAND);
    wire addr_is_address = (addr == ADDRESS);
    wire addr_is_data_in = (addr == DATA_IN);
    wire addr_is_data_out = (addr == DATA_OUT);
    wire write_en = we;

    always @(*) begin
        if (rst) begin
            enable = 0;
            command = 0;
            address = 0;
            data_in = 0;
        end
        else begin
            // Default: hold current values
            enable = enable;
            command = command;
            address = address;
            data_in = data_in;
            
            if (addr_is_enable && write_en) begin
                enable = write_data[0];
            end
            else if (addr_is_command && write_en) begin
                command = write_data[7:0];
            end
            else if (addr_is_address && write_en) begin
                address = write_data[23:0];
            end
            else if (addr_is_data_in && write_en) begin
                data_in = write_data[31:0];
            end
            else if (addr_is_data_out && re) begin
                read_data = data_out;
            end
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

    // Precompute command condition for data_save loading (L6)
    wire command_is_zero = (ext_command_in == 8'h00);

    always @(posedge clk) begin
        if (rst) begin
            clock_count <= 0;
        end
        else begin
            // Precompute state conditions for clock_count logic (L6)
            wire state_is_enable = (current_state == ENABLE);
            wire state_is_data = (current_state == DATA);
            wire enable_or_data = state_is_enable | state_is_data;
            
            if (enable_or_data) begin
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

    // Precompute data_count conditions for sequential logic (L6)
    wire data_count_is_63 = (data_count == 63);
    wire sck_is_1 = (sck == 1);

    always @(posedge clk) begin
        if (rst) begin
            data_save <= 0;
            data_count <= 0;
            data_end <= 0;
        end
        else begin
            // Precompute state condition (L6)
            wire state_is_data = (current_state == DATA);
            
            if (state_is_data) begin
                if (sck_is_1) begin
                    // Command, address and data shifted serially on MOSI line from MSB respectively
                    data_save <= {data_save[62:0],1'b0};
                    if (data_count_is_63) begin
                        data_count <= 0;
                        data_end <= 1;
                    end
                    else begin
                        data_count <= data_count + 1;
                        data_end <= 0;
                    end
                end
                else begin
                    data_save <= data_save;
                    data_count <= data_count;
                    data_end <= 0;
                end
            end
            else begin
                // Data being written on command ALL ZEROS
                // Use precomputed command_is_zero condition (L5 assignment-slice)
                if (command_is_zero) begin
                    data_save <= {ext_command_in,ext_address_in,ext_data_in};
                end
                else begin
                    data_save <= {ext_command_in,ext_address_in,32'h0000_0000};
                end
                data_count <= 0;
                data_end <= 0;
            end
        end
    end

    // Master In Slave Out

    reg [31:0] data_in;

    // Precompute data_count range conditions for MISO data capture (L6)
    wire data_count_ge_32 = (data_count >= 32);
    wire data_count_le_63 = (data_count <= 63);
    wire data_count_in_capture = data_count_ge_32 & data_count_le_63;

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
            // Precompute state condition (L6)
            wire state_is_data = (current_state == DATA);
            
            if (state_is_data) begin
                if (!sck) begin
                    // Data being saved from MISO line from LSB
                    // Use precomputed capture range condition (L5 assignment-slice)
                    if (data_count_in_capture) begin
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
    wire state_is_data = (current_state == DATA);

    // Next state logic (L5 assignment-slice for next_state)
    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end else begin
            case (1'b1)
                state_is_idle: next_state = en ? ENABLE : IDLE;
                state_is_enable: next_state = DATA;
                state_is_data: next_state = data_end ? IDLE : DATA;
                default: next_state = IDLE;
            endcase
        end
    end

    // Output logic (L5 assignment-slices for cs, sck, mosi)
    // Precompute sck logic conditions (L6)
    wire data_end_or_idle = data_end | state_is_idle;
    
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
            
            // Precompute intermediate signals (L6)
            wire enable_active = state_is_enable | (state_is_data & ~data_end);
            
            if (state_is_idle) begin
                cs = 1'b1;
                sck = 1'b1;
                mosi = 1'b0;
            end
            else if (enable_active) begin
                cs = 1'b0;
                sck = ~clock_count;
                mosi = state_is_data ? data_save[63] : 1'b0;
            end
            else if (state_is_data && data_end) begin
                cs = 1'b0;
                sck = 1'b1;
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

    // Precomputed data_count ranges (L6 - condition precomputation)
    wire data_count_in_cmd  = (data_count < 8);
    wire data_count_in_addr = (data_count >= 8) && (data_count < 32);
    wire data_count_in_data = (data_count >= 32) && (data_count <= 63);
    
    // Precomputed conditions for sequential logic (L6)
    wire data_count_is_63 = (data_count == 63);
    wire sck_is_1 = (sck == 1);

    always @(posedge clk) begin
        if (rst) begin
            data_count <= 0;
            data_end <= 0;
        end
        else begin
            // Precompute state condition (L6)
            wire state_is_data = (current_state == DATA);
            
            if (state_is_data) begin
                if (sck_is_1) begin
                    if (data_count_is_63) begin
                        data_count <= 0;
                        data_end <= 1;
                    end
                    else begin
                        data_count <= data_count + 1;
                        data_end <= 0;
                    end
                end
                else begin
                    data_count <= data_count;
                    data_end <= 0;
                end
            end
            else begin
                data_count <= 0;
                data_end <= 0;
            end
        end
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
            // Precompute state condition (L6)
            wire state_is_data = (current_state == DATA);
            
            if (state_is_data) begin
                // Command, address and data saved from MOSI line from MSB respectively
                // Use precomputed data_count range conditions (L5 assignment-slices)
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

    // Precompute conditions for data_out logic (L6)
    wire data_count_gt_1 = (data_count > 1);
    wire data_count_lt_8 = (data_count < 8);
    wire data_count_in_cmd_range = data_count_gt_1 & data_count_lt_8;
    wire data_count_gt_32 = (data_count > 32);
    wire data_count_in_data_range = data_count_in_data & data_count_gt_32;

    always @(negedge sck) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            // Precompute state condition (L6)
            wire state_is_data = (current_state == DATA);
            
            if (state_is_data) begin
                // Use precomputed conditions for data_out assignment (L5 assignment-slices)
                if (data_count_in_cmd_range) begin
                    data_out <= data_save;
                end
                else if (data_count_in_addr || data_count_in_data) begin
                    // Data shifted serially on MISO line from MSB respectively
                    if (data_count_in_data_range) begin
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

    // Finite State Machine - Precompute state conditions (L6)

    // Precompute state conditions for FSM (L6)
    wire state_is_idle = (current_state == IDLE);
    wire state_is_data = (current_state == DATA);
    wire state_is_disable = (current_state == DISABLE);

    always @(posedge clk) begin
        if (rst) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    // Next state logic (L5 assignment-slice for next_state)
    // Use precomputed state conditions (L5)
    always @(*) begin
        if (rst) begin
            next_state = IDLE;
        end
        else begin
            if (state_is_idle) begin
                next_state = (cs == 1'b0) ? DATA : IDLE;
            end
            else if (state_is_data) begin
                next_state = data_end ? DISABLE : DATA;
            end
            else if (state_is_disable) begin
                next_state = (cs == 1'b1) ? IDLE : DISABLE;
            end
            else begin
                next_state = IDLE;
            end
        end
    end

    // Output logic (L5 assignment-slice for miso)
    // Precompute command comparison condition (L6)
    wire command_is_ff = (command_save == 8'hff);
    
    always @(*) begin
        miso = 1'b0; // Default value
        if (!rst) begin
            // Use precomputed conditions (L5)
            if (state_is_data && data_count_in_data && command_is_ff) begin
                miso = data_out[31];
            end
            else begin
                miso = 1'b0;
            end
        end
    end

endmodule