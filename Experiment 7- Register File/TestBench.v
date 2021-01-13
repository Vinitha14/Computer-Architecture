`include "RegFile.v"

module REGF();
reg [3:0]Re1;
reg [3:0]Re2;
reg [3:0]W;
reg [15:0]Da;
reg Clk,Rst;
wire [15:0]D1;
wire [15:0]D2;

REGFile rf(
.Re1(Re1),
.Re2(Re2),
.W(W),
.Da(Da),
.D1(D1),
.D2(D2),
.Clk(Clk),
.Rst(Rst)
);

initial begin
$dumpfile("RegFile_tb.vcd");
$dumpvars(0,REGF);
$display("Read1	Read2	Write");
$monitor("%d	%d	%d	%b	%b	%b	%b",Re1,Re2,W,Da,D1,D2,rf.N[2]);

Rst<=1;
Clk<=1;

Re1=4'b0000;
Re2=4'b0001;
W=4'b0010;
Da=16'b0000_0000_0000_1111;
#10
$finish;
end
always #1 Re1<=Re1+1;
always #1 Re2<=Re2+1;
always #1 Da<=Da+16'b0000_0000_0000_1111;
always #1 Clk<=~Clk;
always #1 Rst=0;
endmodule
