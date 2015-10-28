module ThapPhan
#(parameter width_z = 18,
  parameter width_xy= 18)
  
  (input iCLK,
  input [width_z-4:0] z_i,
  output reg [3:0] z0, z1, z2, z3, z4, z5, z6);
  
  reg i = 0;
  reg [width_z-4:0]  z_p;//   =  0; =  z_i[width_z-4:0];
  reg [width_z:0] z; // z=z_i*4'b1010
  
always@(posedge iCLK)
begin
	// tinh cac so sau dau phay
		if (~i) begin 
			z_p = z_i;
			i 	 = 1;
						
						z		=		z_p*4'b1010;
						z0 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z1 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z2 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z3 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z4 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z5 	= 	z[width_z:width_z-3];
						z_p 	= 	z[width_z-4:0];
						
						z		=		z_p*4'b1010;
						z6 	= 	z[width_z:width_z-3];
					end
	end
endmodule