`timescale 1ns / 1ps

module debug_unit(
	//Entradas de funcionamiento
	 input top_clk,
	 input wire rx_done_tick,
	 input wire [7:0] rx_bus,
	 input wire tx_done_tick,
	 input wire [31:0] instruccion,
	
	//Entradas de datos
	 //input [6:0] pc,
	 //input [38:0] if_id, //[38:32] next_pc_if_id, [31:0] instruction_if_id
	 //input [126:0] id_ex, //[5:0] alu_op_id_ex,reg_dst_id_ex,alu_src_id_ex,mem_write_id_ex,reg_write_id_ex,mem_to_reg_id_ex,[31:0] data1_id_ex,[31:0] data2_id_ex,[31:0] sign_extend_id_ex,[4:0] reg1_id_ex,[4:0] reg2_id_ex,[4:0] rs_id_ex,[4:0] rt_id_ex
	 //input [71:0] ex_m, //mem_to_reg_ex_m,reg_write_ex_m,mem_write_ex_m,[31:0] alu_result_ex_m,[31:0] data2_ex_m,[4:0] dst_ex_m,
	 //input [70:0] m_wb, //reg_write_m_wb,mem_to_reg_m_wb,[31:0] alu_result_m_wb,[31:0] data_load_m_wb,[4:0] dst_m_wb,
	 //input [1023:0] registers,
	 input [1343:0] send_data,
	 
	//Salidas de funcionamiento
	 output reg clk_pipe,
	 output reg rst_pipe,
	 
	//Salidas de envio
	 output reg tx_start,
	 output wire [7:0] tx_bus
    );
	 
	 reg [1343:0] buffer;
	 reg [7:0] contador;
	 reg [5:0] contador_fin;

   parameter IDLE = 0;
	parameter STEP = 1;
	parameter CONT1 = 2;
	parameter CONT2 = 3;
	parameter CONT3 = 4;
	parameter RESET = 5;
	parameter SEND1 = 6;
	parameter SEND2 = 7;
	
(* FSM_ENCODING="SEQUENTIAL", SAFE_IMPLEMENTATION="YES"*) reg [2:0] state = IDLE;

	always@(posedge top_clk) begin
		tx_start <= 0;
		(* PARALLEL_CASE *) case (state)
			IDLE: begin
				if (rx_done_tick) begin
					if ((rx_bus == "c") || (rx_bus == "C")) begin
						state <= CONT1;
					end
					if ((rx_bus == "s") || (rx_bus == "S")) begin
						clk_pipe <= 1;
						state <= STEP;
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
				contador <= 168;
				buffer <= send_data;
				state <= SEND1;
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
						state <= IDLE;
					end
				end
			end
			
		endcase
	end

   assign tx_bus = buffer [7:0];

endmodule
