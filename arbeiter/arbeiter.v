module arbeiter (req_0,req_1,gnt_0,gnt_1,reset,clock);
    input req_0;
    input req_1;
    output gnt_0;
    output gnt_1;
    input reset;
    input clock;

    reg gnt_0;
    reg gnt_1;

    always @ (posedge clock or posedge reset) 
    if(reset) begin
      gnt_0 <= 0;
      gnt_1 <= 0;
    end else if (req_0==1) begin
        gnt_0 <= 1;
        gnt_1 <= 0;
    end else if (req_1==1) begin
        gnt_1 <= 1;
        gnt_0 <= 0;
    end else begin
        gnt_1 <= 0;
        gnt_0 <= 0;
    end

endmodule 