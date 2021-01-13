`include "kgp2.v"
`include "rd2.v"
module CLA2(C,D,A);
input [10:0]C;
input [10:0]D;
output [11:0]A;

wire [11:0]K1;wire [11:0]K0;
wire [11:0]X1;wire [11:0]X0;
wire [11:0]Y1;wire [11:0]Y0;
wire [11:0]Z1;wire [11:0]Z0;
wire [11:0]W1;wire [11:0]W0;

genvar n;
generate
for(n=0;n<11;n=n+1)
begin : lam
KGP2 kgp (C[n],D[n],K1[n+1],K0[n+1]); 
end
endgenerate

assign K1[0]=0;
assign K0[0]=0;

generate
for(n=11;n>0;n=n-1)
begin : pam
RD2 rd (K1[n-1],K0[n-1],K1[n],K0[n],X1[n],X0[n]); 
end
endgenerate

assign X1[0]=K1[0];
assign X0[0]=K0[0];

generate
for(n=11;n>1;n=n-1)
begin : gam
RD2 rdd (X1[n-2],X0[n-2],X1[n],X0[n],Y1[n],Y0[n]); 
end
endgenerate

assign Y1[0]=X1[0];
assign Y0[0]=X0[0];
assign Y1[1]=X1[1];
assign Y0[1]=X0[1];

generate
for(n=11;n>3;n=n-1)
begin : dam
RD2 rddd (Y1[n-4],Y0[n-4],Y1[n],Y0[n],Z1[n],Z0[n]); 
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

generate
for(n=11;n>7;n=n-1)
begin : fam
RD2 rdddd (Z1[n-8],Z0[n-8],Z1[n],Z0[n],W1[n],W0[n]); 
end
endgenerate

assign W1[0]=Z1[0];
assign W0[0]=Z0[0];
assign W1[1]=Z1[1];
assign W0[1]=Z0[1];
assign W1[2]=Z1[2];
assign W0[2]=Z0[2];
assign W1[3]=Z1[3];
assign W0[3]=Z0[3];
assign W1[4]=Z1[4];
assign W0[4]=Z0[4];
assign W1[5]=Z1[5];
assign W0[5]=Z0[5];
assign W1[6]=Z1[6];
assign W0[6]=Z0[6];
assign W1[7]=Z1[7];
assign W0[7]=Z0[7];

assign A=C ^ D ^ W1;
endmodule
