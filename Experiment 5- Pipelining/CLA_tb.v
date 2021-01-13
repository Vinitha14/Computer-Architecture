`include "RDM.v"
module CLA_tb();
    reg [15:0] M,N;
    wire [15:0] O;
    reg C_in, clk;
    wire Of;
    CLAout Adder(.M(M), .N(N), .O(O), .Of(Of), .C_in(C_in), .clk(clk));
    initial begin
    $dumpfile("CLApipe.vcd");
    $dumpvars(0,CLA_tb);
    clk<=1'b0;
    M<=16'haacd;
    N<=16'hbbde;
    C_in<=1'b0;
    #2;
    M<=16'h0006;
    N<=16'hc584;
    #2;
    M<=16'h063f;
    N<=16'h97ab;
    #2;
    M<=16'h1234;
    N<=16'h4321;
    #2;
    M<=16'h6789;
    N<=16'h9876;
    #2;
    M<=16'h0000;
    N<=16'h0000;
    #20;
    $finish;
    end
    always@(O|M)
        $display("Time : %h Input : %h %h Output : %b %h Clock : %b",$time,M,N,Of,O,clk);

    always begin
    #1 clk<=1'b1;
    #1 clk<=1'b0;
    end

endmodule
