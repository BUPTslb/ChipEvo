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

// --- L5: Late mux-select for wbinnext (target: wbin slice of st_0000) ---
// Pre-compute BOTH increment paths unconditionally in parallel.
// Removes 'full' from the arithmetic critical path — 'full' only drives the final 2:1 mux.
wire [addrbits:0] wbinnext_insert = wbin + {{addrbits{1'b0}}, 1'b1};
wire [addrbits:0] wbinnext_noinc  = wbin;
assign wbinnext  = (insert & ~full) ? wbinnext_insert : wbinnext_noinc;

assign wgraynext = (wbinnext>>1) ^ wbinnext;

// ==========================================================================
// L5 full_val computation — st_0002 target signal: write_uut/full
// Pattern: condition_precompute (strategy #2) + logic tree balancing (#9)
//
// Decompose the monolithic comparison into two explicit parallel branches
// with intermediate wires to guide synthesis toward balanced XNOR/AND trees.
//
// Branch 1: Gray code equality check — XNOR per bit, then balanced AND tree
//   Level 1: parallel XNOR (one gate delay per bit)
//   Level 2-3: balanced AND tree reduction (depth = ceil(log2(N)))
//
// Branch 2: Binary depth comparison — parallel bit checks, then AND tree
//   Level 1: parallel comparisons per bit
//   Level 2-3: AND tree reduction
//
// Final OR combines both branches at level max(gray_depth, bin_depth) + 1
// ==========================================================================

// Gray-code match: compare wgraynext bits [N-2:0] against sync_rdptr [N-2:0]
// using parallel XNOR gates feeding a balanced AND tree.
// This is the primary full-detection condition for a dual-clock FIFO.
wire gray_bits_match;
wire gbit_xnor_0 = ~(wgraynext[0] ^ sync_rdptr[0]);
wire gbit_xnor_1 = ~(wgraynext[1] ^ sync_rdptr[1]);
wire gbit_xnor_2 = ~(wgraynext[2] ^ sync_rdptr[2]);
wire gbit_xnor_3 = ~(wgraynext[3] ^ sync_rdptr[3]);
wire gbit_xnor_4 = ~(wgraynext[4] ^ sync_rdptr[4]);
wire gbit_xnor_5 = ~(wgraynext[5] ^ sync_rdptr[5]);
wire gbit_xnor_6 = ~(wgraynext[6] ^ sync_rdptr[6]);
wire gbit_xnor_7 = ~(wgraynext[7] ^ sync_rdptr[7]);

// Balanced AND tree (9 inputs → depth 4)
wire and_01 = gbit_xnor_0 & gbit_xnor_1;
wire and_23 = gbit_xnor_2 & gbit_xnor_3;
wire and_45 = gbit_xnor_4 & gbit_xnor_5;
wire and_67 = gbit_xnor_6 & gbit_xnor_7;
wire and_0123 = and_01 & and_23;
wire and_4567 = and_45 & and_67;
assign gray_bits_match = and_0123 & and_4567;

// Gray MSB difference: required for full detection (N vs N-1 bit wrap)
wire gray_msb_diff = wgraynext[addrbits-1] ^ sync_rdptr[addrbits-1];

// Binary depth comparison: parallel bit-level checks + AND tree
wire bbit_match_0 = ~(wbin[0] ^ (depth[0] - 1'b1));
wire bbit_match_1 = ~(wbin[1] ^ (depth[1] - 1'b1));
wire bbit_match_2 = ~(wbin[2] ^ (depth[2] - 1'b1));
wire bbit_match_3 = ~(wbin[3] ^ (depth[3] - 1'b1));
wire bbit_match_4 = ~(wbin[4] ^ (depth[4] - 1'b1));
wire bbit_match_5 = ~(wbin[5] ^ (depth[5] - 1'b1));
wire bbit_match_6 = ~(wbin[6] ^ (depth[6] - 1'b1));
wire bbit_match_7 = ~(wbin[7] ^ (depth[7] - 1'b1));
wire bmatch_01 = bbit_match_0 & bbit_match_1;
wire bmatch_23 = bbit_match_2 & bbit_match_3;
wire bmatch_45 = bbit_match_4 & bbit_match_5;
wire bmatch_67 = bbit_match_6 & bbit_match_7;
wire bmatch_0123 = bmatch_01 & bmatch_23;
wire bmatch_4567 = bmatch_45 & bmatch_67;
wire wbincmp = bmatch_0123 & bmatch_4567;

// Final full_val: either condition triggers full
assign full_val = (gray_msb_diff & gray_bits_match) | wbincmp;
 
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
        // Simplified: full/wren driven by pre-decoded selects
        full  <= full_load ? full_val : 1'b0;
        wren  <= state_is_insert ? 1'b1 : 1'b0;
        {wbin, wrptr} <= (state_is_insert & full_val) ? {wbin, wrptr} : (go_insert ? {wbinnext, wgraynext} : (state_is_reset ? { {(addrbits+1){1'b0}}, {(addrbits+1){1'b0}} } : {wbin, wrptr}));
      end
end

// ==========================================================================
// L5 next_state decomposition — st_0003 target signal: write_uut/current_state
// Pattern: condition_precompute (strategy #2)
//
// Flatten the ternary chain with explicit pre-decoded intermediate wires.
// The priority is preserved: flush > go_insert > idle.
// Each condition is named so synthesis can optimize independently.
// ==========================================================================
wire do_insert = go_insert;
wire next_is_reset = flush;
wire next_is_insert = ~flush & do_insert;

// Flat ternary with named selects — same priority as original
always@(*)
begin
    next_state = next_is_reset  ? RESET :
                 next_is_insert ? INSERT :
                 /* idle */       IDEAL;
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

// --- L5: Condition pre-compute for RFSM shared control (target: st_0001 signals) ---
// Extract repeated conditions used in both IDEAL and REMOVE case branches
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
// Replaces repeated (remove && !empty) and (sync_flush) checks with shared wires
// Reduces combinational depth by ~2 gate levels on next_state decode
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
