//full-adder 1 bit
module adder1bit(a,b,cin,s,cout);
	input a,b,cin;
	output s,cout;
	wire sel;
	assign sel = a^b;
	assign s = cin^sel;
	assign cout = sel?cin:b;
endmodule