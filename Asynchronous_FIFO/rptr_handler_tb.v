`include "rptr_handler.v"

module rptr_handler_tb;

  parameter DATA_WIDTH = 8;
  parameter DEPTH = 16;
  parameter PTR_WIDTH = $clog2(DEPTH);


  reg rclk, rrst_n, r_en;
  reg [PTR_WIDTH:0] g_wptr_sync;

  wire [PTR_WIDTH:0] b_rptr;
  wire [PTR_WIDTH:0] g_rptr;
  wire empty;

  reg [31:0] count;



  rptr_handler U1 (rclk, rrst_n, r_en, g_wptr_sync, b_rptr, g_rptr, empty);

  always begin
    rclk = 1; #10; rclk = 0; #10;
  end

  
  initial begin

    $dumpfile("rptr_handler_tb.vcd");
    $dumpvars(0,rptr_handler_tb);

    rclk = 1'b0;
    rrst_n = 1'b1;
    r_en = 1'b1;    
    g_wptr_sync =4'b1000;
    count = 32'h00000000;

    #100
    rrst_n = 1'b0;
    #1
    rrst_n = 1'b1;


    //#1000 

    //$finish;

  end

  always @ (negedge rclk)
    begin
      count <= count + 32'h00000001;
      if (count == 32'h00000310) begin
        $display ("Simulation timed out");
        $finish;
        end
      end


  
endmodule
