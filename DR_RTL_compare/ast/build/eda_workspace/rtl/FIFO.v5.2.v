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

// L5: Pre-compute combined flush_or_reset condition to reduce mux depth
wire flush_or_reset = sync_flush | ~rst;

always @(posedge clk_out , negedge rst) 
begin
  if(flush_or_reset)
  begin
    r0          <= { (addrbits+1) {1'b0} };
    sync_rdptr  <= { (addrbits+1) {1'b0} };
  end
  else
  begin
    r0          <= rdptr;
    sync_rdptr  <= r0;
  end
end 
endmodule



module write_sync #(parameter addrbits=8)
            (input clk_in, rst, flush,
             input [addrbits:0] wrptr,
             output reg [addrbits:0] sync_wrptr);
          
reg [addrbits:0] w0;

// L5/L6: Pre-compute combined flush_or_reset condition to reduce mux depth
wire flush_or_reset = flush | ~rst;

always @(posedge clk_in , negedge rst) 
begin
  if(flush_or_reset)
  begin
    w0          <= { (addrbits+1) {1'b0} };
    sync_wrptr  <= { (addrbits+1) {1'b0} };
  end
  else
  begin
    w0          <= wrptr;
    sync_wrptr  <= w0;
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
wire full_val, wbincmp;
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
// L5: Condition pre-compute - extract repeated condition for reuse
wire insert_and_not_full = insert & ~full;
wire go_insert        = no_flush & insert_and_not_full;
wire do_increment     = insert_and_not_full;

// --- Pre-compute full load condition (shared across INSERT and IDEAL) ---
wire full_load        = (state_is_insert | state_is_ideal) & no_flush;

assign wraddr = wbin[addrbits-1:0];

// --- L5: Late mux-select with unconditional computation for full_val ---
// Key optimization: compute gray-code comparisons for BOTH increment and hold
// branches in parallel. do_increment (which depends on full) now only drives
// the final 2:1 mux, removing the entire gray-code chain from the
// full -> full critical path.

// Pre-compute increment unconditionally
wire [addrbits:0] wbin_inc = wbin + {{addrbits{1'b0}}, 1'b1};

// Gray code for both branches computed in parallel (no dependency on do_increment)
wire [addrbits:0] wgraynext_inc  = (wbin_inc >> 1) ^ wbin_inc;
wire [addrbits:0] wgraynext_hold = (wbin >> 1) ^ wbin;

// Gray-code comparison for both cases in parallel
wire wgraycmp_inc  = (wgraynext_inc[addrbits-1] != sync_rdptr[addrbits-1]) &&
                     (wgraynext_inc[addrbits-2:0] == sync_rdptr[addrbits-2:0]);
wire wgraycmp_hold = (wgraynext_hold[addrbits-1] != sync_rdptr[addrbits-1]) &&
                     (wgraynext_hold[addrbits-2:0] == sync_rdptr[addrbits-2:0]);

assign wbincmp = (wbin[addrbits-1:0] >= depth[addrbits-1:0]-1);

// Parallel full_val for both branches
wire full_val_inc  = wgraycmp_inc  || wbincmp;
wire full_val_hold = wgraycmp_hold || wbincmp;

// Late mux: do_increment only drives final 2:1 select, not arithmetic chain
assign full_val = do_increment ? full_val_inc : full_val_hold;

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
        // L5: Simplified full/wren using pre-decoded selects
        full  <= full_load ? full_val : 1'b0;
        wren  <= state_is_insert ? 1'b1 : 1'b0;
        // go_insert implies do_increment, so wbin_inc/wgraynext_inc are the
        // correct values for the increment branch — no redundant mux needed
        {wbin, wrptr} <= (state_is_insert & full_val) ? {wbin, wrptr} : 
                        (go_insert ? {wbin_inc, wgraynext_inc} : 
                        (state_is_reset ? { {(addrbits+1){1'b0}}, {(addrbits+1){1'b0}} } : {wbin, wrptr}));
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

// L5: Hoisted sync_flush to top-level condition + merged REMOVE/IDEAL branches
// sync_flush forces RESET regardless of current state — one-hot decode
// Reduces sync_flush combinational depth from 3 gate levels to 1 in next_state
// Merges identical REMOVE and next-state-IDEAL branches (same ternary body)
always@(*)
begin
  next_state = sync_flush                           ? RESET  :
               state_is_reset                       ? IDEAL  :
               (state_is_remove | state_is_ideal)   ? (do_remove ? REMOVE : IDEAL) :
               /* default */                          RESET;
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
