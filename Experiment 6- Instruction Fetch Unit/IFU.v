module IFU(input wire [15:0] Ini_Value, input wire clk, input wire rst, output wire [15:0] instruct);
reg [15:0] PC;
reg [15:0] I_Mem[0:1023];
always @(rst) begin
    PC = Ini_Value;
    I_Mem[0] = 16'h0001;
    I_Mem[1] = 16'h0002;
    I_Mem[2] = 16'h0003;
    I_Mem[3] = 16'h0004;
    I_Mem[4] = 16'h0005;
    I_Mem[5] = 16'h0000;

end
always @(posedge clk & ~rst) 
begin
    PC <= PC + 1'b1;
end
    assign instruct = I_Mem[PC & 10'h3ff];

endmodule
