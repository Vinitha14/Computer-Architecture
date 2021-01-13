module Mant_Shift(C,D,C1,D1,appv); 
input [15:0]C,D;
output appv;
output [15:0]C1,D1;

wire [5:0]q;
wire [4:0]w;
wire [4:0]CExp;
wire [4:0]DExp;
wire [10:0]AMant; 
wire [10:0]CMant;

assign CExp[4:0]=C[14:10];
assign DExp[4:0]=D[14:10];
assign CMant[9:0]=C[9:0];
assign CMant[10]=1;

Subtracting g1(DExp,CExp,q);
assign w[4:0]=q[4:0];

assign AMant= CMant >> w;

assign C1[15]=C[15];
assign C1[14:10]=D[14:10];
assign C1[9:0]=AMant[9:0];
assign appv=AMant[10];

assign D1=D;

endmodule
