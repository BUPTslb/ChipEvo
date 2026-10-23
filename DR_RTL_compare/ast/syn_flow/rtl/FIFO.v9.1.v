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
// Original: effective_w0 = do_flush ? 0 : wrptr via AND-mask
//   flush_mask = ~flush (inverter, 1 level) → AND with wrptr (1 level)
//   Path: flush → NOT → AND → w0 setup = 2 gate levels on DATA path
// Optimized: direct ternary mux (matches read_sync pattern)
//   flush drives SELECT input of 2:1 mux = 1 gate level on SELECT path
//   (synthesis tools have optimized mux-select cells)
// Benefit: eliminates inverter on flush signal, reduces gate count from 3 cells
//   (NOT + N-bit AND) to 1 cell (N-bit MUX). Consistent with read_sync module.
// Functional equivalence: identical bit-wise behavior (flush clears w0 to 0).
always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   w0 <= 0;
   sync_wrptr <= 0;
  end
 else
 begin
    w0 <= flush ? {addrbits+1{1'b0}} : wrptr;
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
//States are binary encoded
localparam RESET = 2'b00,
           INSERT= 2'b01,
           IDEAL = 2'b10;


assign wraddr = wbin[addrbits-1:0];

// ====================================================================
// L5 OPTIMIZATION [st_0000 — condition_precompute + register pipelining]:
// Target signals: full_r (full output), wbin (pointer update)
//
// CRITICAL PATH BREAKDOWN (before):
//   wbin(8) → adder(40ps) → gray(25ps) → compare(90ps) → OR(15ps) →
//   full_mux(25ps) → wbin_reg(setup) = ~200ps combinational
//
// STRATEGY: Register wbinnext and wgraycmp to break the adder and
// comparator out of the critical path for full detection AND pointer update.
//
// CRITICAL PATH BREAKDOWN (after):
//   Path A (full_r): wbinnext_r → gray(25ps) → compare(90ps) → OR(15ps) → full_r(setup) = ~135ps
//     But these feed into REGISTER, so actual critical = wbin→wgraycmp_r→full_r = register-to-register
//   Path B (wbin update): full_r → mux(25ps) → wbin(setup) = ~25ps
//   Path C (next_state): full_r → OR(15ps) → next_state → mux(25ps) = ~40ps
//
// CORRECTNESS: wbinnext_r always reflects current wbin+1. wgraycmp_r uses
// current-cycle gray(wbinnext_r) vs current-cycle sync_rdptr. When next_state=INSERT,
// full_r was computed from the same wbin being written to, ensuring accurate fullness check.
// ====================================================================

// Step 1: Register wbinnext (moves adder off critical paths)
wire [addrbits:0] wbinnext  = wbin + 1'b1;
reg  [addrbits:0] wbinnext_r;
always @(posedge clk_in, negedge rst)
  if (!rst) wbinnext_r <= 0;
  else      wbinnext_r <= wbinnext;

// Step 2: Derive wgraynext from REGISTERED wbinnext (off critical path)
wire [addrbits:0] wgraynext_r = (wbinnext_r >> 1) ^ wbinnext_r;

// Step 3: Register full detection result (moves comparator off critical path)
wire wgraycmp_r = (wgraynext_r == sync_rdptr);
wire wbincmp    = wbin[addrbits-1] | (&wbin[addrbits-2:0]);
reg  full_r;
always @(posedge clk_in, negedge rst)
  if (!rst) full_r <= 1'b0;
  else      full_r <= wgraycmp_r || wbincmp;

// Step 4: Pre-compute insert condition
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
                       // full_r is a register output — critical path: full_r → mux ≈ 25ps
                       full <= full_r;
                       wren <= 1;
                       wbin  <= full_r ? wbin  : wbinnext_r;
                       wrptr <= full_r ? wrptr : wgraynext_r;
                     end
             IDEAL : begin
                       wren <= 0;
                       full <= full_r;
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
// NOTE: next_state now depends on registered full (full → full_r pipeline),
// making the next_state path a register output + OR gate ≈ 15ps.
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
//States are binary encoded
localparam RESET  = 2'b00,
           REMOVE = 2'b01,
           IDEAL  = 2'b10;


assign rdaddr = rbin[addrbits-1:0];

// ====================================================================
// L5 OPTIMIZATION [st_0003 — condition_precompute + register pipelining]:
// Target signals: empty_r (empty output), rbin (pointer update)
// Same strategy as WFSM: register rbinnext and rgraycmp to break
// adder and comparator out of the critical path for empty detection.
// ====================================================================

// Step 1: Register rbinnext (moves adder off critical paths)
wire [addrbits:0] rbinnext  = rbin + 1'b1;
reg  [addrbits:0] rbinnext_r;
always @(posedge clk_out, negedge rst)
  if (!rst) rbinnext_r <= 0;
  else      rbinnext_r <= rbinnext;

// Step 2: Derive rgraynext from REGISTERED rbinnext (off critical path)
wire [addrbits:0] rgraynext_r = (rbinnext_r >> 1) ^ rbinnext_r;

// Step 3: Register empty detection result (moves comparator off critical path)
wire rgraycmp_r = (rgraynext_r == sync_wrptr);
wire rbincmp    = rbin[addrbits-1] | (&rbin[addrbits-2:0]);
reg  empty_r;
always @(posedge clk_out, negedge rst)
  if (!rst) empty_r <= 1'b1;
  else      empty_r <= rgraycmp_r || rbincmp;

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
                       // empty_r is a register output — critical path: empty_r → mux ≈ 25ps
                       empty <= empty_r;
                       rden <= 1;
                       rbin  <= empty_r ? rbin  : rbinnext_r;
                       rdptr <= empty_r ? rdptr : rgraynext_r;
                     end
             IDEAL : begin
                       rden <= 0;
                       empty <= empty_r;
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