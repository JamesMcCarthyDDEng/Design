`include "asynchronous_fifo.v"

module asynchronous_fifo_tb;

  parameter DATA_WIDTH = 8;

  wire [DATA_WIDTH-1:0] data_out;
  wire full;
  wire empty;
  reg [DATA_WIDTH-1:0] data_in;
  reg w_en, wclk, wrst_n;
  reg r_en, rclk, rrst_n;
  reg [31:0] count;

  integer i;

  // Queue to push data_in
  reg [DATA_WIDTH-1:0] wdata_q [63:0];
  reg [DATA_WIDTH-1:0] wdata;

  initial
        begin
            $readmemh ("wdata_q.dat",wdata_q,0,63);
        end

  asynchronous_fifo as_fifo (wclk, wrst_n,rclk, rrst_n,w_en,r_en,data_in,data_out,full,empty);

  always begin
    wclk = 1; #10; wclk = 0; #10;
  end


  always begin
    rclk = 1; #35; rclk = 0; #35;
  end
  
  initial begin

    $dumpfile("asynchronous_fifo_tb.vcd");
    $dumpvars(0,asynchronous_fifo_tb);
    
    wclk = 1'b0; wrst_n = 1'b0;
    w_en = 1'b0;
    data_in = 0;
    count = 0;
    i=0;

    rclk = 1'b0; rrst_n = 1'b0;
    r_en = 1'b0;
    wrst_n = 1'b1;
    rrst_n = 1'b1;

    #100
    
    wrst_n = 1'b0;
    rrst_n = 1'b0;

    #100
    
    wrst_n = 1'b1;
    rrst_n = 1'b1;


  end

  always @ (negedge wclk)
    begin
      count <= count + 32'h00000001;
      if (count == 32'h00000080) begin
        $display ("Simulation timed out");
        $finish;
        end
      end

  always @ (negedge wclk) begin 
    if (i>=20) begin
      w_en = 1'b1 ;
      r_en = 1'b0 ;
    end
    if (i>=40) begin
      w_en = 1'b0 ;
      r_en = 1'b0 ;
    end
    if (i>=50) begin
      r_en = 1'b1 ;
      w_en = 1'b0 ;
    end
    if (w_en) begin
        data_in = wdata_q [i];
    end
    i=i+1;
  end

  
endmodule
