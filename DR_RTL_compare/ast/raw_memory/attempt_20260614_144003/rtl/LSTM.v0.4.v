module lstm_cell(c_in, h_in, X, c_out, h_out);
	
	//Parameters
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] c_in , h_in ;
	input signed [DATA_WIDTH-1:0] X;
	
	wire signed [DATA_WIDTH-1:0] Wf0, Wf1, Wi0, Wi1, Wc0, Wc1, Wo0, Wo1;
	wire signed [DATA_WIDTH-1:0] bf, bi, bc ,bo;
	
	assign Wf0=16'h0101;
	assign Wf1=-16'h0101;
	
	assign Wi0=16'h0101;
	assign Wi1=16'h0101;
	
	assign Wc0=-16'h0101;
	assign Wc1=16'h0101;
	
	assign Wo0=16'h0101;
	assign Wo1=-16'h0111;
	
	assign bf=16'h0101;
	assign bi=-16'h0101;	
	assign bc=-16'h0111;
	assign bo=16'h0101;

	output wire signed [DATA_WIDTH-1:0] c_out, h_out;
	
	wire signed [DATA_WIDTH-1:0] f, i, iw, ct, cw, ot, out, c_act;
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] z1, z2, z3;
	
	// Pre-compute condition wires for sigmoid/tanh comparisons
	// This reduces repeated comparisons in the piecewise functions
	
	//f= Wf*{X h_in} + bf
	ConcatMultAdd A1(X, h_in, Wf0, Wf1, bf, f);
	
	//i= sigmoid(Wi*{X h_in} + bi)
	ConcatMultAdd A2(X, h_in, Wi0, Wi1, bi, iw);
	sigmoid S1(iw, i);
	
	//ct= tanh(Wc*{X h_in} + bc)
	ConcatMultAdd A3(X, h_in, Wc0, Wc1, bc, cw);
	tanh T1(cw, ct);
	
	// Restructure multiplication-addition to reduce critical path
	// Original: z1 = (f*c_in)>>>FRACT_WIDTH; z2 = (i*ct)>>>FRACT_WIDTH; c_out = z1 + z2;
	// Optimization: Pre-compute products in parallel, then add
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] prod_f_cin = f * c_in;
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] prod_i_ct = i * ct;
	
	assign z1 = prod_f_cin >>> FRACT_WIDTH;
	assign z2 = prod_i_ct >>> FRACT_WIDTH;
	assign c_out = z1 + z2;
	
	//out=  sigmoid(Wo*{X h_in} + bo)
	ConcatMultAdd A4(X, h_in, Wo0, Wo1, bo, ot);
	sigmoid S2(ot,out);
	
	//h_out =(out*tanh(c_out))
	tanh T2(c_out,c_act);
	assign z3 = (out*c_act)>>>FRACT_WIDTH;
	assign h_out = z3;
	
endmodule


module sigmoid(X,Y);
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
	
	wire signed [DATA_WIDTH-1:0] s1;
	assign s1 = X + 16'h0200; 
	
	// Pre-compute conditions to avoid repeated comparisons
	// Original code had X[DATA_WIDTH-1] check and then repeated X < -16'h0200
	// Restructure to compute conditions once and use mux tree
	wire is_negative = X[DATA_WIDTH-1];
	wire below_neg_thresh = (X < -16'h0200);
	wire above_pos_thresh = (X > 16'h0200);
	wire in_middle = ~is_negative | ~below_neg_thresh;
	
	// Condition precomputation with mux restructuring
	assign Y = below_neg_thresh ? 16'h0000 :
			   (in_middle & is_negative) ? (s1 >>> 2) :
			   above_pos_thresh ? 16'h0100 :
			   (s1 >>> 2);
			   
endmodule


module tanh(X,Y);
// DESCRIPTION: takes 1 input number and returns an approx of tanh as output

// input parameters
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
// define ports
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
	
	// Pre-compute conditions for piecewise linear approximation
	wire is_negative = X[DATA_WIDTH-1];
	wire below_neg_thresh = (X < -16'h0100);
	wire above_pos_thresh = (X > 16'h0100);
	
	// Restructured mux tree for better timing
	assign Y = below_neg_thresh ? -16'h0100 :
			   above_pos_thresh ? 16'h0100 :
			   X;
endmodule


module ConcatMultAdd(X, h_in, W0, W1, b, out);	
	// Concatenates and Adds
	// incoming data signed and fixed width
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X, h_in;
	input signed [DATA_WIDTH-1:0] W0, W1, b;
	output signed [DATA_WIDTH-1:0] out;

	// internal regs/wires
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p1,p2;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] sum;
	
	// behavior: out = W*{x,h_in} + b where W={W0,W1}
	// Original: p1 = (W0*X)>>>FRACT_WIDTH; p2 = (W1*h_in)>>>FRACT_WIDTH; out = p1 + p2 + b;
	// Optimization: Precompute products in parallel, then combine
	assign p1 = W0 * X;
	assign p2 = W1 * h_in;
	
	// Common subexpression elimination for the shift operation
	// Compute sum before shifting to reduce logic depth
	assign sum = p1 + p2;
	assign out = (sum >>> FRACT_WIDTH) + b;
	
endmodule