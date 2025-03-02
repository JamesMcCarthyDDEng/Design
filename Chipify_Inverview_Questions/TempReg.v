
// With tempeorary register
always @(posedge clk) begin
          a = temp;
          a = b;
          b = temp;
end

// Without tempeorary register
always @(posedge clk) begin
          a <= b; 
          b <= a;
end

// Inferring a latch (sensitivity list )
always @ (X or Y)
    out = X | Y & Z;

// Inferring a latch (Missing Statement)
always @* begin
    if (X) begin 
    out = Y & Z;
    end
end

// Always add a sensitivity list to always block
always @(b, c)
begin
    a = b & c;
end



// Module for synchronous reset
module synchronous_reset (
    input clk,
    input reset_n
    //input ports
)

    reg [7:0] data;

    always @ (posedge cll) 
    begin
        if (!reset_n) 
            data <= 8'h00;
        else
            data <= ; // Data updated based on input ports
    end

endmodule



// Module for asynchronous reset
module asynchronous_reset (
    input clk,
    input reset_n
)

    always @ (posedge clock or negedge reset) 
    begin
        if (!reset)
            data <= 8'h00;
        else
            data <= ; //based on reset information
    end

endmodule

// Continuous assignment 
assign b = (a & c) | d;


// Using `DEFINE

`DEFINE DATA_WIDTH = 32;

wire [`DATA_WIDTH - 1 : 0] data_bus;
//Same as
wire [31 : 0] data_bus;




// Verilog module for creating a sine wave 
module my_sign_generation (
    input logic clk,
    input logic reset,
    output logic signed [15:0] sine_output
)

    logic signed [15:0] sin_table [0:255]

    initial begin
        integer i;
        for (i = 0; i < 256; i++) begin 
            sin_table [i] = $signed(32767 * $sin( 2 * $pi * i / 256)) 
        end
    end

    logic [15:0] index;
    logic [7:0] phase_acc;
    logic [7:0] phase_inc=(440/8000)*256;
    always @ (posedge clk) begin 
        if (!reset) begin
            phase_acc <= 0;
            index <= 0;
        end else if (phase_acc>=256) begin
            phase_acc <= 0;
            index <= 0;
        end else begin 
            
        end
    sign_output <= sign_table[index[7:0]]; 
    end
endmodule

// Verilog module for creating a sine wave using case and casez statemenets
reg [7:0] my_output
reg [7:0] my_input

always @(posedge clk) begin 
    casez(my_input)
    4'b000? : my_output <= 8'h6g;
    4'b0010 : my_output <= 8'h6g;
    4'b?00? : my_output <= 8'h6g;
    4'b010?? : my_output <= 8'h6g;
    default : my_output <= 8'h3d;
    endcase
end

// Verilog module for creating a sine wave using case statemenets
reg [7:0] my_output
reg [7:0] my_input

always @(posedge clk) begin 
    case(my_input)
    4'b0011 : my_output <= 8'h6g;
    4'b0001 : my_output <= 8'h6g;
    4'b1001 : my_output <= 8'h6g;
    4'b0101 : my_output <= 8'h6g;
    default : my_output <= 8'h3d;
    endcase
end


// Verilog Code for a modulo3 counter
module ( 
    input clk,
    input rstn,
    output reg [1:0] out
)

always @(posedge clk) begin
    if (!rstn)
        out <= 0;
    else if (out == 3'b10)
        out <= 0;
    else
        out <= out + 1;
end

endmodule

//Verilog Code for a synchronous fifo
module synchronous_fifo #(
    DATA_WIDTH = 8,
    DATA_DEPTH = 16
) (
    input                           clk,
    input                           rstn,
    input                           wr_en,
    input                           rd_en,
    input      [DATA_WIDTH - 1 : 0] data_in,
    output reg [DATA_WIDTH - 1 : 0] data_out,
    output                          full,
    output                          empty
);

    reg [DATA_WIDTH -1 : 0] reg [16:0]

    reg [$clog2(DEPTH)-1:0] wr_ptr;
    reg [$clog2(DEPTH)-1:0] rd_ptr;

    always @ (posedge clk) begin
        if (!rstn) begin
            wr_ptr <= 0;
        end else begin
            if (wr_en & !full) begin
            DATA[wr_ptr]<=data_in;
            wr_ptr<=wr_ptr+1;
            end
        end
    end
    
    always @ (posedge clk) begin
        if (!rstn) begin
            DATA <= 0;
        end else begin
            if (rd_en & !empty) begin
            data_out<=DATA[rd_ptr];
            rd_ptr<=rd_ptr+1;
            end
        end
    end

    asssign full = (wr_ptr) + 1 == rd_ptr;
    asssign empty = wd_ptr == rd_ptr;

endmodule


// System Verilog code for the a Mealy State Machine
module Sequance_detector (
    input       clk,
    input       rstn,
    input       X,
    output      Y,
)

    reg Y;

    parameter A = 2'b00;
    parameter B = 2'b01;
    parameter C = 2'b10;
    parameter D = 2'b11;

    reg current_state   [1:0];
    reg next_state      [1:0];

    always @ (posedge clk) begin
        if (!rstn) begin
            current_state <= A;
        end else begin
            current_state <= next_state;
        end
    end

    always @ (current_state) begin
        if (!rstn) begin
            current_state <= A;
        end else 
            case(current_state)
            A:  begin
                if (X==1)   next_state <= A
                else        next_state <= B;
                end
            B:  begin
                if (X==1)   next_state <= A
                else        next_state <= B;
                end
            C:  begin
                if (X==1)   next_state <= A
                else        next_state <= B;
                end
            D:  begin
                if (X==1)   next_state <= A
                else        next_state <= B;
                end
            endcase
    end

    assign Z = (current_state == 1) && (X==0) ? 1 : 0;

endmodule



