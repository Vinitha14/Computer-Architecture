module memory(address,data,r_w_enable,clk);
input [15:0]address;
output reg [15:0]data;
input r_w_enable,clk;
reg [33:0]cache[2047:0]; //33rd bit is valid and 32nd bit is dirty bit
reg [15:0]main_memory[65535:0];
reg [4:0] tagcheck;
integer ij;
reg [15:0] l;
reg[10:0] k;
always @(posedge clk)
begin
//tag check
for(ij=0;ij<5;ij=ij+1)
tagcheck[ij]=address[11+ij]^cache[address[10:0]][27+ij];

 //read data cache hit valid and not dirty
 if(cache[address[10:0]][33]==1 & tagcheck==5'b00000 & cache[address[10:0]][32]==1'b0 & r_w_enable==0)
  begin
      data[15:0]= cache[address[10:0]][15:0] ;
  end

 //read data cache hit valid and dirty so write back and read
 else if(cache[address[10:0]][33] ==1 & tagcheck==5'b00000 & cache[address[10:0]][32]==1'b1 & r_w_enable==0 )
  begin
    k[10:0]=((address[10:0])/16)*16;
    for(l=(address/16)*16;k<((address[10:0])/16)+16;l=l+1)
     begin
      main_memory[l][15:0]= cache[k][15:0];
      cache[k][32]=1'b0;
      k=k+1;
     end 
      data[15:0]=cache[address[10:0]][15:0];
  end

 //write data cache hit
 else if(cache[address[10:0]][33] ==1 & tagcheck==5'b00000 & r_w_enable==1)
  begin
    k[10:0]=((address[10:0])/16)*16;
    for(l=(address/16)*16;k<((address[10:0])/16)+16;l=l+1)
     begin
      cache[k][32]=1'b1;
     end 
      data[15:0]=cache[address[10:0]][15:0];

  end

 //read miss
 else if(cache[address[10:0]][33] ==1 & tagcheck!=5'b00000 & r_w_enable==0)
  begin
   k[10:0]=((address[10:0])/16)*16;
   for(l=(address/16)*16;k<((address[10:0])/16)+16;l=l+1)
     begin
      cache[k][15:0]= main_memory[l][15:0];
      cache[k][33]=1'b1; 
      cache[k][32]=1'b0;
      cache[k][31:27]=address[15:11];
      k=k+1;
     end 
      data[15:0]= cache[address[10:0]][15:0] ;
  end

 //write miss
 else if(tagcheck!=5'b00000 & r_w_enable==1)
  begin
    k[10:0]=((address[10:0])/16)*16;
    for(l=(address/16)*16;k<((address[10:0])/16)+16;l=l+1)
     begin
      cache[k][15:0]= main_memory[l][15:0];
      cache[k][33]=1'b1; 
      cache[k][32]=1'b1;
      cache[k][31:27]=address[15:11];
      k=k+1;
     end 
      data[15:0]= cache[address[10:0]][15:0];
  end
end

endmodule

