module fifo_mem #(parameter DEPTH=16, DATA_WIDTH=8, PTR_WIDTH=4) (
  input wclk, w_en, rclk, r_en,
  input [PTR_WIDTH:0] b_wptr, b_rptr,
  input [DATA_WIDTH-1:0] data_in,
  input full, empty,
  output [DATA_WIDTH-1:0] data_out
);
  reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];
  
  wire [DATA_WIDTH-1:0] reg0 = fifo [0];
  wire [DATA_WIDTH-1:0] reg1 = fifo [1];
  wire [DATA_WIDTH-1:0] reg2 = fifo [2];
  wire [DATA_WIDTH-1:0] reg3 = fifo [3];
  
  wire [DATA_WIDTH-1:0] reg4 = fifo [4];
  wire [DATA_WIDTH-1:0] reg5 = fifo [5];
  wire [DATA_WIDTH-1:0] reg6 = fifo [6];
  wire [DATA_WIDTH-1:0] reg7 = fifo [7];

  wire [DATA_WIDTH-1:0] reg8 = fifo [8];
  wire [DATA_WIDTH-1:0] reg9 = fifo [9];
  wire [DATA_WIDTH-1:0] reg10 = fifo [10];
  wire [DATA_WIDTH-1:0] reg11 = fifo [11];
  
  wire [DATA_WIDTH-1:0] reg12 = fifo [12];
  wire [DATA_WIDTH-1:0] reg13 = fifo [13];
  wire [DATA_WIDTH-1:0] reg14 = fifo [14];
  wire [DATA_WIDTH-1:0] reg15 = fifo [15];
  

  always@(posedge wclk) begin
    if(w_en & !full) begin
      fifo[b_wptr[PTR_WIDTH-1:0]] <= data_in;
    end
  end
  /*
  always@(posedge rclk) begin
    if(r_en & !empty) begin
      data_out <= fifo[b_rptr[PTR_WIDTH-1:0]];
    end
  end
  */
  assign data_out = fifo[b_rptr[PTR_WIDTH-1:0]];
endmodule