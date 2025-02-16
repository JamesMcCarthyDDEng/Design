`include "aludec.v"
`timescale 1ns / 1ns

module aludec_tb;

reg [5:0] funct; 
reg [1:0] aluop; 
wire [2:0] alucontrol;

initial begin 

    $dumpfile("aludec_tb.vcd");
    $dumpvars(0,aludec_tb);

    aluop=2'b00;        //add
    funct=6'b100000;    
    #10;
    
    aluop=2'b01;        //sub
    funct=6'b100010;     
    #10;
    
    aluop=2'b11;        
    funct=6'b100000;    //ADD
    #10;
    
    aluop=2'b11;
    funct=6'b100010;    //SUB
    #10;
    
    aluop=2'b11;
    funct=6'b100100;    //AND
    #10;
    
    aluop=2'b11;
    funct=6'b100101;    //OR
    #10;

    aluop=2'b11;
    funct=6'b101010;    //SLT
    #10;

    $finish;


end


aludec U0 (
    .funct (funct),
    .aluop (aluop),
    .alucontrol (alucontrol)
    );



endmodule 