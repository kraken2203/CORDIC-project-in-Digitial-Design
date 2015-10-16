module vidu(s,a,b,y);
	input a,b,s;
	output y;
	assign y = s?a:b;
endmodule