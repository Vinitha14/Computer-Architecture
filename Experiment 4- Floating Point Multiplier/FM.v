//final floating point MULTIPLICATION
`include "small.v"
`include "encoder.v"
`include "encoder1.v"
`include "wallace.v"

module FM(a,b,y,y1); 
input [15:0]a,b;
output [15:0]y;

wire [4:0]fifteen;
assign fifteen=5'b01111;

wire [4:0]sm,lr;
Smaller rm(b[14:10],fifteen,sm,lr);

wire [5:0]sub;
Subtracting gm(lr,sm,sub);

wire [5:0]exp;
CLA1 mr(sub[4:0],a[14:10],exp);

wire [15:0]a1,b1;
output [32:0]y1;
assign a1[15:11]=5'b00000;
assign a1[10]=1;
assign a1[9:0]=a[9:0];
assign b1[15:11]=5'b00000;
assign b1[10]=1;
assign b1[9:0]=b[9:0];
WalMul w(a1,b1,y1);

wire [4:0]shift;
wire valid;
Prio_Enco e(y1[22:0],shift,valid); // actually needed only 0 to 21

wire [4:0]exp1;
assign exp1=5'b10100;
wire [4:0]shifts;
wire [5:0]int;
Subtracting gm1(exp1,shift,int);
assign shifts = int[5] ? int[4:0] : 5'b00001;

wire [21:0]man;
assign man= y1[21:0] << shifts; //left shift
wire [5:0]fexp;
wire [5:0]int1;
assign int1[5]=0;
assign int1[4:0]=shifts[4:0];
assign fexp=exp-int1;

wire [21:0]man1;
assign man1= y1[21:0] >> shifts; //right shift
wire [5:0]fexp1;
assign fexp1=exp+6'b000001;

wire [15:0]temp;
assign temp[15]=(a[15] & ~b[15]) | (~a[15] & b[15]); //xor
assign temp[14:10]=int[5] ? fexp[4:0] : fexp1[4:0] ;
assign temp[9:0]=int[5] ? man[19:10] : man1[19:10];

wire [3:0]p0,p1;
wire z0,z1;
Prio_Enco1 r1(a,p0,z0);
Prio_Enco1 r2(b,p1,z1);

wire z;
wire [15:0]temp1;
assign z = z0&z1;

assign temp1=~z?16'b0000000000000000:temp;

wire [15:0]undefined;
wire [15:0]temp2;
assign temp2=exp[5] ? undefined : temp;

assign y= ~z?16'b0000000000000000:temp2;

endmodule
