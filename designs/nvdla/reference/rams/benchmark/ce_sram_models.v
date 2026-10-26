// Fixed functional contract, not an invented physical timing model.
// Pins and clock phases follow OpenRAM; only post-read valid data is modeled.
// Output invalidation X pulses in the simulation writer are not hardware logic.
`timescale 1ns/1ps
module sram_1r1w_256x32(input clk0, input csb0, input [3:0] wmask0, input [7:0] addr0,
 input [31:0] din0, input clk1, input csb1, input [7:0] addr1,
 output reg [31:0] dout1);
 reg [31:0] mem [0:255];
 reg [7:0] wa,ra; reg [31:0] wd; reg wen,ren;
 reg [3:0] mask; always @(posedge clk0) mask <= wmask0;
 always @(posedge clk0) begin wa<=addr0; wd<=din0; wen<=!csb0; end
 always @(posedge clk1) begin ra<=addr1; ren<=!csb1; end
 always @(negedge clk0) if(wen && wa<256) begin if (mask[0]) mem[wa][0 +: 8] <= wd[0 +: 8];
if (mask[1]) mem[wa][8 +: 8] <= wd[8 +: 8];
if (mask[2]) mem[wa][16 +: 8] <= wd[16 +: 8];
if (mask[3]) mem[wa][24 +: 8] <= wd[24 +: 8]; end
 always @(negedge clk1) if(ren && ra<256) dout1<=mem[ra];
endmodule
// Fixed functional contract, not an invented physical timing model.
// Pins and clock phases follow OpenRAM; only post-read valid data is modeled.
// Output invalidation X pulses in the simulation writer are not hardware logic.
`timescale 1ns/1ps
module sram_1r1w_80x17(input clk0, input csb0, input [6:0] addr0,
 input [16:0] din0, input clk1, input csb1, input [6:0] addr1,
 output reg [16:0] dout1);
 reg [16:0] mem [0:79];
 reg [6:0] wa,ra; reg [16:0] wd; reg wen,ren;
 
 always @(posedge clk0) begin wa<=addr0; wd<=din0; wen<=!csb0; end
 always @(posedge clk1) begin ra<=addr1; ren<=!csb1; end
 always @(negedge clk0) if(wen && wa<80) begin mem[wa] <= wd; end
 always @(negedge clk1) if(ren && ra<80) dout1<=mem[ra];
endmodule
