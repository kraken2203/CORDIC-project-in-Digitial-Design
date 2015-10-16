//Bo cong 2 so 18 bit
module adder
	#(parameter n = 18)
	(a,b,cin,s,cout);
	input [n-1:0]a,b;
	input cin;
	output [n-1:0]s;
	output cout;
	assign {cout,s[n-1:0]} = a + b + cin;
endmodule