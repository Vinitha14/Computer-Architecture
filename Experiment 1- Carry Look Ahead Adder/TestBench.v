`include "KGP.v"

module CLAout;

reg [15:0] a;
reg [15:0] b;
wire [16:0] s;

Add add(.A(a),.B(b),.S(s));

initial
begin
$dumpfile("test.vcd");
$dumpvars(0,CLAout);
$display("Time\tA\t\t B\t\t  Sum\t\t");
$monitor("%g\t%16b,%16b,%17b ",$time,a,b,s);

a=16'b1011101110111011;
b=16'b1101110011011001;
#128 $finish;
end

always #4 a[3]=~a[3];
always #8 a[5]=~a[5];
always #32 b[9]=~b[9];
always #64 b[7]=~b[7];

endmodule 
