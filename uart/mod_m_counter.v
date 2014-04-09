`timescale 1ns / 1ps

module mod_m_counter ( 
	input clk, 
	output reg tick
	);

	reg [9:0] contador = 10'b0000000000;

/*
 *	clock 100Mhz
 *	baud rate 19200
 *	
 *	Para obtener contador: vel_clock(Hz) /( baud_rate(b/s) * 16ticks )
 *
 *	contador = 325
 */

	always @ ( posedge clk )
		begin
			if ( contador == 652 )
				begin
					tick = 1;
					contador = 0;
				end
			else
				begin
					contador = contador + 1'b1;
					tick = 0;
				end
		end

endmodule
