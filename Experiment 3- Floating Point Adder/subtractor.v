module Subtracting(C,D,A);
input [4:0]C,D;
output [5:0]A;

wire [4:0]x;
wire [5:0]y;
wire [4:0]z;

genvar n;
for(n=0;n<5;n=n+1)
begin : submodule
  assign x[n]=~D[n];
end

CLA1 c2(x,5'b00001,y);
assign z[4:0] = y[4:0];
CLA1 c3(z,C,A);

endmodule
