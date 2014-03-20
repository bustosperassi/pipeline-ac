`timescale 1ns / 1ps

module debug_unit(
	//Entradas de funcionamiento
	 input top_clk,
	 input wire rx_done_tick,
	 input wire [7:0] rx_bus,
	 input wire tx_done_tick,
	 input wire [31:0] instruccion,
	
	//Entradas de datos
	 input [1343:0] send_data,
	 
	//Salidas de funcionamiento
	 output reg clk_pipe,
	 output reg rst_pipe,
	 
	//Salidas de envio
	 output reg tx_start /* synthesis syn_keep = 1 */,
	 output wire [7:0] tx_bus
    );
	 
	 reg [1343:0] buffer = 0 /* synthesis syn_keep = 1 */;
	 reg [7:0] contador = 0;
	 reg [5:0] contador_fin = 0;

   parameter IDLE = 0;
	parameter STEP = 1;
	parameter CONT1 = 2;
	parameter CONT2 = 3;
	parameter CONT3 = 4;
	parameter RESET = 5;
	parameter SEND1 = 6;
	parameter SEND2 = 7;
	
(* FSM_ENCODING="SEQUENTIAL", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="IDLE"*) reg [3:0] state = IDLE;

	always@(posedge top_clk) begin
		tx_start <= 0;
		(* PARALLEL_CASE *) case (state)
			IDLE: begin
				if (rx_done_tick) begin
					if ((rx_bus == "c") || (rx_bus == "C")) begin
						state <= CONT1;
					end
					if ((rx_bus == "s") || (rx_bus == "S")) begin
						contador <= 168;
						buffer <= send_data;
						state <= SEND1;
					end
					if ((rx_bus == "r") || (rx_bus == "R")) begin
						rst_pipe <= 1;
						clk_pipe <= 1;
						state <= RESET;
					end
				end	
			end
						
			STEP: begin
				clk_pipe <= 0;
				state <= IDLE;
			end
			
			CONT1: begin
				if(instruccion != 0) contador_fin <= 0;
				else contador_fin <= contador_fin + 1'b1;
				if(contador_fin == 5) begin
					buffer <= send_data;
					contador <= 168;
					state <= SEND1;
				end
				else state <= CONT2;
			end
			
			CONT2: begin
				clk_pipe <= 1;
				state <= CONT3;
			end
			
			CONT3: begin
				clk_pipe <= 0;
				state <= CONT1;
			end
			
			RESET: begin
				rst_pipe <= 0;
				clk_pipe <= 0;
				state <= IDLE;
			end
			
			SEND1: begin
				if(tx_done_tick)begin
					tx_start <= 1;
					state <= SEND2;
				end
			end

			SEND2: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= STEP;
						clk_pipe <= 1;
					end
				end
			end
			
		endcase
	end

   assign tx_bus = buffer [7:0];

endmodule
