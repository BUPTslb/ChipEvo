module write_sync #(parameter addrbits=8)
            (input clk_in, rst, flush,
             input [addrbits:0] wrptr,
             output reg [addrbits:0] sync_wrptr);
          
reg [addrbits:0] w0;

// L6 OPTIMIZATION [condition_precompute]: Pre-compute flush condition
wire do_flush = flush;

// L6 OPTIMIZATION [logic_tree_balance]: Decompose mux into bit-level assignments
// Original: effective_w0 = do_flush ? {addrbits+1{1'b0}} : wrptr
// Decomposed: Each bit is individually selected, allowing synthesis to optimize
// each bit path independently. This is particularly effective for wide buses.
wire [addrbits:0] effective_w0;
genvar k;
generate
  for (k = 0; k <= addrbits; k = k + 1) begin : mux_bits
    assign effective_w0[k] = do_flush ? 1'b0 : wrptr[k];
  end
endgenerate

always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   w0 <= 0;
   sync_wrptr <= 0;
  end
 else
 begin
    w0 <= effective_w0;
    sync_wrptr <= w0;
  end
end 
endmodule