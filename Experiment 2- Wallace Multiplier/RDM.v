module rdm (input w,x,y,z,output Y1,Y0);
assign Y1 = y|(w&z);
assign Y0 = y|(z&x);
endmodule

module Rec_D (S1,S0,X1,X0);

input [32:0] S1;
input [32:0] S0;
output [32:0] X1;
output [32:0] X0;

wire [32:0] W1;
wire [32:0] W0;
wire [32:0] U1;
wire [32:0] U0;
wire [32:0] R1;
wire [32:0] R0;
wire [32:0] Q1;
wire [32:0] Q0;
wire [32:0] Y1;
wire [32:0] Y0;

rdm rd1(S1[31],S0[31],S1[32],S0[32],W1[32],W0[32]);
rdm rd2(S1[30],S0[30],S1[31],S0[31],W1[31],W0[31]);
rdm rd3(S1[29],S0[29],S1[30],S0[30],W1[30],W0[30]);
rdm rd4(S1[28],S0[28],S1[29],S0[29],W1[29],W0[29]);
rdm rd5(S1[27],S0[27],S1[28],S0[28],W1[28],W0[28]);
rdm rd6(S1[26],S0[26],S1[27],S0[27],W1[27],W0[27]);
rdm rd7(S1[25],S0[25],S1[26],S0[26],W1[26],W0[26]);
rdm rd8(S1[24],S0[24],S1[25],S0[25],W1[25],W0[25]);
rdm rd9(S1[23],S0[23],S1[24],S0[24],W1[24],W0[24]);
rdm rd10(S1[22],S0[22],S1[23],S0[23],W1[23],W0[23]);
rdm rd11(S1[21],S0[21],S1[22],S0[22],W1[22],W0[22]);
rdm rd12(S1[20],S0[20],S1[21],S0[21],W1[21],W0[21]);
rdm rd13(S1[19],S0[19],S1[20],S0[20],W1[20],W0[20]);
rdm rd14(S1[18],S0[18],S1[19],S0[19],W1[19],W0[19]);
rdm rd15(S1[17],S0[17],S1[18],S0[18],W1[18],W0[18]);
rdm rd16(S1[16],S0[16],S1[17],S0[17],W1[17],W0[17]);
rdm rd17(S1[15],S0[15],S1[16],S0[16],W1[16],W0[16]);
rdm rd18(S1[14],S0[14],S1[15],S0[15],W1[15],W0[15]);
rdm rd19(S1[13],S0[13],S1[14],S0[14],W1[14],W0[14]);
rdm rd20(S1[12],S0[12],S1[13],S0[13],W1[13],W0[13]);
rdm rd21(S1[11],S0[11],S1[12],S0[12],W1[12],W0[12]);
rdm rd22(S1[10],S0[10],S1[11],S0[11],W1[11],W0[11]);
rdm rd23(S1[9],S0[9],S1[10],S0[10],W1[10],W0[10]);
rdm rd24(S1[8],S0[8],S1[9],S0[9],W1[9],W0[9]);
rdm rd25(S1[7],S0[7],S1[8],S0[8],W1[8],W0[8]);
rdm rd26(S1[6],S0[6],S1[7],S0[7],W1[7],W0[7]);
rdm rd27(S1[5],S0[5],S1[6],S0[6],W1[6],W0[6]);
rdm rd28(S1[4],S0[4],S1[5],S0[5],W1[5],W0[5]);
rdm rd29(S1[3],S0[3],S1[4],S0[4],W1[4],W0[4]);
rdm rd30(S1[2],S0[2],S1[3],S0[3],W1[3],W0[3]);
rdm rd31(S1[1],S0[1],S1[2],S0[2],W1[2],W0[2]);
rdm rd310(S1[0],S0[0],S1[1],S0[1],W1[1],W0[1]);

assign W1[0]=S1[0];
assign W0[0]=S0[0];


rdm rd32 (W1[30],W0[30],W1[32],W0[32],U1[32],U0[32]);
rdm rd33 (W1[29],W0[29],W1[31],W0[31],U1[31],U0[31]);
rdm rd34 (W1[28],W0[28],W1[30],W0[30],U1[30],U0[30]);
rdm rd35 (W1[27],W0[27],W1[29],W0[29],U1[29],U0[29]);
rdm rd36 (W1[26],W0[26],W1[28],W0[28],U1[28],U0[28]);
rdm rd37 (W1[25],W0[25],W1[27],W0[27],U1[27],U0[27]);
rdm rd38 (W1[24],W0[24],W1[26],W0[26],U1[26],U0[26]);
rdm rd39 (W1[23],W0[23],W1[25],W0[25],U1[25],U0[25]);
rdm rd40 (W1[22],W0[22],W1[24],W0[24],U1[24],U0[24]);
rdm rd41 (W1[21],W0[21],W1[23],W0[23],U1[23],U0[23]);
rdm rd42 (W1[20],W0[20],W1[22],W0[22],U1[22],U0[22]);
rdm rd43 (W1[19],W0[19],W1[21],W0[21],U1[21],U0[21]);
rdm rd44 (W1[18],W0[18],W1[20],W0[20],U1[20],U0[20]);
rdm rd45 (W1[17],W0[17],W1[19],W0[19],U1[19],U0[19]);
rdm rd46 (W1[16],W0[16],W1[18],W0[18],U1[18],U0[18]);
rdm rd47 (W1[15],W0[15],W1[17],W0[17],U1[17],U0[17]);
rdm rd48 (W1[14],W0[14],W1[16],W0[16],U1[16],U0[16]);
rdm rd49 (W1[13],W0[13],W1[15],W0[15],U1[15],U0[15]);
rdm rd50 (W1[12],W0[12],W1[14],W0[14],U1[14],U0[14]);
rdm rd51 (W1[11],W0[11],W1[13],W0[13],U1[13],U0[13]);
rdm rd52 (W1[10],W0[10],W1[12],W0[12],U1[12],U0[12]);
rdm rd53 (W1[9],W0[9],W1[11],W0[11],U1[11],U0[11]);
rdm rd54 (W1[8],W0[8],W1[10],W0[10],U1[10],U0[10]);
rdm rd55 (W1[7],W0[7],W1[9],W0[9],U1[9],U0[9]);
rdm rd56 (W1[6],W0[6],W1[8],W0[8],U1[8],U0[8]);
rdm rd57 (W1[5],W0[5],W1[7],W0[7],U1[7],U0[7]);
rdm rd58 (W1[4],W0[4],W1[6],W0[6],U1[6],U0[6]);
rdm rd59 (W1[3],W0[3],W1[5],W0[5],U1[5],U0[5]);
rdm rd60 (W1[2],W0[2],W1[4],W0[4],U1[4],U0[4]);
rdm rd61 (W1[1],W0[1],W1[3],W0[3],U1[3],U0[3]);
rdm rd62 (W1[0],W0[0],W1[2],W0[2],U1[2],U0[2]);

assign U1[0]=W1[0];
assign U0[0]=W0[0];
assign U1[1]=W1[1];
assign U0[1]=W0[1];


rdm rd63(U1[28],U0[28],U1[32],U0[32],R1[32],R0[32]);
rdm rd64(U1[27],U0[27],U1[31],U0[31],R1[31],R0[31]);
rdm rd65(U1[26],U0[26],U1[30],U0[30],R1[30],R0[30]);
rdm rd66(U1[25],U0[25],U1[29],U0[29],R1[29],R0[29]);
rdm rd67(U1[24],U0[24],U1[28],U0[28],R1[28],R0[28]);
rdm rd68(U1[23],U0[23],U1[27],U0[27],R1[27],R0[27]);
rdm rd69(U1[22],U0[22],U1[26],U0[26],R1[26],R0[26]);
rdm rd70(U1[21],U0[21],U1[25],U0[25],R1[25],R0[25]);
rdm rd71(U1[20],U0[20],U1[24],U0[24],R1[24],R0[24]);
rdm rd72(U1[19],U0[19],U1[23],U0[23],R1[23],R0[23]);
rdm rd73(U1[18],U0[18],U1[22],U0[22],R1[22],R0[22]);
rdm rd74(U1[17],U0[17],U1[21],U0[21],R1[21],R0[21]);
rdm rd75(U1[16],U0[16],U1[20],U0[20],R1[20],R0[20]);
rdm rd76(U1[15],U0[15],U1[19],U0[19],R1[19],R0[19]);
rdm rd77(U1[14],U0[14],U1[18],U0[18],R1[18],R0[18]);
rdm rd78(U1[13],U0[13],U1[17],U0[17],R1[17],R0[17]);
rdm rd79(U1[12],U0[12],U1[16],U0[16],R1[16],R0[16]);
rdm rd80(U1[11],U0[11],U1[15],U0[15],R1[15],R0[15]);
rdm rd81(U1[10],U0[10],U1[14],U0[14],R1[14],R0[14]);
rdm rd82(U1[9],U0[9],U1[13],U0[13],R1[13],R0[13]);
rdm rd83(U1[8],U0[8],U1[12],U0[12],R1[12],R0[12]);
rdm rd84(U1[7],U0[7],U1[11],U0[11],R1[11],R0[11]);
rdm rd85(U1[6],U0[6],U1[10],U0[10],R1[10],R0[10]);
rdm rd86(U1[5],U0[5],U1[9],U0[9],R1[9],R0[9]);
rdm rd87(U1[4],U0[4],U1[8],U0[8],R1[8],R0[8]);
rdm rd88(U1[3],U0[3],U1[7],U0[7],R1[7],R0[7]);
rdm rd89(U1[2],U0[2],U1[6],U0[6],R1[6],R0[6]);
rdm rd90(U1[1],U0[1],U1[5],U0[5],R1[5],R0[5]);
rdm rd91(U1[0],U0[0],U1[4],U0[4],R1[4],R0[4]);

assign R1[0]=U1[0];
assign R0[0]=U0[0];
assign R1[1]=U1[1];
assign R0[1]=U0[1];
assign R1[2]=U1[2];
assign R0[2]=U0[2];
assign R1[3]=U1[3];
assign R0[3]=U0[3];


rdm rd92(R1[24],R0[24],R1[32],R0[32],Y1[32],Y0[32]);
rdm rd93(R1[23],R0[23],R1[31],R0[31],Y1[31],Y0[31]);
rdm rd94(R1[22],R0[22],R1[30],R0[30],Y1[30],Y0[30]);
rdm rd95(R1[21],R0[21],R1[29],R0[29],Y1[29],Y0[29]);
rdm rd96(R1[20],R0[20],R1[28],R0[28],Y1[28],Y0[28]);
rdm rd97(R1[19],R0[19],R1[27],R0[27],Y1[27],Y0[27]);
rdm rd98(R1[18],R0[18],R1[26],R0[26],Y1[26],Y0[26]);
rdm rd100(R1[17],R0[17],R1[25],R0[25],Y1[25],Y0[25]);
rdm rd101(R1[16],R0[16],R1[24],R0[24],Y1[24],Y0[24]);
rdm rd102(R1[15],R0[15],R1[23],R0[23],Y1[23],Y0[23]);
rdm rd103(R1[14],R0[14],R1[22],R0[22],Y1[22],Y0[22]);
rdm rd104(R1[13],R0[13],R1[21],R0[21],Y1[21],Y0[21]);
rdm rd105(R1[12],R0[12],R1[20],R0[20],Y1[20],Y0[20]);
rdm rd106(R1[11],R0[11],R1[19],R0[19],Y1[19],Y0[19]);
rdm rd107(R1[10],R0[10],R1[18],R0[18],Y1[18],Y0[18]);
rdm rd108(R1[9],R0[9],R1[17],R0[17],Y1[17],Y0[17]);
rdm rd109(R1[8],R0[8],R1[16],R0[16],Y1[16],Y0[16]);
rdm rd113(R1[7],R0[7],R1[15],R0[15],Y1[15],Y0[15]); 
rdm rd114(R1[6],R0[6],R1[14],R0[14],Y1[14],Y0[14]); 
rdm rd115(R1[5],R0[5],R1[13],R0[13],Y1[13],Y0[13]); 
rdm rd116(R1[4],R0[4],R1[12],R0[12],Y1[12],Y0[12]); 
rdm rd117(R1[3],R0[3],R1[11],R0[11],Y1[11],Y0[11]); 
rdm rd118(R1[2],R0[2],R1[10],R0[10],Y1[10],Y0[10]); 
rdm rd119(R1[1],R0[1],R1[9],R0[9],Y1[9],Y0[9]); 
rdm rd120(R1[0],R0[0],R1[8],R0[8],Y1[8],Y0[8]);  

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


rdm rd121(Y1[16],Y0[16],Y1[32],Y0[32],X1[32],X0[32]);
rdm rd122(Y1[15],Y0[15],Y1[31],Y0[31],X1[31],X0[31]);
rdm rd123(Y1[14],Y0[14],Y1[30],Y0[30],X1[30],X0[30]);
rdm rd124(Y1[13],Y0[13],Y1[29],Y0[29],X1[29],X0[29]);
rdm rd125(Y1[12],Y0[12],Y1[28],Y0[28],X1[28],X0[28]);
rdm rd126(Y1[11],Y0[11],Y1[27],Y0[27],X1[27],X0[27]);
rdm rd127(Y1[10],Y0[10],Y1[26],Y0[26],X1[26],X0[26]);
rdm rd128(Y1[9],Y0[9],Y1[25],Y0[25],X1[25],X0[25]);
rdm rd129(Y1[8],Y0[8],Y1[24],Y0[24],X1[24],X0[24]);
rdm rd130(Y1[7],Y0[7],Y1[23],Y0[23],X1[23],X0[23]);
rdm rd131(Y1[6],Y0[6],Y1[22],Y0[22],X1[22],X0[22]);
rdm rd132(Y1[5],Y0[5],Y1[21],Y0[21],X1[21],X0[21]);
rdm rd133(Y1[4],Y0[4],Y1[20],Y0[20],X1[20],X0[20]);
rdm rd134(Y1[3],Y0[3],Y1[19],Y0[19],X1[19],X0[19]);
rdm rd135(Y1[2],Y0[2],Y1[18],Y0[18],X1[18],X0[18]);
rdm rd136(Y1[1],Y0[1],Y1[17],Y0[17],X1[17],X0[17]);
rdm rd137(Y1[0],Y0[0],Y1[16],Y0[16],X1[16],X0[16]);

assign X1[0]=Y1[0];
assign X0[0]=Y0[0];
assign X1[1]=Y1[1];
assign X0[1]=Y0[1];
assign X1[2]=Y1[2];
assign X0[2]=Y0[2];
assign X1[3]=Y1[3];
assign X0[3]=Y0[3];
assign X1[4]=Y1[4];
assign X0[4]=Y0[4];
assign X1[5]=Y1[5];
assign X0[5]=Y0[5];
assign X1[6]=Y1[6];
assign X0[6]=Y0[6];
assign X1[7]=Y1[7];
assign X0[7]=Y0[7];
assign X1[8]=Y1[8];
assign X0[8]=Y0[8];
assign X1[9]=Y1[9];
assign X0[9]=Y0[9];
assign X1[10]=Y1[10];
assign X0[10]=Y0[10];
assign X1[11]=Y1[11];
assign X0[11]=Y0[11];
assign X1[12]=Y1[12];
assign X0[12]=Y0[12];
assign X1[13]=Y1[13];
assign X0[13]=Y0[13];
assign X1[14]=Y1[14];
assign X0[14]=Y0[14];
assign X1[15]=Y1[15];
assign X0[15]=Y0[15];

endmodule
