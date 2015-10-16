module cordic(clk,rst_n,Xin,Yin,Zin,Xout,Yout,Zout);
	input [15:0] Xin, Yin, Zin;		//Dau vao khoi cordic
	input clk, rst_n;
	output [15:0] Xout, Yout, Zout;
	//Bien trung gian noi giua dau ra tung khau voi cac flipflop
	wire [17:0] Xout0, Yout0, Zout0;
	wire [17:0] Xout1, Yout1, Zout1;
	wire [17:0] Xout2, Yout2, Zout2;
	wire [17:0] Xout3, Yout3, Zout3;
	wire [17:0] Xout4, Yout4, Zout4;
	wire [17:0] Xout5, Yout5, Zout5;
	wire [17:0] Xout6, Yout6, Zout6;
	wire [17:0] Xout7, Yout7, Zout7;
	wire [17:0] Xout8, Yout8, Zout8;
	wire [17:0] Xout9, Yout9, Zout9;
	wire [17:0] Xout10, Yout10, Zout10;
	wire [17:0] Xout11, Yout11, Zout11;
	wire [17:0] Xout12, Yout12, Zout12;
	wire [17:0] Xout13, Yout13, Zout13;
	wire [17:0] Xout14, Yout14, Zout14;
	//Tin hieu trung gian noi dau ra flipflop voi dau vao cac khau
	reg [53:0] regin1;
	reg [53:0] regin2;
	reg [53:0] regin3;
	reg [53:0] regin4;
	reg [53:0] regin5;
	reg [53:0] regin6;
	reg [53:0] regin7;
	reg [53:0] regin8;
	reg [53:0] regin9;
	reg [53:0] regin10;
	reg [53:0] regin11;
	reg [53:0] regin12;
	reg [53:0] regin13;
	reg [53:0] regin14;
	reg [53:0] regin15;
	//tao ra mang cac gia tri hang so cho goc theta
	wire [17:0]theta_const[0:15];
	//Gan gia tri cho cac hang so theta
	assign  theta_const[0]=18'b001100100100001111;
	assign  theta_const[1]=18'b000111011010110001;
	assign  theta_const[2]=18'b000011111010110110;
	assign  theta_const[3]=18'b000001111111010101;
	assign  theta_const[4]=18'b000000111111111010;
	assign  theta_const[5]=18'b000000011111111111;
	assign  theta_const[6]=18'b000000001111111111;
	assign  theta_const[7]=18'b000000000111111111;
	assign  theta_const[8]=18'b000000000011111111;
	assign  theta_const[9]=18'b000000000001111111;
	assign theta_const[10]=18'b000000000000111111;
	assign theta_const[11]=18'b000000000000011111;
	assign theta_const[12]=18'b000000000000001111;
	assign theta_const[13]=18'b000000000000000111;
	assign theta_const[14]=18'b000000000000000011;
	assign theta_const[15]=18'b000000000000000001;
	
	always @(posedge clk or negedge rst_n)
	begin
		if (!rst_n) 
		begin
		regin1 <=0;
		regin2 <=0;
		regin3 <=0; 
		regin4 <=0;
		regin5 <=0;
		regin6 <=0;
		regin7 <=0;
		regin8 <=0;
		regin9 <=0;
		regin10 <=0;
		regin11 <=0;
		regin12 <=0;
		regin13 <=0;
		regin14 <=0;
		regin15 <=0;
		end
		else 
		begin
		regin1 <= {Xout0,Yout0,Zout0};
		regin2 <= {Xout1,Yout1,Zout1};
		regin3 <= {Xout2,Yout2,Zout2};
		regin4 <= {Xout3,Yout3,Zout3};
		regin5 <= {Xout4,Yout4,Zout4};
		regin6 <= {Xout5,Yout5,Zout5};
		regin7 <= {Xout6,Yout6,Zout6};
		regin8 <= {Xout7,Yout7,Zout7};
		regin9 <= {Xout8,Yout8,Zout8};
		regin10 <= {Xout9,Yout9,Zout9};
		regin11 <= {Xout10,Yout10,Zout10};
		regin12 <= {Xout11,Yout11,Zout11};
		regin13 <= {Xout12,Yout12,Zout12};
		regin14 <= {Xout13,Yout13,Zout13};
		regin15 <= {Xout14,Yout14,Zout14};
		end
	end
	
	//Ghep noi 16 tang cua cordic
	stage0 cordic0(.Xin(Xin),.Yin(Yin),.Zin(Zin),.theta(theta_const[0]),.Xout(Xout0),.Yout(Yout0),.Zout(Zout0));
	stage1#(1)  cordic1(.Xin(regin1[53:36]),.Yin(regin1[35:18]),.Zin(regin1[17:0]),.theta(theta_const[1]),.Xout(Xout1),.Yout(Yout1),.Zout(Zout1));
	stage1#(2)  cordic2(.Xin(regin2[53:36]),.Yin(regin2[35:18]),.Zin(regin2[17:0]),.theta(theta_const[2]),.Xout(Xout2),.Yout(Yout2),.Zout(Zout2));
	stage1#(3)  cordic3(.Xin(regin3[53:36]),.Yin(regin3[35:18]),.Zin(regin3[17:0]),.theta(theta_const[3]),.Xout(Xout3),.Yout(Yout3),.Zout(Zout3));
	stage1#(4)  cordic4(.Xin(regin4[53:36]),.Yin(regin4[35:18]),.Zin(regin4[17:0]),.theta(theta_const[4]),.Xout(Xout4),.Yout(Yout4),.Zout(Zout4));
	stage1#(5)  cordic5(.Xin(regin5[53:36]),.Yin(regin5[35:18]),.Zin(regin5[17:0]),.theta(theta_const[5]),.Xout(Xout5),.Yout(Yout5),.Zout(Zout5));
	stage1#(6)  cordic6(.Xin(regin6[53:36]),.Yin(regin6[35:18]),.Zin(regin6[17:0]),.theta(theta_const[6]),.Xout(Xout6),.Yout(Yout6),.Zout(Zout6));
	stage1#(7)  cordic7(.Xin(regin7[53:36]),.Yin(regin7[35:18]),.Zin(regin7[17:0]),.theta(theta_const[7]),.Xout(Xout7),.Yout(Yout7),.Zout(Zout7));
	stage1#(8)  cordic8(.Xin(regin8[53:36]),.Yin(regin8[35:18]),.Zin(regin8[17:0]),.theta(theta_const[8]),.Xout(Xout8),.Yout(Yout8),.Zout(Zout8));
	stage1#(9)  cordic9(.Xin(regin9[53:36]),.Yin(regin9[35:18]),.Zin(regin9[17:0]),.theta(theta_const[9]),.Xout(Xout9),.Yout(Yout9),.Zout(Zout9));
	stage1#(10) cordic10(.Xin(regin10[53:36]),.Yin(regin10[35:18]),.Zin(regin10[17:0]),.theta(theta_const[10]),.Xout(Xout10),.Yout(Yout10),.Zout(Zout10));
	stage1#(11) cordic11(.Xin(regin11[53:36]),.Yin(regin11[35:18]),.Zin(regin11[17:0]),.theta(theta_const[11]),.Xout(Xout11),.Yout(Yout11),.Zout(Zout11));
	stage1#(12) cordic12(.Xin(regin12[53:36]),.Yin(regin12[35:18]),.Zin(regin12[17:0]),.theta(theta_const[12]),.Xout(Xout12),.Yout(Yout12),.Zout(Zout12));
	stage1#(13) cordic13(.Xin(regin13[53:36]),.Yin(regin13[35:18]),.Zin(regin13[17:0]),.theta(theta_const[13]),.Xout(Xout13),.Yout(Yout13),.Zout(Zout13));
	stage1#(14) cordic14(.Xin(regin14[53:36]),.Yin(regin14[35:18]),.Zin(regin14[17:0]),.theta(theta_const[14]),.Xout(Xout14),.Yout(Yout14),.Zout(Zout14));
	stage15 cordic15(.Xin(regin15[53:36]),.Yin(regin15[35:18]),.Zin(regin15[17:0]),.theta(theta_const[15]),.Xout(Xout),.Yout(Yout),.Zout(Zout));
endmodule
	