module lstm_cell(c_in, h_in, X, c_out, h_out);
	
	// X, c_in and h_in are assumed to be of 1x1. Change dimensions accordingly.
	
	//Parameters
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	//input clk, rst;
	
	//c_in : previous cell state 
	//h_in: tanh(o_in)
	input signed [DATA_WIDTH-1:0] c_in , h_in ;
	
        //X: current input
	input signed [DATA_WIDTH-1:0] X;
	
	//Weight arrays : {Wf, Wi ,Wc, Wo} where each element will be of size 2 x 1
	// Random values assigned - kept as constants for readability
	wire signed [DATA_WIDTH-1:0] Wf0 = 16'h0101;
	wire signed [DATA_WIDTH-1:0] Wf1 = -16'h0101;
	wire signed [DATA_WIDTH-1:0] Wi0 = 16'h0101;
	wire signed [DATA_WIDTH-1:0] Wi1 = 16'h0101;
	wire signed [DATA_WIDTH-1:0] Wc0 = -16'h0101;
	wire signed [DATA_WIDTH-1:0] Wc1 = 16'h0101;
	wire signed [DATA_WIDTH-1:0] Wo0 = 16'h0101;
        wire signed [DATA_WIDTH-1:0] Wo1 = -16'h0111;
	
	//Bias arrays : {bf, bi ,bc, bo} where each element will be of size 1 x 1
	wire signed [DATA_WIDTH-1:0] bf = 16'h0101;
	wire signed [DATA_WIDTH-1:0] bi = -16'h0101;	
	wire signed [DATA_WIDTH-1:0] bc = -16'h0111;
        wire signed [DATA_WIDTH-1:0] bo = 16'h0101;

	//c_out : current cell state
	//h_out : tanh(o_out)
	output wire signed [DATA_WIDTH-1:0] c_out, h_out;
	
	// Internal signals
	wire signed [DATA_WIDTH-1:0] f, i, iw, ct, cw, ot, out, c_act;
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] z1, z2, z3;
	
	// Precomputed shifted products for X and h_in using shift-add decomposition
	// For weights = 257 (16'h0101): (X << 8) + X = X + (X >>> 8) after shift
	// For weights = 273 (16'h0111): (X << 8) + (X << 4) + X = X + (X >>> 4) + (X >>> 8)
	// These avoid explicit multipliers and reduce logic depth
	wire signed [DATA_WIDTH-1:0] X257_s = X + (X >>> FRACT_WIDTH);
	wire signed [DATA_WIDTH-1:0] X273_s = X + (X >>> 4) + (X >>> FRACT_WIDTH);
	wire signed [DATA_WIDTH-1:0] H257_s = h_in + (h_in >>> FRACT_WIDTH);
	wire signed [DATA_WIDTH-1:0] H273_s = h_in + (h_in >>> 4) + (h_in >>> FRACT_WIDTH);
	
	// Gate A1: f = (Wf0*X + Wf1*h_in)>>>8 + bf
	// Wf0 = 257 -> X257_s, Wf1 = -257 -> -H257_s
	ShiftedProductAdd #(.DATA_WIDTH(DATA_WIDTH)) A1(
		.p1(X257_s),
		.p2(-H257_s),
		.b(bf),
		.out(f)
	);
	
	// Gate A2: iw = (Wi0*X + Wi1*h_in)>>>8 + bi
	// Wi0 = 257 -> X257_s, Wi1 = 257 -> H257_s
	ShiftedProductAdd #(.DATA_WIDTH(DATA_WIDTH)) A2(
		.p1(X257_s),
		.p2(H257_s),
		.b(bi),
		.out(iw)
	);
	sigmoid S1(iw, i);
	
	// Gate A3: cw = (Wc0*X + Wc1*h_in)>>>8 + bc
	// Wc0 = -257 -> -X257_s, Wc1 = 257 -> H257_s
	ShiftedProductAdd #(.DATA_WIDTH(DATA_WIDTH)) A3(
		.p1(-X257_s),
		.p2(H257_s),
		.b(bc),
		.out(cw)
	);
	tanh T1(cw, ct);
	
	assign z1 = (f*c_in)>>>FRACT_WIDTH;
	assign z2 = (i*ct)>>>FRACT_WIDTH;
	assign c_out = z1 + z2;
	
	// Gate A4: ot = (Wo0*X + Wo1*h_in)>>>8 + bo
	// Wo0 = 257 -> X257_s, Wo1 = -273 -> -H273_s
	ShiftedProductAdd #(.DATA_WIDTH(DATA_WIDTH)) A4(
		.p1(X257_s),
		.p2(-H273_s),
		.b(bo),
		.out(ot)
	);
	sigmoid S2(ot,out);
	
	//h_out =(out*tanh(c_out))
	tanh T2(c_out,c_act);
	assign z3 = (out*c_act)>>>FRACT_WIDTH;
	assign h_out = z3;
	
endmodule


module ShiftedProductAdd(p1, p2, b, out);
	// Adds two precomputed shifted products and bias
	// p1 and p2 are already shifted versions of (W*X)>>>FRACT_WIDTH
	parameter DATA_WIDTH = 16;
	
	input signed [DATA_WIDTH-1:0] p1, p2, b;
	output signed [DATA_WIDTH-1:0] out;
	
	assign out = p1 + p2 + b;
endmodule


module sigmoid(X,Y);
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
	
	wire signed [DATA_WIDTH-1:0] s1;
	assign s1 = X+16'h0200; 
	
	assign Y = (X[DATA_WIDTH-1]) ? (
		// negative
		(X < -16'h0200)? 16'h0000 : (s1>>>2) ) //if x<2?0:x+2/4
		// positive
		: ( (X>16'h0200) ? 16'h0100: (s1>>>2) );
endmodule


module tanh(X,Y);
// DESCRIPTION: takes 1 input number and returns an approx of tanh as output
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
		
	assign Y = (X[DATA_WIDTH-1]) ? (
		// negative
		(X < -16'h0100)? -16'h0100 : X )
		// positive
		: ( (X>16'h0100) ? 16'h0100: X );
endmodule
