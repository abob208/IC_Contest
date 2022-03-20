
`timescale 1ns/10ps

module  CONV(
	input		clk,
	input		reset,
	output	reg	busy,	
	input		ready,	
			
	output	reg[11:0]	iaddr,
	input	signed [19:0]	idata,	
	
	output	 reg	cwr,
	output	 reg[11:0]	caddr_wr,
	output	 wire signed [19:0]	cdata_wr,
	
	output	 reg	crd,
	output	 reg	caddr_rd,
	input	 signed [19:0]	cdata_rd,
	
	output	 reg[2:0] 	csel
	);

	reg state ;
	reg signed [39:0] temp_output ;
	reg signed [39:0] temp ;
	parameter signed K0_0 = 20'h0A89E ;
	parameter signed K0_1 = 20'h092D5 ; 
	parameter signed K0_2 = 20'h06D43 ; 
	parameter signed K0_3 = 20'h01004 ; 
	parameter signed K0_4 = 20'hF8F71 ; 
	parameter signed K0_5 = 20'hF6E54 ; 
	parameter signed K0_6 = 20'hFA6D7 ; 
	parameter signed K0_7 = 20'hFC834 ; 
	parameter signed K0_8 = 20'hFAC19 ; 
	
	parameter signed K1_0 = 20'hFDB55 ;
	parameter signed K1_1 = 20'h02992 ; 
	parameter signed K1_2 = 20'hFC994 ; 
	parameter signed K1_3 = 20'h050FD ; 
	parameter signed K1_4 = 20'h02F20 ; 
	parameter signed K1_5 = 20'h0202D ; 
	parameter signed K1_6 = 20'h03BD7 ; 
	parameter signed K1_7 = 20'hFD369 ; 
	parameter signed K1_8 = 20'h05E68 ;
	
	parameter signed B_0 = 20'h01310 ;
	parameter signed B_1 = 20'hF7295 ;
	reg[5:0] counter ;
	reg signed [19:0] input_map[0:8] ;
	wire signed [39:0] temp ;
	assign cdata_wr = ( temp_output > 0 && temp_output[15] )? ( temp_output >>> 16 + 1 ) + B_0 :  
					  (	temp_output > 0 && !temp_output[15])? ( temp_output >>> 16	) + B_0 : 0 ;


	always@( posedge clk or posedge reset )begin
		if( reset )begin
			//$display( "~~~~~~") ;
			busy <= 0 ;
			crd <= 0 ;
			cwr <= 0 ;
			//cdata_wr <= 0 ;
			caddr_wr <= 0 ;
			caddr_rd <= 0 ;
			iaddr <= 0 ;
			csel <= 0 ;
			state <= 0 ;
			counter <= 0 ;
			input_map[0] <= 0 ;
			input_map[1] <= 0 ;
			input_map[2] <= 0 ;
			input_map[3] <= 0 ;
			input_map[4] <= 0 ;
			input_map[5] <= 0 ;
			input_map[6] <= 0 ;
			input_map[7] <= 0 ;
			input_map[8] <= 0 ;
			temp_output <= 0 ;
		end
		else begin
			if( state == 0 )begin
				if( ready )begin
					busy <= 1 ;
				end
				else if( busy )begin
					if( caddr_wr == 0 )begin 
						if( counter == 0 ) begin
							
							input_map[0] <= 0 ;
							input_map[1] <= 0 ;
							input_map[2] <= 0 ;
							input_map[3] <= 0 ;
							input_map[4] <= idata ;
							input_map[6] <= 0 ;
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_4 ; 
							iaddr <= iaddr + 1 ;
							counter <= counter + 1 ;
						end
						else if( counter == 1 ) begin
							
							csel <= 3'b001 ;
							input_map[5] <= idata ;
							temp_output <= temp_output + idata * K0_5 ; 
							iaddr <= 64 ;
							counter <= counter + 1 ;
						end
						else if( counter == 2 ) begin
						
							csel <= 3'b001 ;
							input_map[7] <= idata ;
							temp_output <= temp_output + idata * K0_7 ; 
							iaddr <= 65 ;
							counter <= counter + 1 ;
						end
						else if( counter == 3 ) begin
							csel <= 3'b001 ;
							input_map[8] <= idata ;
							temp_output <= temp_output + idata * K0_8 ; 
							counter <= counter + 1 ;
							cwr <= 1 ;
						end
						else if( counter == 4 ) begin 
							//cdata_wr <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= 2 ;
							counter <= 0 ;
							input_map[3] <= input_map[4] ; 
							input_map[6] <= input_map[7] ;
							input_map[4] <= input_map[5] ;
							input_map[7] <= input_map[8] ;
							
						end
					end
					else if( caddr_wr < 63 )begin 
						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= idata * K0_5 + input_map[3] * K0_3 + input_map[4] * K0_4 + input_map[6] * K0_6 + input_map[7] * K0_7; 
							iaddr <= iaddr + 64 ;
							counter <= counter + 1 ;
							input_map[5] <= idata ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_8 ;
							counter <= counter + 1 ;
							input_map[8] <= idata ;
							cwr <= 1 ;
						end
						else if( counter == 2 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							if( caddr_wr != 62 )begin
								iaddr <= iaddr - 64 + 1 ;
							end
							else begin
								iaddr <= 62 ;
							end
							counter <= 0 ;
							input_map[3] <= input_map[4] ; 
							input_map[6] <= input_map[7] ;
							input_map[4] <= input_map[5] ;
							input_map[7] <= input_map[8] ;
						end
						
					end
					else if( caddr_wr == 63 )begin

						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_3 ; 
							iaddr <= 63 ;
							counter <= counter + 1 ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_4 ; 
							iaddr <= 126 ;
							counter <= counter + 1 ;
						end
						else if( counter == 2 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_6 ; 
							iaddr <= 127 ;
							counter <= counter + 1 ;
						end
						else if( counter == 3 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_7 ; 
							counter <= counter + 1 ;
							cwr <= 1 ;
						end
						else if( counter == 4 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= 0 ;
							counter <= 0 ;
							//busy <= 0 ;
						end
					end
					else if( caddr_wr % 64 == 0 && caddr_wr != 4032 ) begin
						
						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_1 ;
							iaddr <= iaddr + 1 ;
							counter <= counter + 1 ;
							input_map[1] <= idata ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_2 ; 
							iaddr <= iaddr + 63 ;
							counter <= counter + 1 ;
							input_map[2] <= idata ;
						end
						else if( counter == 2 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_4 ; 
							iaddr <= iaddr + 1 ;
							counter <= counter + 1 ;
							input_map[4] <= idata ;
						end
						else if( counter == 3 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_5 ;
							iaddr <= iaddr + 63 ;
							counter <= counter + 1 ;
							input_map[5] <= idata ;
						end
						else if( counter == 4 ) begin 
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_7 ;
							iaddr <= iaddr + 1 ;
							counter <= counter + 1 ;
							input_map[7] <= idata ;
						end
						else if( counter == 5 ) begin 
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_8 ;
							counter <= counter + 1 ;
							cwr <= 1 ;
							input_map[8] <= idata ;
						end
						else if( counter == 6 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= iaddr - 128 + 1 ;
							counter <= 0 ;
							input_map[0] <= input_map[1] ;	
							input_map[1] <= input_map[2] ;								
							input_map[3] <= input_map[4] ; 
							input_map[6] <= input_map[7] ;
							input_map[4] <= input_map[5] ;
							input_map[7] <= input_map[8] ;
						end
					end
					else if( caddr_wr % 64 == 63 && caddr_wr != 4095 ) begin
						if( counter == 0 ) begin
							input_map[2] <= 0 ;
							input_map[5] <= 0 ;
							input_map[8] <= 0 ;
							temp_output <= input_map[0] * K0_0 + input_map[1] * K0_1 + input_map[3] * K0_3 + input_map[4] * K0_4 + input_map[6] * K0_6 + input_map[7] * K0_7 ;
							cwr <= 1 ;
							csel <= 3'b001 ;
							counter <= counter + 1 ;
						end
						else if( counter == 1 ) begin
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= caddr_wr + 1 ;
							counter <= 0 ;
						end
					end
					else if( caddr_wr > 63 && caddr_wr < 4032 ) begin
						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= idata * K0_2 + input_map[0] * K0_0 + input_map[1] * K0_1 + input_map[3] * K0_3 + input_map[4] * K0_4 + input_map[6] * K0_6 + input_map[7] * K0_7 ;
							iaddr <= iaddr + 64 ;
							input_map[2] <= idata ;
							counter <= counter + 1 ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_5 ;
							iaddr <= iaddr + 64 ;
							input_map[5] <= idata ;
							counter <= counter + 1 ;

						end
						else if( counter == 2 ) begin 
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_8 ;
							counter <= counter + 1 ;
							input_map[8] <= idata ;
							cwr <= 1 ;
						end
						else if( counter == 3 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= iaddr - 128 + 1 ;	

							
							counter <= 0 ;
							input_map[0] <= input_map[1] ;	
							input_map[1] <= input_map[2] ;								
							input_map[3] <= input_map[4] ; 
							input_map[6] <= input_map[7] ;
							input_map[4] <= input_map[5] ;
							input_map[7] <= input_map[8] ;
						end
					end
					else if( caddr_wr == 4032 ) begin
					
						input_map[0] <= 0 ;
						input_map[3] <= 0 ;
						input_map[8] <= 0 ;
						input_map[7] <= 0 ;
						input_map[6] <= 0 ;
						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_1 ; 
							iaddr <= iaddr + 1 ;
							input_map[1] <= idata ;
							counter <= counter + 1 ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_2 ; 
							iaddr <= iaddr + 64 - 1 ;
							input_map[2] <= idata ;
							counter <= counter + 1 ;
						end
						else if( counter == 2 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_4 ; 
							input_map[4] <= idata ;
							iaddr <= iaddr + 1 ;
							counter <= counter + 1 ;
						end
						else if( counter == 3 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_5 ; 
							input_map[5] <= idata ;
							counter <= counter + 1 ;
							cwr <= 1 ;
						end
						else if( counter == 4 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= 3907 ;
							counter <= 0 ;
							input_map[0] <= input_map[1] ; 
							input_map[1] <= input_map[2] ;
							input_map[3] <= input_map[4] ;
							input_map[4] <= input_map[5] ;
						end
					end
					else if( caddr_wr >= 4033 && caddr_wr < 4095 )begin 
						if( counter == 0 ) begin
							csel <= 3'b001 ;
							temp_output <= idata * K0_2 + input_map[0] * K0_0 + input_map[1] * K0_1 + input_map[3] * K0_3 + input_map[4] * K0_4; 
							iaddr <= iaddr + 64 ;
							counter <= counter + 1 ;
							input_map[2] <= idata ;
						end
						else if( counter == 1 ) begin
							csel <= 3'b001 ;
							temp_output <= temp_output + idata * K0_5 ;
							counter <= counter + 1 ;
							input_map[5] <= idata ;
							cwr <= 1 ;
						end
						else if( counter == 2 ) begin 
							temp_output <= 0 ;
							caddr_wr <= caddr_wr + 1 ;
							cwr <= 0 ;
							iaddr <= iaddr - 64 + 1 ;
							counter <= 0 ;
							input_map[0] <= input_map[1] ; 
							input_map[1] <= input_map[2] ;
							input_map[3] <= input_map[4] ;
							input_map[4] <= input_map[5] ;
						end
					end
					else if( caddr_wr == 4095 ) begin
						if( counter == 0 )begin
							temp_output <= input_map[0] * K0_0 + input_map[1] * K0_1 + input_map[3] * K0_3 + input_map[4] * K0_4 ;
							cwr <= 1 ;
							counter = counter + 1 ;
						end
						else if( counter == 1 ) begin
							busy <= 0 ;
							counter <= 0 ; 
							cwr <= 0 ;
						end
					end
				end
			end
		end
	
	end



endmodule




