module Smaller(C,D,S,L);
input [15:0]C,D;
output [15:0]S,L;

wire [4:0]CExp;
wire [4:0]DExp;

wire [15:0]n;
wire [5:0]A1;

assign CExp[4:0]=C[14:10];
assign DExp[4:0]=D[14:10];

Subtracting g(CExp,DExp,A1);

genvar m;
for(m=0;m<16;m=m+1)
begin
 assign n[m]=A1[5];
end

assign S=C&~n|D&n; 
assign L=C&n|D&~n; 

endmodule
