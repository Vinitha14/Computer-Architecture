module KGP1(C,D,Y1,Y0);
input C,D;
output Y0,Y1;

assign Y0=C|D;
assign Y1=C&D;

endmodule
