module lstm_cell(c_in, h_in, X, c_out, h_out);
	
	// X, c_in and h_in are assumed to be of 1x1. Change dimensions accordingly.
	
	//Parameters
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	//c_in : previous cell state 
	//h_in: tanh(o_in)
	input signed [DATA_WIDTH-1:0] c_in , h_in ;
	
    //X: current input
	input signed [DATA_WIDTH-1:0] X;
	
	//Weight arrays : {Wf, Wi ,Wc, Wo} where each element will be of size 2 x 1
	wire signed [DATA_WIDTH-1:0] Wf0, Wf1, Wi0, Wi1, Wc0, Wc1, Wo0, Wo1;
	
	//Bias arrays : {bf, bi ,bc, bo} where each element will be of size 1 x 1
	wire signed [DATA_WIDTH-1:0] bf, bi, bc ,bo;
	
	//Assign weights and biases
	//Random values assigned
	
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

	//c_out : current cell state
	//h_out : tanh(o_out)
	output wire signed [DATA_WIDTH-1:0] c_out, h_out;
	
	wire signed [DATA_WIDTH-1:0] f, i, iw, ct, cw, ot, out, c_act;
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] z1, z2, z3;
	
	// CSE: Precompute X*W* for all gates
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] XWf0, XWi0, XWc0, XWo0;
	wire signed [DATA_WIDTH + DATA_WIDTH - 1:0] hWf1, hWi1, hWc1, hWo1;
	
	assign XWf0 = X * Wf0;
	assign XWi0 = X * Wi0;
	assign XWc0 = X * Wc0;
	assign XWo0 = X * Wo0;
	
	assign hWf1 = h_in * Wf1;
	assign hWi1 = h_in * Wi1;
	assign hWc1 = h_in * Wc1;
	assign hWo1 = h_in * Wo1;
	
	//f= Wf*{X h_in} + bf - using precomputed products
	wire signed [DATA_WIDTH-1:0] f_p1, f_p2;
	assign f_p1 = XWf0 >>> FRACT_WIDTH;
	assign f_p2 = hWf1 >>> FRACT_WIDTH;
	assign f = f_p1 + f_p2 + bf;
	
	//i= sigmoid(Wi*{X h_in} + bi)
	wire signed [DATA_WIDTH-1:0] iw_p1, iw_p2;
	assign iw_p1 = XWi0 >>> FRACT_WIDTH;
	assign iw_p2 = hWi1 >>> FRACT_WIDTH;
	assign iw = iw_p1 + iw_p2 + bi;
	sigmoid S1(iw, i);
	
	//ct= tanh(Wc*{X h_in} + bc)
	wire signed [DATA_WIDTH-1:0] cw_p1, cw_p2;
	assign cw_p1 = XWc0 >>> FRACT_WIDTH;
	assign cw_p2 = hWc1 >>> FRACT_WIDTH;
	assign cw = cw_p1 + cw_p2 + bc;
	tanh T1(cw, ct);
	
	// Compute c_out with balanced arithmetic
	assign z1 = (f * c_in) >>> FRACT_WIDTH;
	assign z2 = (i * ct) >>> FRACT_WIDTH;
	assign c_out = z1 + z2;
	
	//out= sigmoid(Wo*{X h_in} + bo)
	wire signed [DATA_WIDTH-1:0] ot_p1, ot_p2;
	assign ot_p1 = XWo0 >>> FRACT_WIDTH;
	assign ot_p2 = hWo1 >>> FRACT_WIDTH;
	assign ot = ot_p1 + ot_p2 + bo;
	sigmoid S2(ot, out);
	
	//h_out = (out * tanh(c_out))
	tanh T2(c_out, c_act);
	assign z3 = (out * c_act) >>> FRACT_WIDTH;
	assign h_out = z3;
	
endmodule


module sigmoid(X,Y);
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
	
	// Precompute boundary conditions
	wire signed [DATA_WIDTH-1:0] s1;
	assign s1 = X + 16'h0200; 
	
	// Optimize with precomputed comparison results
	wire x_neg = X[DATA_WIDTH-1];
	wire x_lt_neg = (X < -16'h0200);
	wire x_gt_pos = (X > 16'h0200);
	
	// Simplified activation with precomputed boundaries
	assign Y = x_neg ? (
		x_lt_neg ? 16'h0000 : (s1 >>> 2)
	) : (
		x_gt_pos ? 16'h0100 : (s1 >>> 2)
	);
endmodule


module tanh(X,Y);
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
	
	// Precompute comparison results
	wire x_neg = X[DATA_WIDTH-1];
	wire x_lt_neg = (X < -16'h0100);
	wire x_gt_pos = (X > 16'h0100);
	
	// Optimized piecewise linear approximation
	assign Y = x_neg ? (
		x_lt_neg ? -16'h0100 : X
	) : (
		x_gt_pos ? 16'h0100 : X
	);
endmodule


module ConcatMultAdd(X, h_in, W0, W1, b, out);	
	// Concatenates and Adds - original module preserved for reference
	// incoming data signed and fixed width
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
	input signed [DATA_WIDTH-1:0] X, h_in;
	input signed [DATA_WIDTH-1:0] W0, W1, b;
	output signed [DATA_WIDTH-1:0] out;

	// internal regs/wires
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p1,p2;
	
	// behavior: out = W*{x,h_in} + b where W={W0,W1}
	assign p1 = (W0*X)>>>FRACT_WIDTH; 
	assign p2 = (W1*h_in)>>>FRACT_WIDTH;
	assign out = p1 + p2 + b;

endmodule
