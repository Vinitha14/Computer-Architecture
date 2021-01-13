`include "smaller.v"
`include "mant_shift.v"
`include "cla2.v"
`include "cla1.v"
`include "subtractor.v"
`include "PriorityEncoder.v"
module Subtract(C,D,A); 
input [15:0]C,D;
output [15:0]A;

wire [15:0]S;
wire [15:0]L;
wire [15:0]C1;
wire [15:0]D1;
wire appv;

Smaller z1(C,D,S,L);

Mant_Shift t1(S,L,C1,D1,appv); 

wire [10:0]CMant;
wire [10:0]DMant;

assign CMant[10]=appv;
assign CMant[9:0]=C1[9:0];
assign DMant[10]=1;
assign DMant[9:0]=D1[9:0];

wire [11:0]AMant;
wire [10:0]Neg_CMant;
wire [11:0]Dum_CMant;
wire [10:0]C1Mant;

genvar n;
for(n=0;n<=10;n=n+1)
begin : qwerty
  assign Neg_CMant[n]=~CMant[n];
end

CLA2 c1(Neg_CMant,11'b00000000001,Dum_CMant);
assign C1Mant[10:0]=Dum_CMant[10:0];
CLA2 c2(C1Mant,DMant,AMant);

wire [4:0]CExp;
wire [4:0]DExp;
assign CExp[4:0]=C1[14:10];
assign DExp[4:0]=D1[14:10];

wire [5:0]A1;
wire [5:0]A2;
wire [5:0]AExp;
wire [15:0]k;

assign k[15:11]=5'b00000;
assign k[10:0]=AMant[10:0];
wire [3:0]f;
wire x;
Prio_Enco_16x4 pe(k,f,x);

wire [3:0]Exp;
assign Exp=4'b1010;
wire [3:0]Shft;
assign Shft=Exp-f;
wire [15:0]Demp;
assign Demp= k << Shft;
wire [4:0]TExp;
assign TExp=CExp[4:0]-Shft;

assign A[15]=D1[15];
assign A[14:10]= x ? TExp[4:0] : 5'b00000;
assign A[9:0] =Demp[9:0];
endmodule
