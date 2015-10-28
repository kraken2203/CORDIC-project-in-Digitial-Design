//Xu ly tin hieu nhap tu ban phim de xuat ra LCD
module process_keyboard(
  // Clock Input (50 MHz)
  input  CLOCK_50,
  //  Push Buttons
  input  [3:0]  KEY,
  //  7-SEG Displays
  output  [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
  //  LEDs
  output  [8:0]  LEDG,  //  LED Green[8:0]
  //  PS2 data and clock lines        
  input    PS2_DAT,
  input    PS2_CLK,
  //    LCD Module 16X2
  output LCD_ON,    // LCD Power ON/OFF
  output LCD_BLON,    // LCD Back Light ON/OFF
  output LCD_RW,    // LCD Read/Write Select, 0 = Write, 1 = Read
  output LCD_EN,    // LCD Enable
  output LCD_RS,    // LCD Command/Data Select, 0 = Command, 1 = Data
  inout [7:0] LCD_DATA    // LCD Data bus 8 bits
);

wire RST;
assign RST = KEY[0];

wire reset = 1'b0;
wire [7:0] scan_code;

reg [7:0] history[1:4];
wire read, scan_ready;

//	Break Code
wire [7:0]	break_code;
//	Make Code
reg [7:0]	make_code;
// Signal control decode
wire load_reg;
// Thanh ghi luu cac ki tu nhap tu ban phim, 8 ki tu
reg [7:0] reg_keyboard[0:7];
//	Dem so ki tu da duoc nap vao thanh ghi luu ki tu
reg [3:0] counter_char;
// bien dem cho vong for
integer i;

assign LEDG[7] = load_reg;

oneshot pulser(
   .pulse_out(read),
   .trigger_in(scan_ready),
   .clk(CLOCK_50)
);

keyboard kbd(
  .keyboard_clk(PS2_CLK),
  .keyboard_data(PS2_DAT),
  .clock50(CLOCK_50),
  .reset(reset),
  .read(read),
  .scan_ready(scan_ready),
  .scan_code(scan_code)
);


always @(posedge scan_ready)
begin
   history[4] <= history[3];
   history[3] <= history[2];
   history[2] <= history[1];
   history[1] <= scan_code;
end
//Giai ma scan code tu ban phim sang ma hien thi o LCD
assign break_code = history[2];

always @(*)
	case (scan_code)
		8'h70:	make_code = 8'h30;
		8'h69:	make_code = 8'h31;
		8'h72:	make_code = 8'h32;
		8'h7a:	make_code = 8'h33;
		8'h6b:	make_code = 8'h34;
		8'h73:	make_code = 8'h35;
		8'h74:	make_code = 8'h36;
		8'h6c:	make_code = 8'h37;
		8'h75:	make_code = 8'h38;
		8'h7d:	make_code = 8'h39;
		8'h79:	make_code = 8'h2b;	//	+
		8'h7b:	make_code = 8'h2d;	// -
		default: make_code = 8'h78;
	endcase

assign load_reg = (break_code == 8'hf0) ? 1'b1 : 1'b0; 

always @(posedge load_reg or negedge RST)
begin
	
	if(~RST)
	begin
		for (i = 0; i < 8; i = i + 1)
			reg_keyboard[i] <= 0;
		counter_char <= 0;
	end
	else 	if (counter_char == 4'd7)
			begin
				reg_keyboard[counter_char] <= make_code;
				counter_char <= 0;
			end
			else
			begin
				reg_keyboard[counter_char] <= make_code;
				counter_char <= counter_char + 1'b1;
			end
end

wire [6:0] myclock;

// reset delay gives some time for peripherals to initialize
wire DLY_RST;
Reset_Delay r0(    .iCLK(CLOCK_50),.oRESET(DLY_RST) );

// turn LCD ON
assign    LCD_ON        =    1'b1;
assign    LCD_BLON    	=    1'b1;

LCD_Display u1(
// Host Side
   .iCLK_50MHZ(CLOCK_50),
   .iRST_N(DLY_RST),
   .char0(reg_keyboard[0]),
   .char1(reg_keyboard[1]),
	.char2(reg_keyboard[2]),
	.char3(reg_keyboard[3]),
	.char4(reg_keyboard[4]),
	.char5(reg_keyboard[5]),
	.char6(reg_keyboard[6]),
	.char7(reg_keyboard[7]),
// LCD Side
   .DATA_BUS(LCD_DATA),
   .LCD_RW(LCD_RW),
   .LCD_E(LCD_EN),
   .LCD_RS(LCD_RS)
);

hex_7seg dsp0(history[1][3:0],HEX0);
hex_7seg dsp1(history[1][7:4],HEX1);

hex_7seg dsp2(reg_keyboard[0][3:0],HEX2);
hex_7seg dsp3(reg_keyboard[0][7:4],HEX3);

hex_7seg dsp4(reg_keyboard[1][3:0],HEX4);
hex_7seg dsp5(reg_keyboard[1][7:4],HEX5);

hex_7seg dsp6(reg_keyboard[2][3:0],HEX6);
hex_7seg dsp7(reg_keyboard[2][7:4],HEX7);


endmodule