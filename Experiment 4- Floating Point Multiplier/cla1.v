`include "kgp1.v"
`include "rd1.v"
module CLA1(a,b,s);
input [4:0]a;
input [4:0]b;
output [5:0]s;

wire [5:0]k1;wire [5:0]k0;
wire [5:0]x1;wire [5:0]x0;
wire [5:0]y1;wire [5:0]y0;
wire [5:0]z1;wire [5:0]z0;

genvar i;
generate
for(i=0;i<5;i=i+1)
begin : module1
 KGP1 m0 (a[i],b[i],k1[i+1],k0[i+1]); 
end
endgenerate

assign k1[0]=0;
assign k0[0]=0;

generate
for(i=5;i>0;i=i-1)
begin : module2
 RD1 m1 (k1[i-1],k0[i-1],k1[i],k0[i],x1[i],x0[i]); 
end
endgenerate

assign x1[0]=k1[0];
assign x0[0]=k0[0];

generate
for(i=5;i>1;i=i-1)
begin : module3
 RD1 m2 (x1[i-2],x0[i-2],x1[i],x0[i],y1[i],y0[i]); 
end
endgenerate

assign y1[0]=x1[0];
assign y0[0]=x0[0];
assign y1[1]=x1[1];
assign y0[1]=x0[1];

generate
for(i=5;i>3;i=i-1)
begin : module4
 RD1 m3 (y1[i-4],y0[i-4],y1[i],y0[i],z1[i],z0[i]); 
end
endgenerate

assign z1[0]=y1[0];
assign z0[0]=y0[0];
assign z1[1]=y1[1];
assign z0[1]=y0[1];
assign z1[2]=y1[2];
assign z0[2]=y0[2];
assign z1[3]=y1[3];
assign z0[3]=y0[3];

assign s=a ^ b ^ z1;

endmodule
