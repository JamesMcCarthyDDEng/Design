
`include "arbeiter.v"


module arbeiter_tb ();

    reg req_0, req_1, clock, reset;
    wire gnt_0, gnt_1; 

    arbeiter U0 (
        .req_0 (req_0),
        .req_1 (req_1),
        .gnt_0 (gnt_0),
        .gnt_1 (gnt_1),
        .reset (reset),
        .clock (clock)
    );

    initial begin
        clock=0;
        reset=0;
        
        $dumpfile("arbeiter_tb.vcd");
        $dumpvars(0,arbeiter_tb);
        
        reset=0;
        req_0=0;req_1=0;#100;
        req_0=1;req_1=0;#100;
        req_0=0;req_1=1;#100;
        req_0=1;req_1=1;#100;
        req_0=0;req_1=0;#100;

        $finish;

    end

    always begin
       #5 clock = !clock;
    end

endmodule