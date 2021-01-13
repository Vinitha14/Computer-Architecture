module RD1(C1,C0,D1,D0,Y1,Y0);
input C0,C1,D0,D1;
output Y0,Y1;

assign Y0=D1 | (C0 & D0);
assign Y1=D1 | (D0 & C1);

endmodule
