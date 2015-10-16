//Stage 0 cua khoi cordic, i = 0
module stage0(Xin,Yin,Zin,theta,Xout,Yout,Zout);
	input [15:0] Xin, Yin, Zin;		//Dau vao 1 khau
	input [17:0] theta;
	output [17:0] Xout, Yout, Zout;	//Dau ra 1 khau
	wire [15:0] Xin_tmp, Yin_tmp; 	//tin hieu trung gian sau bo dich
	wire [15:0] Xin_tmp_add, Yin_tmp_add,Zin_tmp_add;	//tin hieu trung gian cho dau vao bo cong
	wire [17:0] theta0;	//Hang so arctan cho dau vao bo cong
	
	//Khau Xi+1 = Xi - si*Yi*2^-i
	rightshifter#(16,0) rsY0 ( Yin, Yin_tmp[15:0] );	//Yi*2^-0
	assign Yin_tmp_add = Yin_tmp ^ {16{~Zin[15]}};		//Dao cac bit Yin if (Zin > 0)
	adder#(18) addX0 ( {Xin, 2'b00}, {Yin_tmp_add, 2'b00}, ~Zin[15], Xout /*cout*/);	//Xi+1 = Xi +- Yin_tmp_add (Zin<0 hoac Zin >0)
	
	//Khau Yi+1 = Yi +si*Xi*2^-i
	rightshifter#(16,0) rsX0 ( Xin, Xin_tmp[15:0] );	//Xi*2^-0
	assign Xin_tmp_add = Xin_tmp ^ {16{Zin[15]}};		//Dao cac bit Xin if (Zin < 0)
	adder#(18) addY0 ( {Yin, 2'b00}, {Xin_tmp_add, 2'b00}, Zin[15], Yout /*cout*/);	//Yi+1 = Yi -+ Yin_tmp_add (Zin<0 hoac Zin >0)
	
	assign theta0 = {18{~Zin[15]}} ^ theta;				//Dao cac bit Zin if (Zin < 0)
	adder#(18)	addZ0	( {Zin, 2'b00}, theta0, ~Zin[15], Zout /*cout*/);	//Zi+1 = Zin -+ theta (Zin<0 hoac Zin >0)
endmodule