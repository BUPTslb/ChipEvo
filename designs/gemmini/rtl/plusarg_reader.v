module plusarg_reader (out);
	parameter FORMAT = "borked=%d";
	parameter WIDTH = 1;
	parameter [WIDTH - 1:0] DEFAULT = 0;
	output wire [WIDTH - 1:0] out;
	reg [WIDTH - 1:0] myplus;
	assign out = myplus;
	initial begin
        myplus = DEFAULT;
        // synopsys translate_off
        if (!$value$plusargs(FORMAT, myplus))
            myplus = DEFAULT;
        // synopsys translate_on
    end
endmodule

