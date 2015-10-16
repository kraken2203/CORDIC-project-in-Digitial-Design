//Bo dich phai so bit tuy y
module rightshifter
	#(parameter n = 4, i = 1)
	(in,out);
	input [n-1:0]in;
	output [n-1:0]out;
	wire [n-1:0]temp = in >> i;
	assign out = {{i{in[n-1]}}, temp[n-1-i:0]};
endmodule