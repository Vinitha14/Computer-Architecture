module rdm (input w,x,y,z,output Y1,Y0);
assign Y1 = y|(w&z);
assign Y0 = y|(z&x);
endmodule

module Rec_D (S1,S0,Y1,Y0);

input [16:0] S1;
input [16:0] S0;
output [16:0] Y1;
output [16:0] Y0;

wire [16:0] W1;
wire [16:0] W0;
wire [16:0] U1;
wire [16:0] U0;
wire [16:0] R1;
wire [16:0] R0;
wire [16:0] Q1;
wire [16:0] Q0;

rdm rd0(S1[15],S0[15],S1[16],S0[16],W1[16],W0[16]);
rdm rd1(S1[14],S0[14],S1[15],S0[15],W1[15],W0[15]);
rdm rd2(S1[13],S0[13],S1[14],S0[14],W1[14],W0[14]);
rdm rd3(S1[12],S0[12],S1[13],S0[13],W1[13],W0[13]);
rdm rd4(S1[11],S0[11],S1[12],S0[12],W1[12],W0[12]);
rdm rd5(S1[10],S0[10],S1[11],S0[11],W1[11],W0[11]);
rdm rd6(S1[9],S0[9],S1[10],S0[10],W1[10],W0[10]);
rdm rd7(S1[8],S0[8],S1[9],S0[9],W1[9],W0[9]);
rdm rd8(S1[7],S0[7],S1[8],S0[8],W1[8],W0[8]);
rdm rd9(S1[6],S0[6],S1[7],S0[7],W1[7],W0[7]);
rdm rd10(S1[5],S0[5],S1[6],S0[6],W1[6],W0[6]);
rdm rd11(S1[4],S0[4],S1[5],S0[5],W1[5],W0[5]);
rdm rd12(S1[3],S0[3],S1[4],S0[4],W1[4],W0[4]);
rdm rd13(S1[2],S0[2],S1[3],S0[3],W1[3],W0[3]);
rdm rd14(S1[1],S0[1],S1[2],S0[2],W1[2],W0[2]);
rdm rd15(S1[0],S0[0],S1[1],S0[1],W1[1],W0[1]);

assign W1[0]=S1[0];
assign W0[0]=S0[0];


rdm rd16 (W1[14],W0[14],W1[16],W0[16],U1[16],U0[16]);
rdm rd17 (W1[13],W0[13],W1[15],W0[15],U1[15],U0[15]);
rdm rd18 (W1[12],W0[12],W1[14],W0[14],U1[14],U0[14]);
rdm rd19 (W1[11],W0[11],W1[13],W0[13],U1[13],U0[13]);
rdm rd20 (W1[10],W0[10],W1[12],W0[12],U1[12],U0[12]);
rdm rd21 (W1[9],W0[9],W1[11],W0[11],U1[11],U0[11]);
rdm rd22 (W1[8],W0[8],W1[10],W0[10],U1[10],U0[10]);
rdm rd23 (W1[7],W0[7],W1[9],W0[9],U1[9],U0[9]);
rdm rd24 (W1[6],W0[6],W1[8],W0[8],U1[8],U0[8]);
rdm rd25 (W1[5],W0[5],W1[7],W0[7],U1[7],U0[7]);
rdm rd26 (W1[4],W0[4],W1[6],W0[6],U1[6],U0[6]);
rdm rd27 (W1[3],W0[3],W1[5],W0[5],U1[5],U0[5]);
rdm rd28 (W1[2],W0[2],W1[4],W0[4],U1[4],U0[4]);
rdm rd29 (W1[1],W0[1],W1[3],W0[3],U1[3],U0[3]);
rdm rd30 (W1[0],W0[0],W1[2],W0[2],U1[2],U0[2]);

assign U1[0]=W1[0];
assign U0[0]=W0[0];
assign U1[1]=W1[1];
assign U0[1]=W0[1];


rdm rd31(U1[12],U0[12],U1[16],U0[16],R1[16],R0[16]);
rdm rd32(U1[11],U0[11],U1[15],U0[15],R1[15],R0[15]);
rdm rd33(U1[10],U0[10],U1[14],U0[14],R1[14],R0[14]);
rdm rd34(U1[9],U0[9],U1[13],U0[13],R1[13],R0[13]);
rdm rd35(U1[8],U0[8],U1[12],U0[12],R1[12],R0[12]);
rdm rd36(U1[7],U0[7],U1[11],U0[11],R1[11],R0[11]);
rdm rd37(U1[6],U0[6],U1[10],U0[10],R1[10],R0[10]);
rdm rd38(U1[5],U0[5],U1[9],U0[9],R1[9],R0[9]);
rdm rd39(U1[4],U0[4],U1[8],U0[8],R1[8],R0[8]);
rdm rd40(U1[3],U0[3],U1[7],U0[7],R1[7],R0[7]);
rdm rd41(U1[2],U0[2],U1[6],U0[6],R1[6],R0[6]);
rdm rd42(U1[1],U0[1],U1[5],U0[5],R1[5],R0[5]);
rdm rd43(U1[0],U0[0],U1[4],U0[4],R1[4],R0[4]);

assign R1[0]=U1[0];
assign R0[0]=U0[0];
assign R1[1]=U1[1];
assign R0[1]=U0[1];
assign R1[2]=U1[2];
assign R0[2]=U0[2];
assign R1[3]=U1[3];
assign R0[3]=U0[3];

assign Y1[0]=R1[0];
assign Y0[0]=R0[0];
assign Y1[1]=R1[1];
assign Y0[1]=R0[1];
assign Y1[2]=R1[2];
assign Y0[2]=R0[2];
assign Y1[3]=R1[3];
assign Y0[3]=R0[3];
assign Y1[4]=R1[4];
assign Y0[4]=R0[4];
assign Y1[5]=R1[5];
assign Y0[5]=R0[5];
assign Y1[6]=R1[6];
assign Y0[6]=R0[6];
assign Y1[7]=R1[7];
assign Y0[7]=R0[7];


rdm rd44(R1[8],R0[8],R1[16],R0[16],Y1[16],Y0[16]);
rdm rd45(R1[7],R0[7],R1[15],R0[15],Y1[15],Y0[15]); 
rdm rd46(R1[6],R0[6],R1[14],R0[14],Y1[14],Y0[14]); 
rdm rd47(R1[5],R0[5],R1[13],R0[13],Y1[13],Y0[13]); 
rdm rd48(R1[4],R0[4],R1[12],R0[12],Y1[12],Y0[12]); 
rdm rd49(R1[3],R0[3],R1[11],R0[11],Y1[11],Y0[11]); 
rdm rd50(R1[2],R0[2],R1[10],R0[10],Y1[10],Y0[10]); 
rdm rd51(R1[1],R0[1],R1[9],R0[9],Y1[9],Y0[9]); 
rdm rd52(R1[0],R0[0],R1[8],R0[8],Y1[8],Y0[8]);  

endmodule
