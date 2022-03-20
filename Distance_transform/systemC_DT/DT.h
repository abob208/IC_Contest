#include "systemc.h"
#include<iostream>
#include<iomanip>
#include<string>
using namespace std;

SC_MODULE(DT){
	sc_in_clk clk; // �ɯ� 
	sc_in<bool> reset; // ���s 
	sc_out<bool> sti_rd; //  ��High�ɡA���DT�ݭn�VHost��(ROM)�������
	sc_out<sc_uint<10> > sti_addr; // ROM�ھڦ���}�ӧ��� 
	sc_in<sc_uint<16> > sti_di; //  �qROMŪ���Ӫ�DATA 
	sc_out<bool> res_wr; // �O�_�g�JRAM 
	sc_out<bool> res_rd; // �O�_�qRAMŪ�� 
	sc_out<sc_uint<14> > res_addr; // �ھڦ���}�ӨM�w�n��JRAM�����Ӧ�} 
	sc_out<sc_uint<8> > res_do; // �n�g�Jram���Ϲ���� 
	sc_in<sc_uint<8> > res_di; // ram�n�ǤJDT����� 
	sc_out<bool> done,fwpass_finish; // done������  fwpass_finish ��fwpass���� 

	sc_bit b ;
	sc_uint<14> count ;
	sc_uint<16> now_process ; 
	sc_uint<4> state ;
	sc_uint<8> bc_pixel ;
	void Init() {
		count = 129 ;
		state = 1 ;
	} ;

	void dosomething() {
		int temp_count = 0 ;
		if ( !fwpass_finish ) {
			if ( state == 1 ) {
				sti_rd = 1 ;
				if ( count == 129 ) {
					sti_addr = 8 ;
					// cout << sti_addr << "\n" ;
				}
				else {
					sti_addr.write( sti_addr.read() + 1 ) ;
				}
			
				state = 2 ;
			}
			else if ( state == 2 ) {
				res_wr = 0 ;
				//cout << count << "\n" ;

				b = sti_di.read() >> ( 15 - count % 16 ) & 0x1;
				if ( b == 0 || count % 128 == 127 || count % 128 == 0 ) {
					if ( 15 - count % 16 == 0 ) {
						state = 1 ;
					}
					count = count + 1 ;
					
					if ( count == 16255 ) {
						fwpass_finish = 1 ;
						state = 1 ;
						count = count - 1 ;
					}

				}
				else if ( b > 0 ) {
					res_rd = 1 ;
					res_addr = count - 1 ;
					state = 3 ;
				}

			}
			else if ( state == 3 ) {
				res_do = res_di ;
				res_addr = count - 129 ;
				res_rd = 1 ;
				state = 4 ;
			}
			else if ( state == 4 ) {
				if ( res_do > res_di ) {
					res_do = res_di ;
				}


				res_addr = count - 128 ;
				res_rd = 1 ;
				state = 5 ;
			}
			else if ( state == 5 ) {
				if ( res_do > res_di ) {
					res_do = res_di ;
				}


	
				res_addr = count - 127 ;
				res_rd = 1 ;
				state = 6 ;
			}
			else if ( state == 6 ) {

				if ( res_do > res_di ) {

					res_do.write( res_di.read() + 1 ) ;
				}
				else {
					res_do.write( res_do.read() + 1 ) ;
				}


				// res_do.write( res_do.read() + 1 ) ;

				res_addr = count ;
				res_wr = 1 ;

				if ( 15 - count % 16 == 0 ) {
					state = 1 ;
				}
				else {
					state = 2 ;
				}

				count = count + 1 ;
				if ( count == 16255 ) {
					fwpass_finish = 1 ;
					state = 1 ;
					count = count - 1 ;
				}

			}
		}
		else if ( !done ) {
			if ( state == 1 ) {
				res_wr = 0 ;
				res_rd = 1 ;
				res_addr = count ;
				state = 2 ;
			}
			else if ( state == 2 ) {
				res_wr = 0 ;
				
				if ( res_di.read() == 0 || count % 128 == 127 || count % 128 == 0 ) {
					count = count - 1 ;
					res_rd = 1 ;
					res_addr = count ;
					if ( count == 128 ) {
						done = 1 ;
					}
				}
				else if ( res_di.read() > 0 ) {
					bc_pixel = res_di ;
					res_rd = 1 ;
					res_addr = count + 1 ;
					state = 3 ;
				}

			}
			else if ( state == 3 ) {
				res_do = res_di ;
				res_addr = count + 129 ;
				res_rd = 1 ;
				state = 4 ;
			}
			else if ( state == 4 ) {
				if ( res_do > res_di ) {
					res_do = res_di ;
				}

				res_addr = count + 128 ;
				res_rd = 1 ;
				state = 5 ;
			}
			else if ( state == 5 ) {
				if ( res_do > res_di ) {
					res_do = res_di ;
				}

				res_addr = count + 127 ;
				res_rd = 1 ;
				state = 6 ;
			}
			else if ( state == 6 ) {
				if ( res_do > res_di ) {
					if ( res_di.read() + 1 > bc_pixel ) {
						res_do.write( bc_pixel ) ;
					}
					else {
						res_do.write( res_di.read() + 1 ) ;
					}
				}
				else {
					if ( res_do.read() + 1 > bc_pixel ) {
						res_do.write( bc_pixel ) ;
					}
					else {
						res_do.write( res_do.read() + 1 ) ;
					}
				}

				res_addr = count ;
				res_wr = 1 ;
				state = 1 ;


				count = count - 1 ;
				if ( count == 128 ) {
					done = 1 ;
				}

			}
		}
	} ;

	SC_CTOR(DT)
	{
		SC_METHOD( Init ) ;
		sensitive << reset.neg() ;
		SC_METHOD( dosomething ) ;
		sensitive << clk.pos() ;
	}

	~DT(){};

};
