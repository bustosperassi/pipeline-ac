`timescale 1ns / 1ps

module debug_unit(
	//Entradas de funcionamiento
	 input top_clk,
	 input wire rx_done_tick,
	 input wire [7:0] rx_bus,
	 input wire tx_done_tick,
	 input wire [31:0] instruccion,
	
	//Entradas de datos
	 input [1375:0] send_data,
	 
	//Salidas de funcionamiento
	 output reg clk_pipe,
	 output reg rst_pipe,
	 
	//Salidas de envio
	 output reg tx_start /* synthesis syn_keep = 1 */,
	 output wire [7:0] tx_bus
    );
	 
	 reg [1375:0] buffer = 0 /* synthesis syn_keep = 1 */;
	 reg [7:0] contador = 0;
	 reg [5:0] contador_fin = 0;

   parameter IDLE = 4'b0000;
	parameter STEP1 = 4'b0001;
	parameter CONT1 = 4'b0010;
	parameter CONT2 = 4'b0011;
	parameter CONT3 = 4'b0100;
	parameter RESET = 4'b0101;
	parameter SEND1 = 4'b0110;
	parameter SEND2 = 4'b0111;
	parameter STEP2 = 4'b1000;
	
(* FSM_ENCODING="SEQUENTIAL", SAFE_IMPLEMENTATION="YES", SAFE_RECOVERY_STATE="IDLE" *) reg [3:0] state = IDLE;

	always@(posedge top_clk) begin
		tx_start <= 0;
		(* PARALLEL_CASE *) case (state)
			IDLE: begin
				if (rx_done_tick) begin
					if (rx_bus == "c") begin
						state <= CONT1;
					end
					if (rx_bus == "s") begin
						state <= STEP1;
						clk_pipe <= 1;
					end
					if (rx_bus == "r") begin
						rst_pipe <= 1;
						state <= RESET;
					end
				end	
			end
			
			CONT1: begin
				if(instruccion != 32'b11111100000000000000000000000000) contador_fin <= 0;
				else contador_fin <= contador_fin + 1'b1;
				if(contador_fin == 4) begin
					buffer <= send_data;
					contador <= 172;
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
			
			STEP1: begin
				clk_pipe <= 0;
				state <= STEP2;
			end
			
			STEP2: begin
				contador <= 172;
				buffer <= send_data;
				state <= SEND1;
			end
			
			SEND1: begin
					tx_start <= 1;
					contador <= contador - 1'b1;
					state <= SEND2;
			end

			SEND2: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= IDLE;
					end
				end
			end
						
			RESET: begin
				rst_pipe <= 0;
				state <= IDLE;
			end
						
		endcase
	end

   assign tx_bus = buffer [7:0];

endmodule
