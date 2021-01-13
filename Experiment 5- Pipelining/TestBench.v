`include "Wallace.v"
module WalMult_tb();

    reg [15:0] M,N;
    wire [31:0] O;
    reg clk;
    WalMul wm(.M(M), .N(N), .O(O), .clk(clk));
    initial begin
    $dumpfile("WalMult.vcd");
    $dumpvars(0,WalMult_tb);
    clk<=1'b0;
    M<=16'haacd;
    N<=16'hbbde;
    #2;
    M<=16'hffff;
    N<=16'hffff;
    #2;
    M<=16'hb29d;
    N<=16'hffff;
    #2;
    M<=16'h6540;
    N<=16'h3216;
    #2;
    M<=16'h3265;
    N<=16'h2656;
    #2;
    M<=16'h0000;
    N<=16'h0000;
    #2;
    M<=16'habce;
    N<=16'hbcde;
    #2;
    M<=16'hfffe;
    N<=16'hffff;
    #2;
    M<=16'hb29e;
    N<=16'hffff;
    #2;
    M<=16'h654e;
    N<=16'h3216;
    #2;
    M<=16'h326e;
    N<=16'h2656;
    #2;
    M<=16'h000e;
    N<=16'h0000;
    #10000;
    $finish;
    end
    always@(M|O)
        $display("Time: %h Input: %h %h Output:%h Clock:%b",$time,M,N,O,clk);

    always begin
    #1 clk<=1'b1;
    #1 clk<=1'b0;
    end

endmodule
