`timescale 1ns / 1ps
module sync_serial_communication_tx_rx(
    input clk,
    input reset_n,
    input [2:0] sel,
    input [63:0] data_in,
    output [63:0] data_out,
    output done
);

wire tx_out;
wire tx_done;
wire serial_clk_in;

tx_block uut_tx_block (
    .clk(clk),
    .reset_n(reset_n),
    .data_in(data_in),
    .sel(sel),
    .serial_out(tx_out),
    .done(tx_done),
    .serial_clk(serial_clk_in)
);

rx_block uut_rx_block (
    .clk(clk),
    .serial_clk(serial_clk_in),
    .reset_n(reset_n),
    .sel(sel),
    .data_in(tx_out),
    .data_out(data_out),
    .done(done)
);

endmodule

///// tx_block
module tx_block(
    input clk,
    input reset_n,
    input [63:0] data_in,
    input [2:0] sel,
    output reg serial_out,
    output reg done,
    output serial_clk
);

reg [63:0] data_reg;
reg [6:0] bit_count;
reg [6:0] reg_count;
reg [6:0] temp_reg_count;

// One-hot pre-decode for sel signal
wire sel_is_000 = (sel == 3'b000);
wire sel_is_001 = (sel == 3'b001);
wire sel_is_010 = (sel == 3'b010);
wire sel_is_011 = (sel == 3'b011);
wire sel_is_100 = (sel == 3'b100);

// L5: Pre-compute bit_count == 0 condition (shared by done and bit_count decrement control)
wire bit_count_is_zero = (bit_count == 7'h0);
wire bit_count_gt_zero = ~bit_count_is_zero;

// Sequential block for state control and data selection
always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        data_reg     <= 64'h0;
        bit_count    <= 7'h0;
        reg_count    <= 7'h0;
    end else begin
        if (done == 1'b1) begin
            if (sel_is_000) begin
                data_reg  <= 64'h0;
                bit_count <= 7'd0;
            end else if (sel_is_001) begin
                data_reg  <= {56'h0, data_in[7:0]};
                bit_count <= 7'd7;
            end else if (sel_is_010) begin
                data_reg  <= {48'h0, data_in[15:0]};
                bit_count <= 7'd15;
            end else if (sel_is_011) begin
                data_reg  <= {32'h0, data_in[31:0]};
                bit_count <= 7'd31;
            end else if (sel_is_100) begin
                data_reg  <= data_in[63:0];
                bit_count <= 7'd63;
            end else begin
                data_reg  <= 64'h0;
                bit_count <= 7'h0;
            end
        end else if (bit_count_gt_zero) begin
            data_reg   <= data_reg >> 1;
            bit_count  <= bit_count - 1'b1;
        end
        reg_count <= bit_count;
    end
end

assign serial_clk = clk && (temp_reg_count !== 7'd0);

always@(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        temp_reg_count <= 7'h0;
    end
    else begin
        temp_reg_count <= reg_count;
    end
end

// L5: Pre-compute serial_out enable from shared condition wire
wire serial_out_enable = (reg_count > 7'h0) || bit_count_gt_zero;

always@(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        serial_out <= 1'b0;
    end
    else if(serial_out_enable) begin
        serial_out <= data_reg[0];
    end
end

// L5: Done signal using pre-computed condition wire
always@(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
        done <= 1'b0;
    end
    else begin
        if(bit_count_is_zero) begin
            done <= 1'b1;
        end
        else begin
            done <= 1'b0;
        end
    end
end

endmodule

///// rx_block
module rx_block(
    input wire clk,
    input wire reset_n,
    input wire data_in,
    input wire serial_clk,
    input wire [2:0] sel,
    output reg done,
    output reg [63:0] data_out
);

    reg [63:0] data_reg;
    reg [7:0] bit_count;
    reg [7:0] count;

    // One-hot pre-decode for sel signal
    wire sel_is_000 = (sel == 3'b000);
    wire sel_is_001 = (sel == 3'b001);
    wire sel_is_010 = (sel == 3'b010);
    wire sel_is_011 = (sel == 3'b011);
    wire sel_is_100 = (sel == 3'b100);

    // L5: Decompose done_condition into sub-conditions to reduce comparator depth
    wire count_eq_bitcount = (count == bit_count);
    wire count_gt_bitcount = (count > bit_count);
    wire count_not_zero    = (count != 8'd0);
    wire count_ge_bitcount = count_eq_bitcount | count_gt_bitcount;
    wire done_condition    = count_ge_bitcount & count_not_zero;

    // L5: Pre-compute bit_count > 0 for reuse across multiple control paths
    wire bit_count_gt_zero = (bit_count > 8'd0);

    // L5: Pre-compute zero-padded data variants for done-condition mux path
    wire [63:0] data_out_sel000 = 64'h0;
    wire [63:0] data_out_sel001 = {56'h0, data_reg[7:0]};
    wire [63:0] data_out_sel010 = {48'h0, data_reg[15:0]};
    wire [63:0] data_out_sel011 = {32'h0, data_reg[31:0]};
    wire [63:0] data_out_sel100 = data_reg;

    // Sequential logic to capture serial data
    always @(posedge serial_clk or negedge reset_n) begin
        if (!reset_n) begin
            data_reg <= 64'h0;
            bit_count <= 8'd0;
        end else begin
            if(done == 1'b1) begin
                bit_count <= 8'b0;
                data_reg <= 64'h0;
            end
            else begin
                bit_count <= bit_count + 1'b1;
                data_reg[bit_count] <= data_in;
            end
        end
    end

    // Sequential logic for completion monitoring
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            count <= 8'd0;
            done <= 1'b0;
            data_out <= 64'h0;
        end
        else if(done_condition) begin
            done <= 1'b1;
            // L5: Use pre-computed data variants for mux selection
            if (sel_is_000) begin
                data_out <= data_out_sel000;
            end else if (sel_is_001) begin
                data_out <= data_out_sel001;
            end else if (sel_is_010) begin
                data_out <= data_out_sel010;
            end else if (sel_is_011) begin
                data_out <= data_out_sel011;
            end else if (sel_is_100) begin
                data_out <= data_out_sel100;
            end else begin
                data_out <= 64'h0;
            end
        end
        else if(bit_count_gt_zero) begin
            count <= count + 1'b1;
            done <= 1'b0;
        end
        else begin
            count <= 8'd0;
            done <= 1'b0;
        end
    end

endmodule