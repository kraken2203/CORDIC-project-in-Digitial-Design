module tb_stage0();
	reg [15:0]    Xin	, Yin, Zin;		           
	reg [17:0]    theta;
	
	wire [17:0]   Xout, Yout, Zout;	
	
	stage0 logic0(.Xin(Xin), .Yin(Yin), .Zin(Zin), .theta(theta), .Xout(Xout), .Yout(Yout), .Zout(Zout));
	
localparam FALSE = 1'b0;
localparam TRUE = 1'b1;

localparam VALUE = 32000/1.647; // reduce by a factor of 1.647 since thats the gain of the system

	initial
	begin
		Xin = 16'b0110010010000111;                     // Xout = 32000*cos(angle)
		Yin = 16'b0110010010000111;                      // Yout = 32000*sin(angle)
		Zin=16'b0110010010000111;
		theta=18'b011001001000011111;
	end 
	
endmodule 
