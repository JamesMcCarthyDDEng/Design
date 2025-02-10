`include "counter.v"

module counter_tb ();

reg enable, clock, reset; 
wire [3:0] out;

initial begin 
enable=0; clock=0; reset=0;#100

reset=1;#10
reset=0;#10

$dumpfile("counter_tb.vcd");
$dumpvars(0,counter_tb);



enable=1;#500
enable=0;#100
reset=1;#10
reset=0;#100

$finish;


end

always begin
#5 clock = !clock;
end

counter U0 (
.clock (clock),
.reset (reset),
.enable (enable),
.out (out)
);



endmodule 