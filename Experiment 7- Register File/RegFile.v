module REGFile(Re1,Re2,W,Da,D1,D2,Clk,Rst);

input [15:0]Da;
input [3:0]Re1,Re2,W;
input Clk,Rst;
output [15:0]D1,D2;

reg [15:0]N[15:0];

integer k;
always @(posedge Rst)
begin
N[0] = 16'b0000_0000_0000_0000;
for(k=1;k<=15;k=k+1)
begin : loop
N[k] = N[k-1] + 16'b0000_0000_0000_0001;
end
end

assign D1 = N[Re1];
assign D2 = N[Re2];

always @(posedge Clk)
begin
N[W]=Da;
end

endmodule
