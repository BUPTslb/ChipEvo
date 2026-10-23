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

wire sel_is_000 = (sel == 3'b000);
wire sel_is_001 = (sel == 3'b001);
wire sel_is_010 = (sel == 3'b010);
wire sel_is_011 = (sel == 3'b011);
wire sel_is_100 = (sel == 3'b100);

wire bit_count_is_zero = (bit_count == 7'h0);
wire bit_count_positive = (bit_count > 7'h0);

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
        end else if (bit_count_positive) begin
            data_reg   <= data_reg >> 1;
            bit_count  <= bit_count - 1'b1;
        end
        reg_count <= bit_count;
    end
end

wire temp_reg_count_nonzero = (temp_reg_count != 7'd0);
assign serial_clk = clk && temp_reg_count_nonzero;

always@(posedge clk or negedge reset_n) begin 
    if(!reset_n) begin
        temp_reg_count <= 7'h0;
    end
    else begin
        temp_reg_count <= reg_count;
    end
end

wire serial_out_enable = (reg_count > 7'h0) || bit_count_positive;

always@(posedge clk or negedge reset_n) begin 
    if(!reset_n) begin
        serial_out <= 1'b0;
    end
    else if(serial_out_enable) begin
        serial_out <= data_reg[0];
    end
end

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
    wire sel_is_0011 = (sel == 3'b011);
    wire sel_is_100 = (sel == 3'b100);

    // =========================================================================
    // L6 optimization: Hierarchical comparison for done_condition
    // Decompose 8-bit (count >= bit_count) into parallel 4-bit comparisons.
    // Since bit_count[7:4] == 4'b0000 always (values 0..63):
    //   - eq_hi = ~|count[7:4]   (count upper nibble must be zero)
    //   - gt_lo uses 5-bit subtraction borrow: {1'b0,count[3:0]} - bit_count[3:0]
    //   - count_geq_bitcount = eq_hi | (eq_lo & gt_lo)
    // Critical path reduces from 8-bit comparator (~8 gate levels)
    // to two parallel 4-bit comparisons + 1 OR (~5 gate levels).
    // =========================================================================
    wire eq_hi = ~|count[7:4];                        // count[7:4] == 4'b0000
    wire [3:0] eq_lo_bits = ~(count[3:0] ^ bit_count[3:0]); // per-bit XNOR
    wire eq_lo = &eq_lo_bits;                         // count[3:0] == bit_count[3:0]
    wire [4:0] gt_lo_sub = {1'b0, count[3:0]} - {1'b0, bit_count[3:0]};
    wire gt_lo = gt_lo_sub[4];                        // borrow out => count[3:0] >= bit_count[3:0]
    wire count_geq_bitcount = eq_hi | (eq_lo & gt_lo);  // 4-bit parallel + 1 AND + 1 OR

    wire count_nonzero = (count != 8'd0);
    wire done_condition = count_geq_bitcount & count_nonzero;

    // Pre-compute reusable conditions
    wire bit_count_gt_0 = (bit_count > 8'd0);
    wire count_inc_cond = !done_condition & bit_count_gt_0;

    // Sequential logic to capture serial data on serial_clk rising edge
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
    
    // Registered done signal
    wire done_next = done_condition;
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            done <= 1'b0;
        else
            done <= done_next;
    end

    // Sequential logic for count and data_out
    always@(posedge clk or negedge reset_n) begin
        if(!reset_n) begin
            count <= 8'd0;
            data_out <= 64'h0;
        end 
        else if(done_condition) begin
            data_out <= (sel_is_000)  ? 64'h0 :
                        (sel_is_001)  ? {56'h0, data_reg[7:0]} :
                        (sel_is_010)  ? {48'h0, data_reg[15:0]} :
                        (sel_is_0011) ? {32'h0, data_reg[31:0]} :
                        (sel_is_100)  ? data_reg :
                        64'h0;
        end
        else if(count_inc_cond) begin
            count <= count + 1'b1;
        end
        else begin
            count <= 8'd0;
        end 
    end

endmodule