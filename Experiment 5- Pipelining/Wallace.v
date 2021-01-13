module WalMul(input [15:0] M,input [15:0] N,output [31:0] O,input clk);

wire [15:0] M,N;
wire [31:0] O;
wire [31:0] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;
reg [31:0] b1,b2,b3,b4,b5,b55,b6,b7,b8,b9,b10,b11,b12,b13,b14,a161,a162,a163;
reg [31:0] o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o51,o52,o131;
wire [31:0] b15,o15;

assign a1 = N[0]?{16'b0,M}:32'b0;   
assign a2 = N[1]?{15'b0,M,1'b0}:32'b0;   
assign a3 = N[2]?{14'b0,M,2'b0}:32'b0;   
assign a4 = N[3]?{13'b0,M,3'b0}:32'b0;   
assign a5 = N[4]?{12'b0,M,4'b0}:32'b0;   
assign a6 = N[5]?{11'b0,M,5'b0}:32'b0;   
assign a7 = N[6]?{10'b0,M,6'b0}:32'b0;   
assign a8 = N[7]?{9'b0,M,7'b0}:32'b0;
assign a9 = N[8]?{8'b0,M,8'b0}:32'b0;
assign a10 = N[9]?{7'b0,M,9'b0}:32'b0;
assign a11 = N[10]?{6'b0,M,10'b0}:32'b0;
assign a12 = N[11]?{5'b0,M,11'b0}:32'b0;
assign a13 = N[12]?{4'b0,M,12'b0}:32'b0;
assign a14 = N[13]?{3'b0,M,13'b0}:32'b0;
assign a15 = N[14]?{2'b0,M,14'b0}:32'b0;
assign a16 = N[15]?{1'b0,M,15'b0}:32'b0;

always @(posedge clk) begin
b1<=a1^ a2 ^ a3;
o1<={((a1 & a2)+(a3 & (a1 ^ a2))),1'b0};

b2<=a6 ^ a4 ^ a5;
o2<={((a6 & a4)+(a5 & (a6 ^ a4))),1'b0};

b3<=a7 ^ a8 ^ a9;
o3<={((a8 & a7)+(a9 & (a7 ^ a8))),1'b0};

b4<=a10 ^ a11 ^ a12;
o4<={((a10 & a11)+(a12 & (a10 ^ a11))),1'b0};

b5<=a13 ^ a14 ^ a15;
o5<={((a13 & a14)+(a15 & (a13 ^ a14))),1'b0};

a161<=a16;

b6<=b2 ^ b1 ^ o1;
o6<={((b1 & o1)+(b2 & (b1 ^ o1))),1'b0};

b7<=o3 ^ o2 ^ b3;
o7<={((o3 & o2)+(b3 & (o3 ^ o2))),1'b0};

b8<=b5 ^ o4 ^ b4;
o8<={((b5 & o4)+(b4 & (b5 ^ o4))),1'b0};

o51<=o5;
a162<=a161;

b10<=o6 ^ b6 ^ b7;
o10<={((o6 & b6)+(b7 & (o6 ^ b6))),1'b0};

b11<=b8 ^ o8 ^ o7;
o11<={((b8 & o8)+(o7 & (b8 ^ o8))),1'b0};

o52<=o51;
a163<=a162;

b12<=b10 ^ o10 ^ b11;
o12<={((b10 & o10)+(b11 & (b10 ^ o10))),1'b0};

b13<=o11 ^ a163 ^ o52;
o13<={((o11 & a163)+(o52 & (o11 ^ a163))),1'b0};


b14<=o12 ^ b12 ^ b13;
o14<={((o12 & b12)+(b13 & (o12 ^ b12))),1'b0};

o131<=o13;

end
assign b15=b14 ^ o14 ^ o131;
assign o15={((o14 & b14)+(o131 & (b14 ^ o14))),1'b0};

reg [31:0] D1,D2,D3,D4,D5,P1,P2,P3,P4,XO1,XO2,XO3,XO4,XO5;  
    reg [32:0] D,P; 
    always @(posedge clk) 
    begin
    P<={b15^o15,1'b0};
    D<={b15&o15,1'b0};
    end
    genvar k;
    generate
    for(k=1;k<32;k=k+1) 
	begin:FS
        always @(posedge clk) 
	begin
        D1[k]<=(D[k-1] & P[k]) + D[k];
        P1[k]<=P[k] & P[k-1];
        XO1<=P[32:1];
        end
    end
    for(k=2;k<32;k=k+1) 
	begin:SS
        always @(posedge clk) 
	begin
        D2[k]<=(D1[k-2] & P1[k]) + D1[k];
        P2[k]<=P1[k] & P1[k-2];
        XO2<=XO1;
        end
    end
    for(k=4;k<32;k=k+1) 
	begin:TS  
        always @(posedge clk) 
	begin
        D3[k]<=(D2[k-4] & P2[k]) + D2[k];
        P3[k]<=P2[k] & P2[k-4];
        XO3<=XO2;
        end
    end
    for(k=8;k<32;k=k+1) 
	begin:FFS
        always @(posedge clk) 
	begin
        D4[k]<=(D3[k-8] & P3[k]) + D3[k];
        P4[k]<=P3[k] & P3[k-8];
        XO4<=XO3;
        end
    end
    for(k=16;k<32;k=k+1) 
	begin:FFFS
    	always @(posedge clk) 
	begin
        D5[k]<=(D4[k-16] & P4[k]) + D4[k];
        XO5<=XO4;
        end
    end
    always@(posedge clk) 
    begin
    D1[0]<=D[0];

    D2[0]<=D1[0];
    D2[1]<=D1[1];
    end

    for(k=0;k<4;k=k+1)
        always @(posedge clk) D3[k]<=D2[k];

    for(k=0;k<8;k=k+1)
        always @(posedge clk) D4[k]<=D3[k]; 
        
    for(k=0;k<16;k=k+1)
    	always @(posedge clk) D5[k]<=D4[k];
    
    endgenerate

    assign O=XO5 ^ D5;
endmodule
