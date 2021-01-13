`include "IFU.v"
module IFU_tb();
    reg [15:0] I, O;
    wire [15:0] instruct;
    reg clk, rst;
    IFU unit(I, clk, rst, instruct);
    initial begin
    $dumpfile("IFU.vcd");
    $dumpvars(0,IFU_tb);
    clk <= 1'b0;
    I <= 16'h0003;
    rst <= 1'b1;
    #5;
    rst <= 1'b0;
    #100;
    $finish;
    end
    always begin
    #1 clk <= 1'b1;
    O <= instruct;
    #1 clk <= 1'b0;
    end
    always @(O|rst) $display("Input : %h Output : %h Clock : %b Reset : %b",I,O,clk,rst);
endmodule
