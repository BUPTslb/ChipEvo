module top(input clk,rst,s_en,d_en,m_piso,m_sipo,
           input [7:0]datain,
           output [7:0]dataout  
          );

wire[7:0]s_out,des_in;
wire[9:0]e_out,dec_in;
wire p_out;


//scrambler

scrambler SCR(.clk(clk),
               .rst(rst),
               .enable(s_en),
               .datain(datain),
               .dataout(s_out)
               );
//encoder

encoder ENC(.data_in(s_out),
             .rd(1'b1),
             .k(1'b0),
             .data_out(e_out)
                );

//PISO

piso PISO(.clk(clk),
          .rst(rst),
          .in(e_out),
          .mode(m_piso),
          .out(p_out)
          );
//SIPO

sipo SIPO(.clk(clk),
          .rst(rst),
          .in(p_out),
          .mode(m_sipo),
          .out(dec_in)
          );

//decoder

decoder DEC(.data_in(dec_in),
             .rd(1'b1),
             .k(1'b0),
             .data_out(des_in)
                );

// descrambler

descrambler DES(.clk(clk),
               .rst(rst),
               .enable(d_en),
               .data_in(des_in),
               .data_out(dataout)
               );

endmodule


//==========================================PCIe -- PISO DESIGN CODE===================================================

module piso #(parameter WIDTH=10)(input clk, input rst, input [WIDTH-1:0]in,input mode,output reg out);
reg [WIDTH-1:0]temp;

// --- L5 assignment-slice: precompute next_temp (condition_precompute on temp target) ---
wire [WIDTH-1:0] next_temp = mode ? in : {1'b0, temp[WIDTH-1:1]};

// --- L5 assignment-slice: precompute next_out from next_temp[0] ---
wire next_out = next_temp[0];

always@(posedge clk or negedge rst)
begin
        if(!rst)
               begin
                    temp<=0;  
                    out<=0;
               end
           
            else
                begin
                if(mode)
                    temp<=in;
                    else
                        begin
                              out<=next_out;
                              temp<={1'b0,temp[WIDTH-1:1]};
                               
                        end
                 end       
end
endmodule


//=========================================================PCIe --SIPO DESIGN CODE===============================================================

module sipo#(parameter width=10)(input clk, input rst, input in, input mode,output reg [width-1:0]out);
reg [width-1:0]temp;

// --- L5 assignment-slice: precompute next_temp (condition_precompute on temp target) ---
wire [width-1:0] next_temp = mode ? {in, temp[width-1:1]} : temp;

// --- L5 assignment-slice: precompute next_out (condition_precompute on out target) ---
wire [width-1:0] next_out = mode ? out : temp;

always @ (posedge clk or negedge rst)
begin
    if (!rst) begin
        temp <= 0;
        out  <= 0;
    end else begin
        temp <= next_temp;
        out  <= next_out;
    end
end
endmodule