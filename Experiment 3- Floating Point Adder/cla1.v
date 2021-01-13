`include "kgp1.v"
`include "rd1.v"
module CLA1(C,D,A);
input [4:0]C;
input [4:0]D;
output [5:0]A;

wire [5:0]K1;wire [5:0]K0;
wire [5:0]X1;wire [5:0]X0;
wire [5:0]Y1;wire [5:0]Y0;
wire [5:0]Z1;wire [5:0]Z0;

genvar n;
generate
for(n=0;n<5;n=n+1)
begin : lam
KGP1 kpg (C[n],D[n],K1[n+1],K0[n+1]); 
end
endgenerate

assign K1[0]=0;
assign K0[0]=0;

generate
for(n=5;n>0;n=n-1)
begin : pam
RD1 rd (K1[n-1],K0[n-1],K1[n],K0[n],X1[n],X0[n]); 
end
endgenerate

assign X1[0]=K1[0];
assign X0[0]=K0[0];

generate
for(n=5;n>1;n=n-1)
begin : gam
RD1 rdd (X1[n-2],X0[n-2],X1[n],X0[n],Y1[n],Y0[n]); 
end
endgenerate

assign Y1[0]=X1[0];
assign Y0[0]=X0[0];
assign Y1[1]=X1[1];
assign Y0[1]=X0[1];

generate
for(n=5;n>3;n=n-1)
begin : dam
RD1 rddd (Y1[n-4],Y0[n-4],Y1[n],Y0[n],Z1[n],Z0[n]); 
end
endgenerate

assign Z1[0]=Y1[0];
assign Z0[0]=Y0[0];
assign Z1[1]=Y1[1];
assign Z0[1]=Y0[1];
assign Z1[2]=Y1[2];
assign Z0[2]=Y0[2];
assign Z1[3]=Y1[3];
assign Z0[3]=Y0[3];

assign A=C ^ D ^ Z1;

endmodule
