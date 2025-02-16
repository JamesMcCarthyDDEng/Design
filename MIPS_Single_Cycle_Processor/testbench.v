`include "top.v"


module testbench();

    reg clk;
    reg reset;
    reg [31:0] count;

    wire [31:0] writedata, dataadr;
    wire memwrite;
    
    // instantiate device to be tested
    top dut (clk, reset, writedata, dataadr, memwrite);

    // initialize test
    initial
        begin
            
            $dumpfile("testbench.vcd");
            $dumpvars(0,testbench);

            reset = 1; # 22; reset = 0;
            count = 32'h00000000;

        end
    
    // generate clock to sequence tests
    always
        begin
            clk = 1; # 5; clk = 0; # 5;
        end

    // check results
    always @ (negedge clk)
        begin
        if (memwrite) begin
            if (dataadr === 84 & writedata === 7) begin
            $display ("Simulation succeeded");
            $finish;
        end else if (dataadr !== 80) begin
            $display ("Simulation failed");
            $finish;
        end 
        end
        end

    always @ (negedge clk)
        begin
        count <= count + 32'h00000001;
        if (count == 32'h00000064) begin
            $display ("Simulation timed out");
            $finish;
            end
        end
    //    



endmodule