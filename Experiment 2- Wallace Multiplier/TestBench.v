`include "wallace.v"

module WalOut;

reg [15:0] m;
reg [15:0] n;
wire [32:0] p;

WalMul mul(.M(m),.N(n),.P(p));

initial
begin
$dumpfile("test.vcd");
$dumpvars(0,WalOut);
$display("M\t\t  N\t\t    Product\t\t");
$monitor("%16b, %16b, %33b ",m,n,p);

m=16'b1010101110110011;
n=16'b1101010011011101;
#128 $finish;
end
endmodule
