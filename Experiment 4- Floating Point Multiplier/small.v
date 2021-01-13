`include "substractor.v"
module Smaller(a,b,sm,lr);
input [4:0]a,b;
output [4:0]sm,lr;

wire [4:0]c1;
wire [5:0]y1;

Subtracting s1(a,b,y1);

genvar j;

for(j=0;j<5;j=j+1)
begin
 assign c1[j]=y1[5];
end

assign sm=a&~c1 | b&c1; 
assign lr=a&c1 | b&~c1; 

endmodule
