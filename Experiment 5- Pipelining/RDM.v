module CLAout(input [15:0] M,input [15:0] N,input C_in,output [15:0] O,output Of,input clk);
    wire [15:0] M,N,O;
    wire [16:0] D,P; 
    wire Of, C_in;
    reg [15:0] D1,D2,D3,D4;
    reg [15:0] P1,P2,P3;
    reg [15:0] XO1,XO2,XO3,XO4;
    reg AO1,AO2,AO3,AO4; 
    
    genvar k;
    assign P={M^N,1'b0};
    assign D={M&N,C_in};
    generate
    for(k=1;k<16;k=k+1) 
	begin 
        always @(posedge clk) 
	begin
        D1[k]<=(D[k-1] & P[k])+D[k];
        P1[k]<=P[k] & P[k-1];
        AO1<=D[16];
        XO1<=P[16:1];
        end
    end
    for(k=2;k<16;k=k+1) 
	begin 
        always @(posedge clk) 
	begin
        D2[k]<=(D1[k-2] & P1[k])+D1[k];
        P2[k]<=P1[k]&P1[k-2];
        AO2<=AO1;
        XO2<=XO1;
        end
    end
    for(k=4;k<16;k=k+1) 
	begin 
        always @(posedge clk) 
	begin
        D3[k]<=(D2[k-4] & P2[k])+D2[k];
        P3[k]<=P2[k]&P2[k-4];
        AO3<=AO2;
        XO3<=XO2;
        end
    end
    for(k=8;k<16;k=k+1) 
	begin 
        always @(posedge clk) 
	begin
        D4[k]<=(D3[k-8] & P3[k])+D3[k];
        AO4<=AO3;
        XO4<=XO3;
        end
    end

    always @(posedge clk) begin
    D1[0]<=D[0];

    D2[0]<=D1[0];
    D2[1]<=D1[1];
    end

    for(k=0;k<4;k=k+1)
        always @(posedge clk) D3[k]<=D2[k];

    for(k=0;k<8;k=k+1)
        always @(posedge clk) D4[k]<=D3[k]; 
    
    endgenerate
    assign O=XO4 ^ D4;
    assign Of=(XO4[15] & D4[15]) + AO4;
endmodule
