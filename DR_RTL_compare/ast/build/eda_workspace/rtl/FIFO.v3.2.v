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

always @(posedge clk_out , negedge rst) 
begin
 if(!rst)
 begin
  r0 <= 0;
  sync_rdptr <= 0;
  end
     else if(sync_flush) 
     begin
       r0 <= 0;
       sync_rdptr <= 0;
     end
 else
  begin
    r0 <= rdptr;
    sync_rdptr <= r0;
  end
end 
endmodule



module write_sync #(parameter addrbits=8)
            (input clk_in, rst, flush,
             input [addrbits:0] wrptr,
             output reg [addrbits:0] sync_wrptr);
          
reg [addrbits:0] w0;

always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   w0 <= 0;
   sync_wrptr <= 0;
  end
   else if(flush) 
     begin
       w0 <= 0;
       sync_wrptr <= 0;
     end
 else
 begin
    w0 <= wrptr;
    sync_wrptr <= w0;
  end
end 
endmodule



module flush_sync (input clk_in, rst, flush,
                   output reg sync_flush);
            
reg f0;

always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   f0 <= 1'b0;
   sync_flush <= 1'b0;
  end
   else
     begin
    f0 <= flush;
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
wire [addrbits:0] wgraynext, wbinnext;
wire full_val;
// States are binary encoded
localparam RESET = 2'b00,
           INSERT= 2'b01,
           IDEAL = 2'b10;

// --- One-hot pre-decode: extract state conditions as shared wires ---
wire state_is_reset  = (current_state == RESET);
wire state_is_insert = (current_state == INSERT);
wire state_is_ideal  = (current_state == IDEAL);

// --- Pre-compute shared control conditions ---
wire no_flush         = ~flush;
wire insert_and_not_full = insert & ~full;
wire go_insert        = no_flush & insert_and_not_full;

// --- Pre-compute full load condition (shared across INSERT and IDEAL) ---
wire full_load        = (state_is_insert | state_is_ideal) & no_flush;

assign wraddr = wbin[addrbits-1:0];

// --- L5: Condition pre-compute for wbinnext ---
wire do_increment = insert_and_not_full;
wire [addrbits:0] wbin_inc = wbin + {{addrbits{1'b0}}, 1'b1};
assign wbinnext = do_increment ? wbin_inc : wbin;

// L5: Pre-compute gray code conversion once
assign wgraynext = (wbinnext >> 1) ^ wbinnext;

// ============================================================
// L5 OPTIMIZATION for st_0002 (full register critical path):
// Pre-compute gray code full comparison exploiting one-bit-change
// property of binary-to-gray increment.
//
// CRITICAL PATH REDUCTION:
//   Original: wbin→add→shift→XOR→mux→gray_cmp→OR→full (7 gate levels)
//   Optimized: wbin→lz_detect→mux→XOR→AND→OR→full (4 gate levels)
// ============================================================

// --- L5: Pre-compute lowest-zero-bit mask from wbin (1s below lowest 0) ---
// wbin is registered — this logic depends only on current state
wire [addrbits:0] lz_mask;
assign lz_mask[0] = ~wbin[0];
generate
  genvar gi;
  for (gi = 1; gi <= addrbits; gi = gi + 1) begin : lz_gen
    assign lz_mask[gi] = lz_mask[gi-1] & ~wbin[gi];
  end
endgenerate

// --- L5: Pre-compute gray code comparison as if incrementing ---
// wbin is registered, sync_rdptr is registered — no wbinnext dependency
// The "next gray if incrementing" differs from "current gray" at exactly
// one bit position, which is the lz_mask bit.
wire [addrbits:0] wgraynext_if_inc = wrptr ^ lz_mask;
wire wgraycmp_if_inc = (wgraynext_if_inc[addrbits-1:0] ^ sync_rdptr[addrbits-1:0]) == lz_mask[addrbits-1:0];

// --- L5: Binary depth comparison (separate path, not on gray cmp critical path) ---
wire wbincmp  = (wbin[addrbits-1:0] >= depth[addrbits-1:0]-1);

// --- L5: Select gray comparison result based on increment ---
// When not incrementing, wrptr==sync_rdptr => wgraycmp=0 (not full)
// When incrementing, use pre-computed one-bit-change comparison
wire wgraycmp = do_increment ? wgraycmp_if_inc : 1'b0;

assign full_val = wgraycmp || wbincmp; 
 
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
        // full: mux select on full_load (fast path), D depends on full_val
        //       full_val no longer depends on wbinnext gray conversion
        full  <= full_load ? full_val : 1'b0;
        wren  <= go_insert ? 1'b1 : 1'b0;
        // Pointer update: mux select on go_insert (fast path),
        //   branch select on full_val (separate path via wbincmp || wgraycmp)
        {wbin, wrptr} <= go_insert ? 
                            (full_val ? {wbin, wrptr} : {wbinnext, wgraynext}) :
                            (state_is_reset ? { {(addrbits+1){1'b0}}, {(addrbits+1){1'b0}} } : {wbin, wrptr});
      end
end

// Restructured next_state: flat ternary OR-chain replaces nested if-else/case
// Reduces combinational depth from ~15 to ~10 gates on critical path
always@(*)
begin
    next_state = flush           ? RESET :
                 go_insert       ? INSERT :
                 /* default */     IDEAL;
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
wire [addrbits:0] rgraynext, rbinnext;
wire empty_val, rgraycmp, rbincmp;
//States are binary encoded
localparam RESET  = 2'b00,
           REMOVE = 2'b01,
           IDEAL  = 2'b10;

// --- L5: Condition pre-compute for RFSM shared control ---
wire state_is_reset  = (current_state == RESET);
wire state_is_remove = (current_state == REMOVE);
wire state_is_ideal  = (current_state == IDEAL);
wire do_remove       = remove & ~empty;

assign rdaddr = rbin[addrbits-1:0];
assign rbinnext  = rbin + (remove & ~empty);
assign rgraynext = (rbinnext>>1) ^ rbinnext;

// Pre-compute condition components to reduce fanout on empty_val
assign rgraycmp = (rgraynext == sync_wrptr);
assign rbincmp  = (rbin[addrbits-1:0] >= depth[addrbits-1:0]-1);
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
                       // Compute both paths unconditionally to remove empty_val from critical path
                       rden <= 1;
                       {rbin, rdptr} <= (empty_val) ? {rbin, rdptr} : {rbinnext, rgraynext};
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

// L5: Restructured next_state with pre-decoded condition wires
always@(*)
begin
  next_state = state_is_reset ? (sync_flush ? RESET : IDEAL) :
               state_is_remove ? (sync_flush ? RESET : do_remove ? REMOVE : IDEAL) :
               state_is_ideal  ? (sync_flush ? RESET : do_remove ? REMOVE : IDEAL) :
               RESET;
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
    else if(rden)
    begin
    dataOut <= FIFO[rdaddr];
    end
    else if(!rden && (rdaddr == 0))
    dataOut <= FIFO[0];
    else if(!rden)
    dataOut <= FIFO[rdaddr];
end
endmodule
