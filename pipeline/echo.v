`timescale 1ns / 1ps

module echo(
			input wire rx_done_tick,
			input wire [7:0] rx_bus,
			input wire tx_done_tick,
			input wire clk,
			input wire reset,
			output reg tx_start,
			output wire [7:0] tx_bus
    );


	reg [7:0] buffer;

   parameter idle = 0;
   parameter start = 1;
   parameter envio = 2;
   parameter envio2 = 3;

(* FSM_ENCODING="sequential", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="idle" *) reg [1:0] state = idle;

	always@(posedge clk) begin
		tx_start <= 0;
		(* PARALLEL_CASE *) case (state)
			idle : begin
				if (rx_done_tick)
					begin
						buffer <= rx_bus;
						state <= envio;
					end	
			end
			
			envio : begin						
				tx_start <= 1;			
				state <= envio2;
			end
			
			envio2 : begin						
				if(tx_done_tick) state <= idle;
			end
			
		endcase
	end

   assign tx_bus = buffer;

endmodule
