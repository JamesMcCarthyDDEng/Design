module dmem (   input clk, we,
                input [31:0] a, wd,
                output [31:0] rd);

    reg [31:0] RAM [63:0];

    //wire [31:0] RAMwire0;
    //wire [31:0] RAMwire1;
    //wire [31:0] RAMwire2;
    //wire [31:0] RAMwire3;

    //wire [31:0] RAMwire4;
    //wire [31:0] RAMwire5;
    //wire [31:0] RAMwire6;
    //wire [31:0] RAMwire7;


    /*
    wire [31:0] RAMwire8;
    wire [31:0] RAMwire9;
    wire [31:0] RAMwire10;
    wire [31:0] RAMwire11;

    wire [31:0] RAMwire12;
    wire [31:0] RAMwire13;
    wire [31:0] RAMwire14;
    wire [31:0] RAMwire15;

    wire [31:0] RAMwire16;
    wire [31:0] RAMwire17;
    wire [31:0] RAMwire18;
    wire [31:0] RAMwire19;

    wire [31:0] RAMwire20;
    wire [31:0] RAMwire21;
    wire [31:0] RAMwire22;
    wire [31:0] RAMwire23;

    wire [31:0] RAMwire24;
    wire [31:0] RAMwire25;
    wire [31:0] RAMwire26;
    wire [31:0] RAMwire27;

    wire [31:0] RAMwire28;
    wire [31:0] RAMwire29;
    wire [31:0] RAMwire30;
    wire [31:0] RAMwire31;



    assign RAMwire0 = RAM [0] ;
    assign RAMwire1 = RAM [1] ;
    assign RAMwire2 = RAM [2] ;
    assign RAMwire3 = RAM [3] ;

    assign RAMwire4 = RAM [4] ;
    assign RAMwire5 = RAM [5] ;
    assign RAMwire6 = RAM [6] ;
    assign RAMwire7 = RAM [7] ;    

    assign RAMwire8 = RAM [8] ;
    assign RAMwire9 = RAM [9] ;
    assign RAMwire10 = RAM [10] ;
    assign RAMwire11 = RAM [11] ;    

    assign RAMwire12 = RAM [12] ;
    assign RAMwire13 = RAM [13] ;
    assign RAMwire14 = RAM [14] ;
    assign RAMwire15 = RAM [15] ;    

    assign RAMwire16 = RAM [16] ;
    assign RAMwire17 = RAM [17] ;
    assign RAMwire18 = RAM [18] ;
    assign RAMwire19 = RAM [19] ;    

    assign RAMwire20 = RAM [20] ;
    assign RAMwire21 = RAM [21] ;
    assign RAMwire22 = RAM [22] ;
    assign RAMwire23 = RAM [23] ;

    assign RAMwire24 = RAM [24] ;
    assign RAMwire25 = RAM [25] ;
    assign RAMwire26 = RAM [26] ;
    assign RAMwire27 = RAM [27] ;    

    assign RAMwire28 = RAM [28] ;
    assign RAMwire29 = RAM [29] ;
    assign RAMwire30 = RAM [30] ;
    assign RAMwire31 = RAM [31] ;
    */
    assign rd = RAM[a[31:2]]; // word aligned

    always @ (posedge clk)
        if (we)
            RAM[a[31:2]] <= wd;
        
endmodule