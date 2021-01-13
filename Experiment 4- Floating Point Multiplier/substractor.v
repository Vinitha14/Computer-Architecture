`include "cla1.v"
module Subtracting(a,b,y);
input [4:0]a,b;
output [5:0]y;

wire [4:0]w;
wire [5:0]s;
wire [4:0]s1;

genvar j;

for(j=0;j<5;j=j+1)
begin : module1
  assign w[j]=~b[j];
end

CLA1 r0(w,5'b00001,s);
assign s1[4:0] = s[4:0];
CLA1 r1(s1,a,y);

endmodule
