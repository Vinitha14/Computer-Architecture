module KGP1(a,b,y1,y0);
input a,b;
output y0,y1;

assign y0=a|b;
assign y1=a&b;

endmodule

