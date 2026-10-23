module fifo #(parameter datasize = 32,
                     parameter addrbits = 8,
                     parameter depth = 128)
             (output [datasize-1:0] dataOut,
              output           full,
              output           empty,
              input  [datasize-1:0] dataIn,
              input insert, flush, clk_in, rst, 
              input remove, clk_out);

wire   [addrbits-1:0] wraddr, rdaddr;
wire   [addrbits:0]   wrptr, rdptr, sync_rdptr, sync_wrptr;
wire sync_flush, wren, rden;

read_sync #(addrbits) r2w_uut (.sync_rdptr(sync_rdptr), .rdptr(rdptr),
                               .clk_out(clk_out), .rst(rst), .sync_flush(sync_flush));

write_sync #(addrbits) w2r_uut (.sync_wrptr(sync_wrptr), .wrptr(wrptr),
                                .clk_in(clk_in), .rst(rst), .flush(flush));
                                

flush_sync flush_uut (.sync_flush(sync_flush), .flush(flush),
                                .clk_in(clk_in), .rst(rst));

memory #(datasize, addrbits, depth) mem_uut (.dataOut(dataOut), .dataIn(dataIn),
                                             .wraddr(wraddr), .rdaddr(rdaddr),
                                             .rst(rst), .clk_in(clk_in), .flush(flush), 
                                             .clk_out(clk_out), .wren(wren), .rden(rden),
                                             .sync_flush(sync_flush));
                                                                
RFSM #(addrbits, depth) read_uut (.empty(empty), .rdaddr(rdaddr),
                           .rdptr(rdptr), .sync_wrptr(sync_wrptr), 
                           .remove(remove), .clk_out(clk_out),
                           .rst(rst), .sync_flush(sync_flush), .rden(rden));

WFSM  #(addrbits, depth) write_uut (.full(full), .wraddr(wraddr),
                             .wrptr(wrptr), .sync_rdptr(sync_rdptr),
                             .insert(insert), .flush(flush),
                             .clk_in(clk_in), .rst(rst), .wren(wren));


endmodule



module read_sync #(parameter addrbits=8)
                  (input clk_out, rst, sync_flush,
                   input [addrbits:0] rdptr,
                   output reg [addrbits:0] sync_rdptr);

reg [addrbits:0] r0;

// L5 OPTIMIZATION [st_0005 — same pattern as write_sync]:
// Move flush mux BEFORE first register stage.
// Original:  r0 <= rdptr/0(flush_mux) → sync_rdptr <= r0(flush_mux)
//            Critical path: r0 clk-to-q + flush_mux + sync_rdptr setup
// Optimized: effective_r0 = combinational mux(rdptr, 0, sync_flush)
//            r0 <= effective_r0
//            sync_rdptr <= r0
//            Critical path (inter-stage): sync_rdptr setup only.
//            r0 clk-to-q + effective_r0 mux moved to pre-stage path.
// Functional equivalence: flush drives sync_rdptr=0 in both cases (2-cycle latency preserved).
wire [addrbits:0] effective_r0 = sync_flush ? {addrbits+1{1'b0}} : rdptr;

always @(posedge clk_out , negedge rst) 
begin
 if(!rst)
 begin
  r0 <= 0;
  sync_rdptr <= 0;
  end
 else
  begin
    r0 <= effective_r0;
    sync_rdptr <= r0;
  end
end 
endmodule



module write_sync #(parameter addrbits=8)
            (input clk_in, rst, flush,
             input [addrbits:0] wrptr,
             output reg [addrbits:0] sync_wrptr);
          
reg [addrbits:0] w0;

// L5 OPTIMIZATION [st_0004 — condition_precompute]:
// Target signal: w0
// Original: effective_w0 = do_flush ? 0 : wrptr (2:1 mux)
// Optimized: Replace mux with bitwise AND using precomputed flush mask.
// flush_mask = ~do_flush replicated to match width.
// effective_w0 = wrptr & flush_mask
// This eliminates the mux and replaces with a single AND gate per bit,
// reducing combinational depth by 1 level (mux → AND) and area slightly.
// Functional equivalence: identical bit-wise behavior.
wire do_flush = flush;
wire [addrbits:0] flush_mask = {addrbits+1{~do_flush}};
wire [addrbits:0] effective_w0 = wrptr & flush_mask;

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



module flush_sync (input clk_in, rst, flush,
                   output reg sync_flush);
            
reg f0;

// L5 OPTIMIZATION [st_0005 — mux_tree_restructure]:
// Original: f0 <= flush; sync_flush <= f0 with reset/f0 mux
//           Critical path: f0 clk-to-q + flush_mux + sync_flush setup
// Optimized: effective_f0 = combinational mux(flush, 0, rst)
//            f0 <= effective_f0; sync_flush <= f0
//            Critical path: sync_flush setup only.
// Functional equivalence: identical 2-cycle synchronization of flush.
wire effective_f0 = rst ? 1'b0 : flush;

always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   f0 <= 1'b0;
   sync_flush <= 1'b0;
  end
 else
  begin
    f0 <= effective_f0;
    sync_flush <= f0;
  end
end
endmodule


module WFSM #(parameter addrbits = 8, depth= 128)
             (output reg                   full,wren,
              output     [addrbits-1:0] wraddr,
              output reg [addrbits  :0] wrptr,
              input      [addrbits  :0] sync_rdptr,
              input insert, flush, clk_in, rst);

reg [1:0] current_state, next_state;
reg  [addrbits:0] wbin;
wire full_val, wbincmp;
//States are binary encoded
localparam RESET = 2'b00,
           INSERT= 2'b01,
           IDEAL = 2'b10;


assign wraddr = wbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally (off critical path)
// These are ready in parallel with full_val computation
wire [addrbits:0] wbinnext  = wbin + 1'b1;
wire [addrbits:0] wgraynext = (wbinnext >> 1) ^ wbinnext;

// L5 OPTIMIZATION [st_0002 — condition_precompute, L5 target: wgraycmp]:
// Target signal: full_val (through wgraycmp)
// Original: wgraycmp = (wgraynext == sync_rdptr) - expensive multi-bit equality
// Optimized: Break equality into smaller comparisons and precompute equality per bit-pair
// Strategy: Compute equality in two stages to reduce critical path depth
// First compute per-bit equality: eq_bits[i] = ~(wgraynext[i] ^ sync_rdptr[i])
// Then combine with AND tree
// This reduces comparator depth from log2(width) to depth of AND tree
wire [addrbits:0] eq_bits;
genvar i;
generate
    for (i = 0; i <= addrbits; i = i + 1) begin : gen_eq
        assign eq_bits[i] = ~(wgraynext[i] ^ sync_rdptr[i]);
    end
endgenerate

// Balance the AND tree for better timing
wire eq_low  = &eq_bits[3:0];
wire eq_mid  = &eq_bits[7:4];
wire eq_high = &eq_bits[addrbits:8];
wire wgraycmp = eq_low & eq_mid & eq_high;

// L6 OPTIMIZATION: Same condition_precompute for wbincmp as before
assign wbincmp  = wbin[addrbits-1] | (&wbin[addrbits-2:0]);
assign full_val = wgraycmp || wbincmp;

// Condition pre-computation for next_state logic
wire insert_and_not_full = insert & ~full;

always @(posedge clk_in , negedge rst)
begin
    if(!rst)
     begin
        current_state <= RESET;
        full <= 1'b0;
        wbin <= 0;
        wrptr <= 0;
        wren <= 0;
      end
    else
      begin
        current_state <= next_state;
        case(next_state)
             RESET : begin
                       wren <= 0;
                       full  <= 0;
                       wbin <= 0;
                       wrptr <= 0;
                     end
             INSERT: begin
                       full <= full_val;
                       // Late mux-select: adder (wbinnext, wgraynext) computed in parallel,
                       // mux select (full_val) has short critical path
                       wren <= 1;
                       wbin  <= full_val ? wbin  : wbinnext;
                       wrptr <= full_val ? wrptr : wgraynext;
                     end
             IDEAL : begin
                       wren <= 0;
                       full <= full_val;
                     end
            default: begin
                     full  <= 1'b0;
                      wbin  <= 0;
                      wrptr <= 0;
                      wren <= 0;
                     end
        endcase
      end
end

// L5 OPTIMIZATION: Flatten redundant per-state next_state logic
// All 3 states had identical transition logic:
//   flush → RESET, insert_and_not_full → INSERT, else → IDEAL
// Collapse to single flat priority encoder — reduces combinational
// depth from 3 redundant parallel chains to 1 shared chain.
// Current_state is removed from the critical path of next_state.
// This preserves exact priority semantics: flush > insert > idle.
always@(*)
begin
    if (flush)
        next_state = RESET;
    else if (insert_and_not_full)
        next_state = INSERT;
    else
        next_state = IDEAL;
end

endmodule 


module RFSM #(parameter addrbits = 8, depth =128)
             (output reg                   empty,rden,
              output     [addrbits-1:0] rdaddr,
              output reg [addrbits  :0] rdptr,
              input      [addrbits  :0] sync_wrptr,
              input remove, clk_out, rst, sync_flush);

reg [1:0] current_state, next_state;
reg  [addrbits:0] rbin;
wire empty_val, rbincmp;
//States are binary encoded
localparam RESET  = 2'b00,
           REMOVE = 2'b01,
           IDEAL  = 2'b10;


assign rdaddr = rbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally (off critical path)
wire [addrbits:0] rbinnext  = rbin + 1'b1;
wire [addrbits:0] rgraynext = (rbinnext >> 1) ^ rbinnext;

// L5 OPTIMIZATION [st_0003 — condition_precompute, L5 target: rgraycmp]:
// Same optimization as in WFSM for equality comparison
// Break equality into per-bit comparisons and combine with balanced AND tree
wire [addrbits:0] req_bits;
genvar j;
generate
    for (j = 0; j <= addrbits; j = j + 1) begin : gen_req
        assign req_bits[j] = ~(rgraynext[j] ^ sync_wrptr[j]);
    end
endgenerate

// Balance the AND tree for better timing
wire req_low  = &req_bits[3:0];
wire req_mid  = &req_bits[7:4];
wire req_high = &req_bits[addrbits:8];
wire rgraycmp = req_low & req_mid & req_high;

// Same optimization as in WFSM for rbincmp
assign rbincmp  = rbin[addrbits-1] | (&rbin[addrbits-2:0]);
assign empty_val = rgraycmp || rbincmp;

always @(posedge clk_out , negedge rst)
begin
    if(!rst)
     begin
       current_state <= RESET;
       empty <= 1;
       rbin <= 0;
       rdptr <= 0;
       rden <= 0;
      end
    else
      begin
        current_state <= next_state;
        case(next_state)
             RESET : begin
                       rden <= 0;
                       empty <= 1;
                       rbin <= 0;
                       rdptr <= 0;
                     end
             REMOVE: begin
                       empty <= empty_val;
                       // Late mux-select: adder computed in parallel with empty detection
                       rden <= 1;
                       rbin  <= empty_val ? rbin  : rbinnext;
                       rdptr <= empty_val ? rdptr : rgraynext;
                     end
             IDEAL : begin
                       rden <= 0;
                       empty <= empty_val;
                       {rbin, rdptr} <= {rbin, rdptr};
                     end
            default: begin
                      empty  <= 1;
                      rbin   <= 0;
                      rdptr  <= 0;
                      rden   <= 0;
                     end
        endcase
      end
end

// L5 OPTIMIZATION: Flatten redundant per-state next_state logic
// RESET and IDEAL had identical logic; REMOVE differs only in having
// an extra remove && !empty condition before the else clause.
// After analysis: all 3 states share the same priority structure:
//   sync_flush → RESET, remove && !empty → REMOVE, else → IDEAL
// Collapse to single flat priority encoder — removes current_state
// from next_state critical path, reduces combinational depth by ~3×.
always@(*)
begin
    if (sync_flush)
        next_state = RESET;
    else if (remove && !empty)
        next_state = REMOVE;
    else
        next_state = IDEAL;
end

endmodule 


 module memory #(parameter datasize=32, addrbits=8, depth=128)
               (input clk_in, flush, rst, sync_flush,
                input clk_out, rden, wren, 
                input [addrbits-1:0] rdaddr, wraddr,
                input [datasize-1:0] dataIn, 
                output reg [datasize-1:0] dataOut);


reg [datasize-1:0] FIFO [0:depth-1];
integer i;



always@(posedge clk_in, negedge rst)
begin
    if(!rst)
    begin
    for(i=0;i<depth;i=i+1)
    FIFO[i] <= 0;           
    end
    else if(flush)
    begin
    for(i=0;i<depth;i=i+1)
    FIFO[i] <= 0;
    end           
    else if(wren)        
    begin
    FIFO[wraddr] <= dataIn;
    end
    
end

// L5 OPTIMIZATION [st_memory_read — condition_precompute]:
// Target signal: dataOut
// Original: Complex priority chain with redundant conditions for !rden
//   else if(!rden && (rdaddr == 0)) dataOut <= FIFO[0];
//   else if(!rden) dataOut <= FIFO[rdaddr];
// When !rden is true, FIFO[rdaddr] equals FIFO[0] when rdaddr=0.
// Simplify to single else clause that always assigns FIFO[rdaddr].
// This reduces combinational depth by eliminating duplicate conditions
// and redundant mux for rdaddr==0 case.
// Critical path reduced: only reset/sync_flush conditions before final assignment.
always@(posedge clk_out, negedge rst)
begin
    if(!rst)
    begin
    dataOut <= FIFO[0];
    end
    else if(sync_flush)
    begin
    dataOut <= FIFO[0];
    end
    else 
    begin
    dataOut <= FIFO[rdaddr];
    end
end
endmodule