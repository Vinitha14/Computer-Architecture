`include "cache.v"
module memoryout;
reg [15:0] abit;
reg t;
wire [15:0]bbit;
integer i;
reg clk;
initial begin
//main memory assignment
  wm.main_memory[0][15:0]=16'b0000000000000001;
  for(i=1;i<=65535;i=i+1)
   begin
    wm.main_memory[i][15:0]=wm.main_memory[i-1][15:0]+1;
   end
//cache assignment
 wm.cache[0][33]=1'b1;//valid bit
    wm.cache[0][32]=1'b0;//dirty bit
  wm.cache[0][26:16]=16'b00000000000;
  wm.cache[0][15:0] =16'b0000000000000001;
  wm.cache[0][31:27]=5'b00000;
  for(i=1;i<2048;i=i+1)
   begin
    wm.cache[i][33]=1'b1;//valid bit
    wm.cache[i][32]=1'b1;//dirty bit
    wm.cache[1][32]=1'b1;
    wm.cache[3][32]=1'b1;
    wm.cache[i][31:27]=5'b00000; 
    wm.cache[i][26:16]=wm.cache[i-1][26:16]+11'b00000000001;
    wm.cache[i][15:0]=wm.cache[i-1][15:0]+16'b0000000000000001;   
   end

end

initial begin
$dumpfile("cache.vcd");
 $dumpvars(0,memoryout);
 $display("       address        data       clk.r_w tag    cache     main ");

//write miss
$monitor(" %b %b %b %b %b %b %b",abit,bbit,clk,t,wm.tagcheck,wm.cache[5][33:0],wm.main_memory[32773][15:0]);
 clk=1;
 abit=16'b1000_0000_0000_0101;
 t=1'b1;
 
end
initial
#1000 $finish;
memory wm(.address(abit),.data(bbit),.r_w_enable(t),.clk(clk));
endmodule 

