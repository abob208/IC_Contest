module huffman(clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6 );

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;
	reg[2:0] HC_length[0:5] ; // 記錄此HC的長度
	reg[5:0] symbol[0:5] ; // 紀錄順序 
	reg[7:0] symbol_value[0:5] ; // 紀錄對應的值 0 是 A1
	reg[5:0] C1_symbol[0:4] ; // 合併之後的symbol包含甚麼 EX: 000011 (A1 A2)
	reg[5:0] C2_symbol[0:3] ;
	reg[5:0] C3_symbol[0:2] ;
	reg[5:0] C4_symbol[0:1] ;
	reg[7:0] C1[0:4] ;
	reg[7:0] C2[0:3] ;
	reg[7:0] C3[0:2] ;
	reg[7:0] C4[0:1] ;
	reg C1_sort ; // re_order 的訊號
	reg C2_sort ;
	reg C3_sort ;
	reg C4_sort ;
	reg[3:0] state ;
	reg[2:0] sort_stage ;
	// state = 0 排序階段
	//init -> sort index 0 是最大的 5 是最小的
	//combine C2 -> C3
	//split C4 -> C3
	always@( posedge clk or posedge reset )begin
		if( reset ) begin
			HC_length[0] <= 0 ;
			HC_length[1] <= 0 ;
			HC_length[2] <= 0 ;
			HC_length[3] <= 0 ;
			HC_length[4] <= 0 ;
			HC_length[5] <= 0 ;
			C1_symbol[0] <= 0 ;
			C1_symbol[1] <= 0 ;
			C1_symbol[2] <= 0 ;
			C1_symbol[3] <= 0 ;
			C1_symbol[4] <= 0 ;
			C2_symbol[0] <= 0 ;
			C2_symbol[1] <= 0 ;
			C2_symbol[2] <= 0 ;
			C2_symbol[3] <= 0 ;
			C3_symbol[0] <= 0 ;
			C3_symbol[1] <= 0 ;
			C3_symbol[2] <= 0 ;
			C4_symbol[0] <= 0 ;
			C4_symbol[1] <= 0 ;
			C1_sort <= 0 ;
			C2_sort <= 0 ;
			C3_sort <= 0 ;
			C4_sort <= 0 ;
			C1[0] <= 0 ;
			C1[1] <= 0 ;
			C1[2] <= 0 ;
			C1[3] <= 0 ;
			C1[4] <= 0 ;
			C2[0] <= 0 ;
			C2[1] <= 0 ;
			C2[2] <= 0 ;
			C2[3] <= 0 ;
			C3[0] <= 0 ;
			C3[1] <= 0 ;
			C3[2] <= 0 ;
			C4[0] <= 0 ;
			C4[1] <= 0 ;
			symbol_value[0] <= 0 ;
			symbol_value[1] <= 0 ;
			symbol_value[2] <= 0 ;
			symbol_value[3] <= 0 ;
			symbol_value[4] <= 0 ;
			symbol_value[5] <= 0 ;
			symbol[0] <= 6'b000001 ; // A1
			symbol[1] <= 6'b000010 ; // A2
			symbol[2] <= 6'b000100 ; // A3
			symbol[3] <= 6'b001000 ; // A4
			symbol[4] <= 6'b010000 ; // A5
			symbol[5] <= 6'b100000 ; // A6
			sort_stage <= 0 ;
			state <= 0 ;
			CNT_valid <= 0 ;
			CNT1 <= 0 ;
			CNT2 <= 0 ;
			CNT3 <= 0 ;
			CNT4 <= 0 ;
			CNT5 <= 0 ;
			CNT6 <= 0 ;
			code_valid <= 0 ;
			HC1 <= 0 ;
			HC2 <= 0 ;
			HC3 <= 0 ;
			HC4 <= 0 ;
			HC5 <= 0 ;
			HC6 <= 0 ;
			M1 <= 0 ;
			M2 <= 0 ;
			M3 <= 0 ;
			M4 <= 0 ;
			M5 <= 0 ;
			M6 <= 0 ;
		end
		else begin
			if( gray_valid )begin
				if( gray_data == 1 ) begin
					CNT1 <= CNT1 + 1 ;
					symbol_value[0] <= symbol_value[0] + 1 ;
				end
				if( gray_data == 2 ) begin
					CNT2 <= CNT2 + 1 ;
					symbol_value[1] <= symbol_value[1] + 1 ;
				end
				if( gray_data == 3 ) begin
					CNT3 <= CNT3 + 1 ;
					symbol_value[2] <= symbol_value[2] + 1 ;
				end
				if( gray_data == 4 ) begin
					CNT4 <= CNT4 + 1 ;
					symbol_value[3] <= symbol_value[3] + 1 ;
				end
				if( gray_data == 5 ) begin
					CNT5 <= CNT5 + 1 ;
					symbol_value[4] <= symbol_value[4] + 1 ;
				end
				if( gray_data == 6 ) begin
					CNT6 <= CNT6 + 1 ;
					symbol_value[5] <= symbol_value[5] + 1 ;
				end
			end
			else if ( state == 0 )begin
				if( sort_stage == 0 || sort_stage == 2 || sort_stage == 4 || sort_stage == 6 ) begin
					if( symbol_value[0] < symbol_value[1] ) begin
						//CNT1 <= CNT2 ;
						//CNT2 <= CNT1 ;
						symbol[0] <= symbol[1] ;
						symbol[1] <= symbol[0] ;
						symbol_value[0] <= symbol_value[1] ;
						symbol_value[1] <= symbol_value[0] ;
						
					end
				
					if( symbol_value[2] < symbol_value[3] ) begin
						//CNT3 <= CNT4 ;
						//CNT4 <= CNT3 ;
						symbol[2] <= symbol[3] ;
						symbol[3] <= symbol[2] ;
						symbol_value[2] <= symbol_value[3] ;
						symbol_value[3] <= symbol_value[2] ;
					end
				
					if( symbol_value[4] < symbol_value[5] ) begin
						//CNT5 <= CNT6 ;
						//CNT6 <= CNT5 ;
						symbol[4] <= symbol[5] ;
						symbol[5] <= symbol[4] ;
						symbol_value[4] <= symbol_value[5] ;
						symbol_value[5] <= symbol_value[4] ;
					end
					
				end
				else if( sort_stage == 1 || sort_stage == 3 || sort_stage == 5 || sort_stage == 7 ) begin
					if( symbol_value[1] < symbol_value[2] ) begin
						//CNT2 <= CNT3 ;
						//CNT3 <= CNT2 ;
						symbol[1] <= symbol[2] ;
						symbol[2] <= symbol[1] ;
						symbol_value[1] <= symbol_value[2] ;
						symbol_value[2] <= symbol_value[1] ;
					end
				
					if( symbol_value[3] < symbol_value[4] ) begin
						//CNT4 <= CNT5 ;
						//CNT5 <= CNT4 ;
						symbol[3] <= symbol[4] ;
						symbol[4] <= symbol[3] ;
						symbol_value[3] <= symbol_value[4] ;
						symbol_value[4] <= symbol_value[3] ;
					end
					
				end
				
				sort_stage <= sort_stage + 1 ;
				
				if ( sort_stage == 7 ) begin
					CNT_valid <= 1 ;
					state <= 1 ;
					sort_stage <= 0 ;
						//code_valid <= 1 ;
				end
				
			end // 0
			else if( state == 1 ) begin
				CNT_valid <= 0 ;
				if( !C1_sort ) begin
					if( symbol[5][0] == 1 ) begin
						HC1 <= 8'b00000001 ;
						M1 <= 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( symbol[5][1] == 1 ) begin
						HC2 <= 8'b00000001 ;
						M2 <= 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( symbol[5][2] == 1 ) begin
						HC3 <= 8'b00000001 ;
						M3 <= 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( symbol[5][3] == 1 ) begin
						HC4 <= 8'b00000001 ;
						M4 <= 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( symbol[5][4] == 1 ) begin
						HC5 <= 8'b00000001 ;
						M5 <= 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( symbol[5][5] == 1 ) begin
						HC6 <= 8'b00000000 ;
						M6 <= 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					/////////////////////////////////////////////
					if( symbol[4][0] == 1 ) begin
						HC1 <= 8'b00000000 ;
						M1 <= 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( symbol[4][1] == 1 ) begin
						HC2 <= 8'b00000000 ;
						M2 <= 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( symbol[4][2] == 1 ) begin
						HC3 <= 8'b00000000 ;
						M3 <= 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( symbol[4][3] == 1 ) begin
						HC4 <= 8'b00000000 ;
						M4 <= 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( symbol[4][4] == 1 ) begin
						HC5 <= 8'b00000000 ;
						M5 <= 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( symbol[4][5] == 1 ) begin
						HC6 <= 8'b00000000 ;
						M6 <= 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					////////////////////////////////////////////
					C1_symbol[4] <= symbol[4] | symbol[5] ;
					C1_symbol[3] <= symbol[3] ;
					C1_symbol[2] <= symbol[2] ;
					C1_symbol[1] <= symbol[1] ;
					C1_symbol[0] <= symbol[0] ;
					C1[4] <= symbol_value[4] + symbol_value[5] ;
					C1[3] <= symbol_value[3] ;
					C1[2] <= symbol_value[2] ;
					C1[1] <= symbol_value[1] ;
					C1[0] <= symbol_value[0] ;
					C1_sort <= 1 ;
					//HC1[0] <= 8'b00000000 ;
				end
				else if( C1_sort ) begin
					if( sort_stage == 0 ) begin
						if( C1[4] > C1[3]) begin
							C1[4] <= C1[3] ;
							C1[3] <= C1[4] ;
							C1_symbol[4] <= C1_symbol[3] ;
							C1_symbol[3] <= C1_symbol[4] ;
						end
						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 1 ) begin
						if( C1[3] > C1[2]) begin
							C1[3] <= C1[2] ;
							C1[2] <= C1[3] ;
							C1_symbol[2] <= C1_symbol[3] ;
							C1_symbol[3] <= C1_symbol[2] ;
						end
						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 2 ) begin
						if( C1[2] > C1[1]) begin
							C1[2] <= C1[1] ;
							C1[1] <= C1[2] ;
							C1_symbol[2] <= C1_symbol[1] ;
							C1_symbol[1] <= C1_symbol[2] ;
						end

						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 3 ) begin
						if( C1[1] > C1[0]) begin
							C1[1] <= C1[0] ;
							C1[0] <= C1[1] ;
							C1_symbol[0] <= C1_symbol[1] ;
							C1_symbol[1] <= C1_symbol[0] ;
						end

						sort_stage <= 0 ;
						state <= 2 ;
					end
				end // re_order
			end // 1 C1 第一次合併
			else if( state == 2 ) begin
				if( !C2_sort ) begin
					if( C1_symbol[4][0] == 1 ) begin
						HC1[HC_length[0]] <= 1 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C1_symbol[4][1] == 1 ) begin
						HC2[HC_length[1]] <= 1 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C1_symbol[4][2] == 1 ) begin
						HC3[HC_length[2]] <= 1 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C1_symbol[4][3] == 1 ) begin
						HC4[HC_length[3]] <= 1 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C1_symbol[4][4] == 1 ) begin
						HC5[HC_length[4]] <= 1 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C1_symbol[4][5] == 1 ) begin
						HC6[HC_length[5]] <= 1 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					/////////////////////////////////////////////
					if( C1_symbol[3][0] == 1 ) begin
						HC1[HC_length[0]] <= 0 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C1_symbol[3][1] == 1 ) begin
						HC2[HC_length[1]] <= 0 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C1_symbol[3][2] == 1 ) begin
						HC3[HC_length[2]] <= 0 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C1_symbol[3][3] == 1 ) begin
						HC4[HC_length[3]] <= 0 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C1_symbol[3][4] == 1 ) begin
						HC5[HC_length[4]] <= 0 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C1_symbol[3][5] == 1 ) begin
						HC6[HC_length[5]] <= 0 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					////////////////////////////////////////////
					C2_symbol[3] <= C1_symbol[3] | C1_symbol[4] ;
					C2_symbol[2] <= C1_symbol[2] ;
					C2_symbol[1] <= C1_symbol[1] ;
					C2_symbol[0] <= C1_symbol[0] ;
					C2[3] <= C1[3] + C1[4] ;
					C2[2] <= C1[2] ;
					C2[1] <= C1[1] ;
					C2[0] <= C1[0] ;
					C2_sort <= 1 ;
				end
				else if( C2_sort ) begin
					if( sort_stage == 0 ) begin
						if( C2[3] > C2[2]) begin
							C2[3] <= C2[2] ;
							C2[2] <= C2[3] ;
							C2_symbol[3] <= C2_symbol[2] ;
							C2_symbol[2] <= C2_symbol[3] ;
						end
						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 1 ) begin
						if( C2[2] > C2[1]) begin
							C2[2] <= C2[1] ;
							C2[1] <= C2[2] ;
							C2_symbol[1] <= C2_symbol[2] ;
							C2_symbol[2] <= C2_symbol[1] ;
						end

						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 2 ) begin
						if( C2[1] > C2[0]) begin
							C2[1] <= C2[0] ;
							C2[0] <= C2[1] ;
							C2_symbol[1] <= C2_symbol[0] ;
							C2_symbol[0] <= C2_symbol[1] ;
						end

						sort_stage <= 0 ;
						state <= 3 ;
					end
					
				end // re_order
			end // 2 C2 第二次合併
			else if( state == 3 ) begin
				if( !C3_sort )begin
					if( C2_symbol[2][0] == 1 ) begin
						HC1[HC_length[0]] <= 0 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C2_symbol[2][1] == 1 ) begin
						HC2[HC_length[1]] <=  0 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C2_symbol[2][2] == 1 ) begin
						HC3[HC_length[2]] <=  0 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C2_symbol[2][3] == 1 ) begin
						HC4[HC_length[3]] <=  0 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C2_symbol[2][4] == 1 ) begin
						HC5[HC_length[4]] <=  0 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C2_symbol[2][5] == 1 ) begin
						HC6[HC_length[5]] <=  0 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					/////////////////////////////////////////////
					if( C2_symbol[3][0] == 1 ) begin
						HC1[HC_length[0]] <= 1 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C2_symbol[3][1] == 1 ) begin
						HC2[HC_length[1]] <= 1 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C2_symbol[3][2] == 1 ) begin
						HC3[HC_length[2]] <= 1 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C2_symbol[3][3] == 1 ) begin
						HC4[HC_length[3]] <= 1 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C2_symbol[3][4] == 1 ) begin
						HC5[HC_length[4]] <= 1 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C2_symbol[3][5] == 1 ) begin
						HC6[HC_length[5]] <= 1 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end

					C3_symbol[2] <= C2_symbol[2] | C2_symbol[3] ;
					C3_symbol[1] <= C2_symbol[1] ;
					C3_symbol[0] <= C2_symbol[0] ;
					C3[2] <= C2[2] + C2[3] ;
					C3[1] <= C2[1] ;
					C3[0] <= C2[0] ;
					C3_sort <= 1 ;
				end
				else if( C3_sort ) begin
					if( sort_stage == 0 ) begin
						if( C3[2] > C3[1]) begin
							C3_symbol[1] <= C3_symbol[2] ;
							C3_symbol[2] <= C3_symbol[1] ;
							C3[2] <= C3[1] ;
							C3[1] <= C3[2] ;
						end

						sort_stage <= sort_stage + 1 ;
					end
					if( sort_stage == 1 ) begin
						if( C3[1] > C3[0]) begin
							C3_symbol[1] <= C3_symbol[0] ;
							C3_symbol[0] <= C3_symbol[1] ;
							C3[1] <= C3[0] ;
							C3[0] <= C3[1] ;
						end

						sort_stage <= 0 ;
						state <= 4 ;
					end
				end // re_order
			end // 3 C3 第三次合併
			else if( state == 4 ) begin
				if( !C4_sort )begin
					if( C3_symbol[2][0] == 1 ) begin
						HC1[HC_length[0]] <=   1 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C3_symbol[2][1] == 1 ) begin
						HC2[HC_length[1]] <=    1 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C3_symbol[2][2] == 1 ) begin
						HC3[HC_length[2]] <=   1 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C3_symbol[2][3] == 1 ) begin
						HC4[HC_length[3]] <=   1 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C3_symbol[2][4] == 1 ) begin
						HC5[HC_length[4]] <=   1 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
                        HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C3_symbol[2][5] == 1 ) begin
						HC6[HC_length[5]] <=   1 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					/////////////////////////////////////////////
					if( C3_symbol[1][0] == 1 ) begin
						HC1[HC_length[0]] <= 0 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C3_symbol[1][1] == 1 ) begin
						HC2[HC_length[1]] <= 0 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C3_symbol[1][2] == 1 ) begin
						HC3[HC_length[2]] <= 0 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C3_symbol[1][3] == 1 ) begin
						HC4[HC_length[3]] <= 0 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C3_symbol[1][4] == 1 ) begin
						HC5[HC_length[4]] <= 0 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C3_symbol[1][5] == 1 ) begin
						HC6[HC_length[5]] <= 0 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					C4_symbol[1] <= C3_symbol[1] | C3_symbol[2] ;
					C4_symbol[0] <= C3_symbol[0] ;
					C4[1] <= C3[1] + C3[2];
					C4[0] <= C3[0] ;
					C4_sort <= 1 ;
				end
				else if( C4_sort ) begin
					if( sort_stage == 0 ) begin
						if( C4[1] > C4[0]) begin
							C4_symbol[1] <= C4_symbol[0] ;
							C4_symbol[0] <= C4_symbol[1] ;
							C4[1] <= C4[0] ;
							C4[0] <= C4[1] ;
						end

						sort_stage <= 0 ;
						state <= 5 ;
					end
				end // re_order
			end // 4 C4 第四次合併
			else if ( state == 5 )begin
					if( C4_symbol[0][0] == 1 ) begin
						HC1[HC_length[0]] <=  0 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C4_symbol[0][1] == 1 ) begin
						HC2[HC_length[1]] <=  0 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C4_symbol[0][2] == 1 ) begin
						HC3[HC_length[2]] <=  0 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C4_symbol[0][3] == 1 ) begin
						HC4[HC_length[3]] <=  0 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C4_symbol[0][4] == 1 ) begin
						HC5[HC_length[4]] <=  0 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C4_symbol[0][5] == 1 ) begin
						HC6[HC_length[5]] <=  0 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					/////////////////////////////////////////////
					if( C4_symbol[1][0] == 1 ) begin
						HC1[HC_length[0]] <=  1 ;
						M1 <= ( M1 << 1 ) | 8'b00000001 ;
						HC_length[0] <= HC_length[0] + 1 ;
					end
					if( C4_symbol[1][1] == 1 ) begin
						HC2[HC_length[1]] <=  1 ;
						M2 <= ( M2 << 1 ) | 8'b00000001 ;
						HC_length[1] <= HC_length[1] + 1 ;
					end
					if( C4_symbol[1][2] == 1 ) begin
						HC3[HC_length[2]] <=  1 ;
						M3 <= ( M3 << 1 ) | 8'b00000001 ;
						HC_length[2] <= HC_length[2] + 1 ;
					end
					if( C4_symbol[1][3] == 1 ) begin
						HC4[HC_length[3]] <=  1 ;
						M4 <= ( M4 << 1 ) | 8'b00000001 ;
						HC_length[3] <= HC_length[3] + 1 ;
					end
					if( C4_symbol[1][4] == 1 ) begin
						HC5[HC_length[4]] <=  1 ;
						M5 <= ( M5 << 1 ) | 8'b00000001 ;
						HC_length[4] <= HC_length[4] + 1 ;
					end
					if( C4_symbol[1][5] == 1 ) begin
						HC6[HC_length[5]] <=  1 ;
						M6 <= ( M6 << 1 ) | 8'b00000001 ;
						HC_length[5] <= HC_length[5] + 1 ;
					end
					
					code_valid <= 1 ;
			end
		end
	end
endmodule

