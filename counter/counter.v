module counter (
clock,
reset,
enable,
out
);

input clock;
input reset;
input enable;
output [3:0] out;

reg [3:0] out; 

always @ (posedge clock or posedge reset)
begin : COUNTER
if (reset) begin 
    out <= 4'b0000;
end else if (enable) begin 
    out <= out + 4'b0001;
end else begin 
    out <= out;
end
end


endmodule 