module RD1(a1,a0,b1,b0,y1,y0);
input a0,a1,b0,b1;
output y0,y1;

assign y0=b1 | (a0 & b0);
assign y1=b1 | (b0 & a1);

endmodule

