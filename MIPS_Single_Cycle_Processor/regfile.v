module regfile (    input clk,
                    input we3,
                    input [4:0] ra1, ra2, wa3,
                    input [31:0] wd3,
                    output [31:0] rd1, rd2);

    reg [31:0] rf[31:0];

    // three ported register file
    // read two ports combinationally
    // write third port on rising edge of clock
    // register 0 hardwired to 0

    wire [31:0] Reg_no0;
    wire [31:0] Reg_no1;
    wire [31:0] Reg_no2;
    wire [31:0] Reg_no3;
    
    wire [31:0] Reg_no4;
    wire [31:0] Reg_no5;
    wire [31:0] Reg_no6;
    wire [31:0] Reg_no7;
    
    assign Reg_no0 = rf[0] ;
    assign Reg_no1 = rf[1] ;
    assign Reg_no2 = rf[2] ;
    assign Reg_no3 = rf[3] ;

    assign Reg_no4 = rf[4] ;
    assign Reg_no5 = rf[5] ;
    assign Reg_no6 = rf[6] ;
    assign Reg_no7 = rf[7] ;



    always @ (posedge clk)
        if (we3) rf[wa3] <= wd3;

    
    assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
    

        
endmodule
