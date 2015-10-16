module tb_adder16;
	reg [15:0]a,b;
	reg cin;
	wire [15:0]s;
	wire cout;
	adder tb(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
		defparam tb.n = 16;
	wire [15:0]sum;
	wire carry_out;
	assign {carry_out, sum} = a + b + cin;
	initial begin
	a = 16'b0; b = 16'b0; cin = 0;
	#10 a = 16'd20; b = 16'd15; cin = 0;
	#10 a = 16'd10; b = 16'd15; cin = 1;
	#10 a = 16'hffff; b = 16'hffff; cin = 1;
	end
	initial begin
	$monitor("--",$time," a = %d, b = %d, cin = %d, sum = %d, cout = %d", a, b, cin, s, cout);
	end
	always @(*)
	begin
		if((sum == s)&&(carry_out == cout)) $display("PASS-----PASS-----PASS");
		else
		begin
			$display("FAIL----FAIL----FAIL");
			$finish;
		end
	end
endmodule