//Stage i cua khoi cordic, i = 1->14
module stage1
	#(parameter stage = 1)
	(Xin,Yin,Zin,theta,Xout,Yout,Zout);
	input [17:0] Xin, Yin, Zin;		//Dau vao 1 khau
	input [17:0] theta;
	output [17:0] Xout, Yout, Zout;	//Dau ra 1 khau
	wire [17:0] Xin_tmp, Yin_tmp; 	//tin hieu trung gian sau bo dich
	wire [17:0] Xin_tmp_add, Yin_tmp_add, Zin_tmp_add;	//tin hieu trung gian cho dau vao bo cong
	wire [17:0] theta0;	//tin hieu cua theta constant cho dau vao bo cong
	
	//Khau Xi+1 = Xi - si*Yi*2^-i
	rightshifter#(18,stage) rsY0 ( Yin, Yin_tmp );	//Yi*2^-1
	assign Yin_tmp_add = Yin_tmp ^ {18{~Zin[17]}};	//Dao cac bit Yin if (Zin > 0)
	adder#(18) addX0 ( Xin, Yin_tmp_add, ~Zin[17], Xout /*cout*/);	//Xi+1 = Xi +- Yin_tmp_add (Zin<0 hoac Zin >0)
	
	//Khau Yi+1 = Yi +si*Xi*2^-i
	rightshifter#(18,stage) rsX0 ( Xin, Xin_tmp );	//Xi*2^-1
	assign Xin_tmp_add = Xin_tmp ^ {18{Zin[17]}};	//Dao cac bit Yin if (Zin < 0)
	adder#(18) addY0 ( Yin, Xin_tmp_add, Zin[17], Yout  /*cout*/);	//Yi+1 = Yi -+ Yin_tmp_add (Zin<0 hoac Zin >0)
	
	assign theta0 = {18{~Zin[17]}} ^ theta;	//Dao cac bit Zin if (Zin < 0)
	adder#(18)	addZ0	( Zin, theta0, ~Zin[17], Zout /*cout*/);	//Zi+1 = Zin -+ theta (Zin<0 hoac Zin >0)
endmodule