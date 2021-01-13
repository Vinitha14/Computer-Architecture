/*`include "smaller.v"
`include "mant_shift.v"
`include "cla2.v"
`include "cla1.v"
`include "subtractor.v"*/
module Adding(C,D,A); 
input [15:0]C,D;
output [15:0]A;

wire [15:0]S;
wire [15:0]L;
wire [15:0]C1;
wire [15:0]D1;
wire appv;

Smaller z(C,D,S,L);

Mant_Shift t(S,L,C1,D1,appv); 

wire [10:0]CMant;
wire [10:0]DMant;

assign CMant[10]=appv;
assign DMant[10]=1;
assign CMant[9:0]=C1[9:0];
assign DMant[9:0]=D1[9:0];

wire [11:0]AMant;
CLA2 c(CMant,DMant,AMant);

wire [4:0]CExp;
wire [4:0]DExp;
assign CExp[4:0]=C1[14:10];
assign DExp[4:0]=D1[14:10];

wire [5:0]A1;
wire [5:0]A2;
wire [5:0]AExp;

CLA1 c1(CExp,5'b00001,A1);
CLA1 c2(CExp,5'b00000,A2);

assign AExp = AMant[11] ? A1:A2;

assign A[15]=D1[15];
assign A[14:10]=AExp[4:0];
assign A[9:0] = AMant[11] ? AMant[10:1] : AMant[9:0];

endmodule
