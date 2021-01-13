`include "addition.v"
`include "subtraction.v"

module IEEEfloatingpt(C,D,ch,A); 
input [15:0]C,D;
input ch;
output [15:0]A;

wire [15:0]plus;
wire [15:0]minus;
wire [15:0]temp;
assign temp[15]=(D[15]&~ch)|(~D[15]&ch);
assign temp[14:0]=D[14:0];

Adding f(C,temp,plus);
Subtract fl(C,temp,minus);

wire n;
assign n=(~C[15]&temp[15])|(C[15]&~temp[15]);

wire [15:0]ans;
genvar l;
for(l=0;l<16;l=l+1)
begin
 assign ans[l]=n;
end

wire [15:0]Demp;
assign Demp=(minus & ans)|(plus & ~ans);

wire [3:0]m0,m1;
wire g0,g1;
Prio_Enco_16x4 pe1(C,m0,g0);
Prio_Enco_16x4 pe2(D,m1,g1);

wire [15:0]Demp1;
assign Demp1= ~g0 ? temp:C;

wire z;
assign z = g0&g1;
assign A=z?Demp:Demp1;
endmodule
