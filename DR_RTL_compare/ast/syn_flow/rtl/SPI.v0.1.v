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

    // Pre-computed state condition wires (L6)
    wire state_is_idle   = (current_state == IDLE);
    wire state_is_enable = (current_state == ENABLE);
    wire state_is_data   = (current_state == DATA);

    reg [1:0] current_state, next_state;
    reg clock_count;

    // Pre-computed clock_count condition (L5)
    wire clock_count_is_max = (clock_count == 1);
    wire data_count_is_max  = (data_count == 63);

    always @(posedge clk) begin
        if (rst) begin
            clock_count <= 0;
        end
        else begin
            if (state_is_enable || state_is_data) begin
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

    // Pre-computed sck condition (L5)
    wire sck_is_high = (sck == 1);
    wire sck_is_low  = (sck == 0);

    always @(posedge clk) begin
        if (rst) begin
            data_save <= 0;
            data_count <= 0;
            data_end <= 0;
        end
        else begin
            if (state_is_data) begin
                if (sck_is_high) begin
                    // Command, address and data shifted serially on MOSI line from MSB respectively
                    data_save <= {data_save[62:0],1'b0};
                    if (data_count_is_max) begin
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
                // Pre-computed command condition (L6)
                wire command_is_zero = (ext_command_in == 8'h00);
                
                // Data being written on command ALL ZEROS
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

    // Pre-computed data_count conditions for data_in path (L5)
    wire data_count_in_range = (data_count >= 32) && (data_count <= 63);

    always @(posedge clk) begin
        if (rst) begin
            data_in <= 0;
        end
        else begin
            if (state_is_data) begin
                if (sck_is_low) begin
                    // Data being saved from MISO line from LSB
                    if (data_count_in_range) begin
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
    
    // Finite State Machine

    

    always @(posedge clk) begin
        if (rst) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        if (rst) begin
            next_state = 0;
        end
        else begin
            // Default values for outputs
            cs = 1;
            sck = 1;
            mosi = 0;
            
            case (current_state)
                IDLE: begin
                    if (en == 1'b1) begin
                        next_state = ENABLE;
                    end
                    else begin
                        next_state = IDLE;
                    end
                end
                ENABLE: begin
                    cs = 0;
                    sck = ~clock_count;
                    mosi = 0;
                    next_state = DATA;
                end
                DATA: begin
                    cs = 0;
                    sck = ~clock_count;
                    // Command, address and data shifted serially on MOSI line from MSB respectively
                    mosi = data_save[63];
                    if (data_end == 1'b1) begin
                        sck = 1;
                        next_state = IDLE;
                    end
                    else begin
                        next_state = DATA;
                    end
                end
                default: begin
                    next_state = IDLE;
                end
            endcase
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

    // Pre-computed state conditions (L6)
    wire state_is_idle    = (current_state == IDLE);
    wire state_is_data    = (current_state == DATA);
    wire state_is_disable = (current_state == DISABLE);

    reg [1:0] current_state, next_state;

    // Pre-computed data_count conditions for slave (L5)
    wire data_count_is_63 = (data_count == 63);
    wire data_count_in_cmd = (data_count >= 0) && (data_count < 8);
    wire data_count_in_addr = (data_count >= 8) && (data_count < 32);
    wire data_count_in_data = (data_count >= 32) && (data_count <= 63);
    wire data_count_in_data_out = (data_count > 32) && (data_count <= 63);

    always @(posedge clk) begin
        if (rst) begin
            data_count <= 0;
            data_end <= 0;
        end
        else begin
            if (state_is_data) begin
                if (sck == 1) begin
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
            if (state_is_data) begin
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

    // Pre-computed conditions for data_out path (L5)
    wire data_count_for_data_out = (data_count > 1) && (data_count < 8);
    wire data_count_in_data_out_range = (data_count >= 8) && (data_count <= 63);

    always @(negedge sck) begin
        if (rst) begin
            data_out <= 0;
        end
        else begin
            if (state_is_data) begin
                if (data_count_for_data_out) begin
                    data_out <= data_save;
                end
                else if (data_count_in_data_out_range) begin
                    // Data shifted serially on MISO line from MSB respectively
                    if (data_count_in_data_out) begin
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

    // Finite State Machine

    

    always @(posedge clk) begin
        if (rst) begin
            current_state <= 0;
        end
        else begin
            current_state <= next_state;
        end
    end

    // Pre-computed conditions for FSM outputs (L5)
    wire command_is_ff = (command_save == 8'hff);
    wire data_count_for_miso = (data_count >= 32) && (data_count <= 63);
    wire cs_is_low = (cs == 1'b0);
    wire cs_is_high = (cs == 1'b1);

    always @(*) begin
        if (rst) begin
            next_state = 0;
        end
        else begin
            // Default value for miso
            miso = 0;
            
            case (current_state)
                IDLE: begin
                    if (cs_is_low) begin
                        next_state = DATA;
                    end
                    else begin
                        next_state = IDLE;
                    end
                end
                DATA: begin
                    if (data_count_for_miso) begin
                        // Data shifted serially on MOSI line from MSB respectively on command ALL ONES
                        if (command_is_ff) begin
                            miso = data_out[31];
                        end
                        else begin
                            miso = 0;
                        end
                    end
                    else begin
                        miso = 0;
                    end            
                    
                    if (data_end == 1'b1) begin
                        next_state = DISABLE;
                    end
                    else begin
                        next_state = DATA;
                    end
                end
                DISABLE: begin
                    miso = 0;
                    if (cs_is_high) begin
                        next_state = IDLE;
                    end
                    else begin
                        next_state = DISABLE;
                    end
                end
                default: begin
                    next_state = IDLE;
                end
            endcase
        end
    end

endmodule