module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input		[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input		[7:0]	res_di,
	output  reg fwpass_finish
	);

	reg[13:0] count ;
	reg[15:0] now_process ;
	reg[3:0] state ;
	reg[7:0] bc_pixel ;


	always @( posedge clk ) begin
		if ( !reset ) begin
			done = 0 ;
			sti_rd = 0 ;
			sti_addr = 0 ;
			res_addr = 0 ;
			res_wr = 0 ;
			res_rd = 0 ;
			res_do = 0 ;
			fwpass_finish = 0 ;
			count = 14'b00000010000001 ;
			state = 1 ;
		end
		else if ( !fwpass_finish ) begin
			if ( state == 1 ) begin
				sti_rd = 1 ;
				if ( count == 129 ) begin
					sti_addr = 8 ;
				end
				else begin
					sti_addr = sti_addr + 1 ;
				end
			
				state = 2 ;
			end
			else if ( state == 2 ) begin
				res_wr = 0 ;
				if ( sti_di[15 - count % 16] == 0 || count % 128 == 127 || count % 128 == 0 ) begin
					if ( 15 - count % 16 == 0 ) begin
						state = 1 ;
					end
					count = count + 1 ;
					if ( count == 16255 ) begin
						fwpass_finish = 1 ;
						state = 1 ;
						count = count - 1 ;
					end
				end
				else if ( sti_di[15 - count % 16] > 0 ) begin
					res_rd = 1 ;
					res_addr = count - 1 ;
					state = 3 ;
				end

			end
			else if ( state == 3 ) begin
				res_do = res_di ;
				res_addr = count - 129 ;
				res_rd = 1 ;
				state = 4 ;
			end
			else if ( state == 4 ) begin
				if ( res_do > res_di ) begin
					res_do = res_di ;
				end

				res_addr = count - 128 ;
				res_rd = 1 ;
				state = 5 ;
			end
			else if ( state == 5 ) begin
				if ( res_do > res_di ) begin
					res_do = res_di ;
				end

				res_addr = count - 127 ;
				res_rd = 1 ;
				state = 6 ;
			end
			else if ( state == 6 ) begin
				if ( res_do > res_di ) begin
					res_do = res_di + 1 ;
				end
				else begin
					res_do = res_do + 1 ;
				end

				// res_do = res_do + 1 ;
				res_addr = count ;
				res_wr = 1 ;

				if ( 15 - count % 16 == 0 ) begin
					state = 1 ;
				end
				else begin
					state = 2 ;
				end

				count = count + 1 ;
				if ( count == 16255 ) begin
					fwpass_finish = 1 ;
					state = 1 ;
					count = count - 1 ;
				end

			end
		end
		else if ( !done ) begin
			if ( state == 1 ) begin
				res_wr = 0 ;
				res_rd = 1 ;
				res_addr = count ;
				state = 2 ;
			end
			else if ( state == 2 ) begin
				res_wr = 0 ;
				
				if ( res_di == 0 || count % 128 == 127 || count % 128 == 0 ) begin
					count = count - 1 ;
					res_rd = 1 ;
					res_addr = count ;
					if ( count == 128 ) begin
						done = 1 ;
					end
				end
				else if ( res_di > 0 ) begin
					bc_pixel = res_di ;
					res_rd = 1 ;
					res_addr = count + 1 ;
					state = 3 ;
				end

			end
			else if ( state == 3 ) begin
				res_do = res_di ;
				res_addr = count + 129 ;
				res_rd = 1 ;
				state = 4 ;
			end
			else if ( state == 4 ) begin
				if ( res_do > res_di ) begin
					res_do = res_di ;
				end

				res_addr = count + 128 ;
				res_rd = 1 ;
				state = 5 ;
			end
			else if ( state == 5 ) begin
				if ( res_do > res_di ) begin
					res_do = res_di ;
				end

				res_addr = count + 127 ;
				res_rd = 1 ;
				state = 6 ;
			end
			
			else if ( state == 6 ) begin

				if ( res_do > res_di ) begin
					if ( res_di + 1 > bc_pixel ) begin
						res_do = bc_pixel ;
					end
					else begin
						res_do = res_di + 1 ;
					end
				end
				else begin
					if ( res_do + 1 > bc_pixel ) begin
						res_do = bc_pixel ;
					end
					else begin
						res_do = res_do + 1 ;
					end
				end
				
				
				res_addr = count ;
				res_wr = 1 ;
				state = 1 ;


				count = count - 1 ;
				if ( count == 128 ) begin
					done = 1 ;
				end

			end
		end
	end
endmodule
