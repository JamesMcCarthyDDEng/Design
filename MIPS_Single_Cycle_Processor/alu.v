module alu #(parameter WIDTH=8) 
            (input      [WIDTH-1:0]  srca, srcb,
             input      [2:0]        alucontrol,
             output reg [WIDTH-1:0]  alurct,
             output reg              zero);



always @ (*)
    case (alucontrol)
    3'b010: alurct <= srca + srcb; // ADD
    3'b110: alurct <= srca + srcb; // SUB
    3'b000: alurct <= srca & srcb; // AND
    3'b001: alurct <= srca | srcb; // OR
    3'b111: alurct <= srca <= srcb; // SLT
    endcase

always @ (*)
    begin
        zero <= (srca == srcb);
    end

endmodule