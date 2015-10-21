module tb_stage0();
	reg [15:0]    Xin	, Yin, Zin;		           
	reg [17:0]    theta;
	
	wire [17:0]   Xout, Yout, Zout;	
	reg [9:0] Z_tmp;
	stage0 logic0(.Xin(Xin), .Yin(Yin), .Zin({Z_tmp[8:0],7'b0}), .theta(theta), .Xout(Xout), .Yout(Yout), .Zout(Zout));
	
localparam FALSE = 1'b0;
localparam TRUE = 1'b1;

localparam VALUE = 32000/1.647; // reduce by a factor of 1.647 since thats the gain of the system

	initial
	begin
		Xin = 16'b0010011011011101;                    
		Yin = 16'b0000000000000000;                      
		Zin = 16'b0110010010001000;
		theta=18'b001100100100001111;
	end
	initial begin
	for (Z_tmp=0;Z_tmp<512;Z_tmp=Z_tmp+1)
	#5;
	end 
	initial  begin
	$display("----------------------------------------------");
	$display("----------- SIMULATION RESULT ----------------");
	$display("----------------------------------------------");
	$monitor("TIME = %d, Zin[15:0]=%b, Xout[17:0]=%b, Yout[17:0]=%b, Zout[17:0]=%b",$time, {Z_tmp[8:0],7'b0}, Xout, Yout, Zout);
end
endmodule 
