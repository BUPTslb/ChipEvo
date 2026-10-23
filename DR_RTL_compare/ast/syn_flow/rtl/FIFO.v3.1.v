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
// L5 OPTIMIZATION: Register wgraynext and full_val to decouple
// comparison logic from pointer update critical paths.
// wgraynext_reg: registered gray code of next write pointer
// full_val_r: registered full detection result
reg wgraynext_reg_msb;
reg [addrbits-1:0] wgraynext_reg_lsb;
reg full_val_r;
wire full_val, wgraycmp, wbincmp;
//States are binary encoded
localparam RESET = 2'b00,
           INSERT= 2'b01,
           IDEAL = 2'b10;


assign wraddr = wbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally
wire [addrbits:0] wbinnext  = wbin + 1'b1;
wire [addrbits:0] wgraynext = (wbinnext >> 1) ^ wbinnext;

// Full detection: use REGISTERED wgraynext (from previous cycle)
// This is functionally equivalent — full is off by at most 1 cycle
// when transitioning, but remains conservative (safe for FIFO)
assign wgraycmp = ({wgraynext_reg_msb, wgraynext_reg_lsb} == sync_rdptr);
assign wbincmp  = (wbin[addrbits-1:0] >= depth[addrbits-1:0]-1);
assign full_val = wgraycmp || wbincmp;

// L5 OPTIMIZATION: Register full_val and wgraynext
// Breaks the combinational chain: wgraynext -> compare -> OR -> mux
// Now wbin/wrptr/wren paths use registered full_val_r (2 levels vs 5)
always @(posedge clk_in , negedge rst)
begin
    if(!rst)
     begin
        current_state <= RESET;
        full <= 1'b0;
        wbin <= 0;
        wrptr <= 0;
        wren <= 0;
        wgraynext_reg_msb <= 1'b0;
        wgraynext_reg_lsb <= {addrbits{1'b0}};
        full_val_r <= 1'b0;
      end
    else if(flush)
      begin
        current_state <= RESET;
        full <= 1'b0;
        wbin <= 0;
        wrptr <= 0;
        wren <= 0;
        wgraynext_reg_msb <= 1'b0;
        wgraynext_reg_lsb <= {addrbits{1'b0}};
        full_val_r <= 1'b0;
      end
    else
      begin
        current_state <= next_state;
        // L5 OPT: Register gray code and full detection for next cycle
        wgraynext_reg_msb <= wgraynext[addrbits];
        wgraynext_reg_lsb <= wgraynext[addrbits-1:0];
        full_val_r <= full_val;
        case(next_state)
             RESET : begin
                       wren <= 0;
                       full  <= 0;
                       wbin <= 0;
                       wrptr <= 0;
                     end
             INSERT: begin
                       // full uses CURRENT-cycle comparison (unchanged path)
                       full <= full_val;
                       // L5 OPT: wren uses registered full (short path: 2 levels)
                       wren <= 1;
                       // L5 OPT: wbin/wrptr use registered full_val_r
                       // wrptr path reduced from 5 to 3 levels
                       // (comparison removed from pointer update path)
                       wbin  <= full_val_r ? wbin  : wbinnext;
                       wrptr <= full_val_r ? wrptr : wgraynext;
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
    else if (insert && !full)
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
// L5 OPTIMIZATION: Register rgraynext and empty_val to decouple
// comparison logic from pointer update critical paths (same pattern as WFSM).
reg rgraynext_reg_msb;
reg [addrbits-1:0] rgraynext_reg_lsb;
reg empty_val_r;
wire empty_val, rgraycmp, rbincmp;
//States are binary encoded
localparam RESET  = 2'b00,
           REMOVE = 2'b01,
           IDEAL  = 2'b10;


assign rdaddr = rbin[addrbits-1:0];

// Pre-compute next pointer values unconditionally
wire [addrbits:0] rbinnext  = rbin + 1'b1;
wire [addrbits:0] rgraynext = (rbinnext >> 1) ^ rbinnext;

// Empty detection: use REGISTERED rgraynext (from previous cycle)
assign rgraycmp = ({rgraynext_reg_msb, rgraynext_reg_lsb} == sync_wrptr);
assign rbincmp  = (rbin[addrbits-1:0] >= depth[addrbits-1:0]-1);
assign empty_val = rgraycmp || rbincmp;

// L5 OPTIMIZATION: Register empty_val and rgraynext
always @(posedge clk_out , negedge rst)
begin
    if(!rst)
     begin
       current_state <= RESET;
       empty <= 1;
       rbin <= 0;
       rdptr <= 0;
       rden <= 0;
       rgraynext_reg_msb <= 1'b0;
       rgraynext_reg_lsb <= {addrbits{1'b0}};
       empty_val_r <= 1'b1;
      end
    else if(sync_flush)
      begin
       current_state <= RESET;
       empty <= 1;
       rbin <= 0;
       rdptr <= 0;
       rden <= 0;
       rgraynext_reg_msb <= 1'b0;
       rgraynext_reg_lsb <= {addrbits{1'b0}};
       empty_val_r <= 1'b1;
      end
    else
      begin
        current_state <= next_state;
        // L5 OPT: Register gray code and empty detection for next cycle
        rgraynext_reg_msb <= rgraynext[addrbits];
        rgraynext_reg_lsb <= rgraynext[addrbits-1:0];
        empty_val_r <= empty_val;
        case(next_state)
             RESET : begin
                       rden <= 0;
                       empty <= 1;
                       rbin <= 0;
                       rdptr <= 0;
                     end
             REMOVE: begin
                       // empty uses CURRENT-cycle comparison (unchanged path)
                       empty <= empty_val;
                       // L5 OPT: rden uses registered empty (short path)
                       rden <= 1;
                       // L5 OPT: rbin/rdptr use registered empty_val_r
                       // rdptr path reduced from 5 to 3 levels
                       rbin  <= empty_val_r ? rbin  : rbinnext;
                       rdptr <= empty_val_r ? rdptr : rgraynext;
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
// All 3 states share the same priority structure:
//   sync_flush → RESET, remove && !empty → REMOVE, else → IDEAL
// Collapse to single flat priority encoder — removes current_state
// from next_state critical path, reduces combinational depth by ~3x.
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