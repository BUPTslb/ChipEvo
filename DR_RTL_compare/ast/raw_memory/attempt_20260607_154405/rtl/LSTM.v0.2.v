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
	
	// --- Optimization: Extract shared partial products (CSE) ---
	// 8 common subexpressions X*W and h_in*W reused across all 4 gates.
	// Synthesis can now share multiplier resources explicitly.
	
	// Shared partial products: X * Wi (4 products)
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p1_x  = (X     * Wf0) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p2_h   = (h_in  * Wf1) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p3_x  = (X     * Wi0) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p4_h   = (h_in  * Wi1) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p5_x  = (X     * Wc0) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p6_h   = (h_in  * Wc1) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p7_x  = (X     * Wo0) >>> FRACT_WIDTH;
	wire signed [DATA_WIDTH+DATA_WIDTH-1:0] p8_h   = (h_in  * Wo1) >>> FRACT_WIDTH;

	// Gate computations (inlined ConcatMultAdd with shared products)
	wire signed [DATA_WIDTH-1:0] f, i, iw, ct, cw, ot, out, c_act;

	//f= Wf*{X h_in} + bf  (forget gate pre-activation)
	assign iw = p1_x + p2_h + bf;

	//i= sigmoid(Wi*{X h_in} + bi)  (input gate pre-activation)
	assign cw = p3_x + p4_h + bi;

	//ct= tanh(Wc*{X h_in} + bc)  (cell candidate pre-activation)
	assign ot = p5_x + p6_h + bc;

	//out= sigmoid(Wo*{X h_in} + bo)  (output gate pre-activation)
	assign f  = p7_x + p8_h + bo;

	// Activation functions (L5 slices for f, i, ct, ot → activated)
	sigmoid S1(iw, i);
	tanh T1(cw, ct);

	// c_out = f*c_in + i*ct  (cell state update)
	assign c_out = ((f  * c_in) >>> FRACT_WIDTH) +
	               ((i  * ct)   >>> FRACT_WIDTH);

	// h_out = out * tanh(c_out)  (hidden state output)
	sigmoid S2(ot, out);
	tanh T2(c_out, c_act);
	assign h_out = (out * c_act) >>> FRACT_WIDTH;
	
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

// input parameters
	parameter DATA_WIDTH = 16;
	parameter FRACT_WIDTH = 8;
	
// define ports
	input signed [DATA_WIDTH-1:0] X;
	output wire signed [DATA_WIDTH-1:0] Y;
		
	assign Y = (X[DATA_WIDTH-1]) ? (
		// negative
		(X < -16'h0100)? -16'h0100 : X )
		// positive
		: ( (X>16'h0100) ? 16'h0100: X );
endmodule


// ConcatMultAdd preserved for backward compatibility / reuse in other contexts
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
	
	// behavior: out = W*{x,h_in} + b where W={W0,W1}
	assign p1 = (W0*X)>>>FRACT_WIDTH; 
	assign p2 = (W1*h_in)>>>FRACT_WIDTH;
	assign out = p1 + p2 + b;

endmodule
