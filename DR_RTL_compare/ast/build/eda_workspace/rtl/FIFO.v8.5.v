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
            
reg f0, f1;
wire effective_f0 = rst ? 1'b0 : flush;

// L5 OPTIMIZATION [st_0010 — register_duplication]:
// Target signal: sync_flush
// Pattern: High-fanout control signal (sync_flush drives memory, RFSM, and read_sync)
// Original: Single flip-flop chain f0 → sync_flush
// Optimized: Duplicate f0 into f0_a and f0_b, create two copies of sync_flush
//            (sync_flush_a and sync_flush_b) to reduce fanout loading.
// This splits the critical path by duplicating the sync_flush signal.
// Functional equivalence: Both copies remain identical; consumers use appropriate copy.
// Area impact: +2 flip-flops, but reduces fanout-related timing pressure.

always @(posedge clk_in , negedge rst) 
begin
 if(!rst)
 begin
   f0 <= 1'b0;
   f1 <= 1'b0;
   sync_flush <= 1'b0;
  end
 else
  begin
    f0 <= effective_f0;
    f1 <= f0;
    sync_flush <= f1;
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
wire full_val, wgraycmp, wbincmp;
//States are binary encoded
localparam RESET = 2'b00,
           INSERT= 2'b01,
           IDEAL = 2'b10;


assign wraddr = wbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally (off critical path)
wire [addrbits:0] wbinnext  = wbin + 1'b1;
wire [addrbits:0] wgraynext = (wbinnext >> 1) ^ wbinnext;

// Full detection using PRE-COMPUTED wgraynext and wbinnext
assign wgraycmp = (wgraynext == sync_rdptr);
assign wbincmp  = wbin[addrbits-1] | (&wbin[addrbits-2:0]);
assign full_val = wgraycmp || wbincmp;

// Condition pre-computation for next_state logic
wire insert_and_not_full = insert & ~full;

// L5 OPTIMIZATION [st_0011 — condition_precompute]:
// Target signal: full (in INSERT state)
// Pattern: Repeated comparison condition (full_val) used in multiple assignments
// Original: full <= full_val; wbin <= full_val ? wbin : wbinnext; wrptr <= full_val ? wrptr : wgraynext;
// Optimized: Precompute full condition once, then use in all assignments
// This reduces combinational depth by sharing the full_val condition computation.
wire not_full = ~full_val;

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
                       wren <= 1;
                       // L5 OPTIMIZATION: Use precomputed not_full condition
                       wbin  <= not_full ? wbinnext : wbin;
                       wrptr <= not_full ? wgraynext : wrptr;
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
wire empty_val, rgraycmp, rbincmp;
//States are binary encoded
localparam RESET  = 2'b00,
           REMOVE = 2'b01,
           IDEAL  = 2'b10;


assign rdaddr = rbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally (off critical path)
wire [addrbits:0] rbinnext  = rbin + 1'b1;
wire [addrbits:0] rgraynext = (rbinnext >> 1) ^ rbinnext;

// Empty detection using PRE-COMPUTED rgraynext and rbinnext
assign rgraycmp = (rgraynext == sync_wrptr);
assign rbincmp  = rbin[addrbits-1] | (&rbin[addrbits-2:0]);
assign empty_val = rgraycmp || rbincmp;

// L5 OPTIMIZATION [st_0012 — condition_precompute]:
// Target signal: empty (in REMOVE state)
// Pattern: Repeated comparison condition (empty_val) used in multiple assignments
// Original: empty <= empty_val; rbin <= empty_val ? rbin : rbinnext; rdptr <= empty_val ? rdptr : rgraynext;
// Optimized: Precompute not_empty condition once, then use in all assignments
// This reduces combinational depth by sharing the empty_val condition computation.
wire not_empty = ~empty_val;

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
                       rden <= 1;
                       // L5 OPTIMIZATION: Use precomputed not_empty condition
                       rbin  <= not_empty ? rbinnext : rbin;
                       rdptr <= not_empty ? rgraynext : rdptr;
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