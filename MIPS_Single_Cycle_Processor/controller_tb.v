`include "controller.v"


`timescale 1ns / 1ns

module controller_tb;

wire [5:0] op; 
wire [5:0] funct; 
reg zero;
reg [31:0] inst; 

assign op [5:0] = inst[31:26];
assign funct [5:0] = inst[5:0];

wire memtoreg;
wire memwrite;
wire pcsrc;
wire alusrc;
wire regdst;
wire regwrite;
wire jump;
wire [2:0] alucontrol;





initial begin 

    

    $dumpfile("controller_tb.vcd");
    $dumpvars(0,controller_tb);
    
    inst=32'h20020005;
    zero=1'b1;
    
    #10;

    inst=32'h2003000c;
    #10;

    inst=32'h2067fff7;
    #10;

    inst=32'h00e22025;
    #10;

    inst=32'h00642824;
    #10;

    inst=32'h00a42820;
    #10;

    inst=32'h10a7000a;
    #10;

    inst=32'h0064202a;
    #10;


    $finish;


end


controller U0 (
    .op (op),
    .funct (funct),
    .zero (zero),
    .memtoreg (memtoreg),
    .memwrite (memwrite),
    .pcsrc (pcsrc),
    .alusrc (alusrc),
    .regdst (regdst),
    .regwrite (regwrite),
    .jump (jump),
    .alucontrol (alucontrol)
    );



endmodule 