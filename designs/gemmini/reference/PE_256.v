module PE_256 (
	clock,
	io_in_a,
	io_in_b,
	io_in_d,
	io_out_a,
	io_out_b,
	io_out_c,
	io_in_control_dataflow,
	io_in_control_propagate,
	io_in_control_shift,
	io_out_control_dataflow,
	io_out_control_propagate,
	io_out_control_shift,
	io_in_id,
	io_out_id,
	io_in_last,
	io_out_last,
	io_in_valid,
	io_out_valid,
	io_bad_dataflow
);
	input clock;
	input [7:0] io_in_a;
	input [19:0] io_in_b;
	input [19:0] io_in_d;
	output wire [7:0] io_out_a;
	output wire [19:0] io_out_b;
	output wire [19:0] io_out_c;
	input io_in_control_dataflow;
	input io_in_control_propagate;
	input [4:0] io_in_control_shift;
	output wire io_out_control_dataflow;
	output wire io_out_control_propagate;
	output wire [4:0] io_out_control_shift;
	input [2:0] io_in_id;
	output wire [2:0] io_out_id;
	input io_in_last;
	output wire io_out_last;
	input io_in_valid;
	output wire io_out_valid;
	output wire io_bad_dataflow;
	wire [19:0] _mac_unit_io_out_d;
	reg [31:0] c1;
	reg [31:0] c2;
	reg last_s;
	wire [4:0] shift_offset = (last_s == io_in_control_propagate ? 5'h00 : io_in_control_shift);
	wire [31:0] _GEN = {27'h0000000, shift_offset - 5'h01};
	wire [31:0] _io_out_c_point_five_T_3 = $signed($signed(c1) >>> _GEN);
	wire [31:0] _GEN_0 = {27'h0000000, shift_offset};
	wire [31:0] _io_out_c_T = $signed($signed(c1) >>> _GEN_0);
	wire [31:0] _io_out_c_T_2 = _io_out_c_T + {31'h00000000, (|shift_offset & _io_out_c_point_five_T_3[0]) & (|(shift_offset < 5'h02 ? 32'h00000000 : c1 & ((32'h00000001 << _GEN) - 32'h00000001)) | _io_out_c_T[0])};
	wire [31:0] _GEN_1 = {27'h0000000, shift_offset - 5'h01};
	wire [31:0] _io_out_c_point_five_T_8 = $signed($signed(c2) >>> _GEN_1);
	wire [31:0] _io_out_c_T_11 = $signed($signed(c2) >>> _GEN_0);
	wire [31:0] _io_out_c_T_13 = _io_out_c_T_11 + {31'h00000000, (|shift_offset & _io_out_c_point_five_T_8[0]) & (|(shift_offset < 5'h02 ? 32'h00000000 : c2 & ((32'h00000001 << _GEN_1) - 32'h00000001)) | _io_out_c_T_11[0])};
	wire [31:0] _GEN_2 = {{12 {io_in_d[19]}}, io_in_d};
	wire [31:0] _GEN_3 = {{12 {_mac_unit_io_out_d[19]}}, _mac_unit_io_out_d};
	always @(posedge clock)
		if (io_in_valid) begin
			if (io_in_control_dataflow) begin
				if (io_in_control_dataflow & io_in_control_propagate)
					c1 <= _GEN_2;
				if (~io_in_control_dataflow | io_in_control_propagate)
					;
				else
					c2 <= _GEN_2;
			end
			else begin
				c1 <= (io_in_control_propagate ? {{12 {io_in_d[19]}}, io_in_d} : _GEN_3);
				c2 <= (io_in_control_propagate ? _GEN_3 : {{12 {io_in_d[19]}}, io_in_d});
			end
			last_s <= io_in_control_propagate;
		end
	MacUnit mac_unit(
		.io_in_a(io_in_a),
		.io_in_b((io_in_control_dataflow ? (io_in_control_propagate ? c2[7:0] : c1[7:0]) : io_in_b[7:0])),
		.io_in_c((io_in_control_dataflow ? {{12 {io_in_b[19]}}, io_in_b} : (io_in_control_propagate ? c2 : c1))),
		.io_out_d(_mac_unit_io_out_d)
	);
	assign io_out_a = io_in_a;
	assign io_out_b = (io_in_control_dataflow ? _mac_unit_io_out_d : io_in_b);
	assign io_out_c = (io_in_control_dataflow ? (io_in_control_propagate ? c1[19:0] : c2[19:0]) : (io_in_control_propagate ? ($signed(_io_out_c_T_2) > 32'sh0007ffff ? 20'h7ffff : ($signed(_io_out_c_T_2) < -32'sh00080000 ? 20'h80000 : _io_out_c_T_2[19:0])) : ($signed(_io_out_c_T_13) > 32'sh0007ffff ? 20'h7ffff : ($signed(_io_out_c_T_13) < -32'sh00080000 ? 20'h80000 : _io_out_c_T_13[19:0]))));
	assign io_out_control_dataflow = io_in_control_dataflow;
	assign io_out_control_propagate = io_in_control_propagate;
	assign io_out_control_shift = io_in_control_shift;
	assign io_out_id = io_in_id;
	assign io_out_last = io_in_last;
	assign io_out_valid = io_in_valid;
	assign io_bad_dataflow = 1'h0;
endmodule
