`include "maindec.v"
`timescale 1ns / 1ns

module maindec_tb;

reg [5:0] op; 
wire memtoreg, memwrite;
wire branch, alusrc;
wire regdst, regwrite;
wire jump;
wire [1:0] aluop;

initial begin 



    $dumpfile("maindec_tb.vcd");
    $dumpvars(0,maindec_tb);

    op=6'b000000; #10;
    op=6'b100011; #10;
    op=6'b101011; #10;
    op=6'b000100; #10;
    op=6'b001000; #10;
    op=6'b000010; #10;

    $finish;


end


maindec U0 (.op (op),.memtoreg (memtoreg),.memwrite (memwrite),.branch (branch),.alusrc (alusrc),.regdst (regdst),.regwrite (regwrite),.jump (jump),.aluop (aluop));



endmodule 