`timescale 1ps/1ps
module tb_rightshifter;
	reg [3:0]in;
	wire [3:0]out;
	rightshifter tb(.in(in),.out(out));
		defparam tb.n = 4;
		defparam tb.i = 2;
	initial begin
	#10 in = 4'b1011;
	#10 in = 4'b1101;
	#10 in = 4'b0011;
	end
endmodule
