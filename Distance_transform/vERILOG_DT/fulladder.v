

module fulladder(a, b, ci, sum, cout);

    input a, b, ci ;
    output cout, sum ;
	wire e1, e2, e3 ;
	HALF_ADDER HALF_ADDER1( a, b, e1, e2 );
	HALF_ADDER HALF_ADDER2( e1, ci, sum, e3 );
	or( cout, e2, e3 ) ;
endmodule

