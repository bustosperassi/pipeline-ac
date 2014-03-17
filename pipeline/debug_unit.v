`timescale 1ns / 1ps

module debug_unit(
	//Entradas de funcionamiento
	 input top_clk,
	 input rst,
	 input wire rx_done_tick,
	 input wire [7:0] rx_bus,
	 input wire tx_done_tick,
	 input wire [31:0] instruccion,
	
	//Entradas de datos
	 input [6:0] pc,
	 input [38:0] if_id, //[38:32] next_pc_if_id, [31:0] instruction_if_id
	 input [126:0] id_ex, //[5:0] alu_op_id_ex,reg_dst_id_ex,alu_src_id_ex,mem_write_id_ex,reg_write_id_ex,mem_to_reg_id_ex,[31:0] data1_id_ex,[31:0] data2_id_ex,[31:0] sign_extend_id_ex,[4:0] reg1_id_ex,[4:0] reg2_id_ex,[4:0] rs_id_ex,[4:0] rt_id_ex
	 input [71:0] ex_m, //mem_to_reg_ex_m,reg_write_ex_m,mem_write_ex_m,[31:0] alu_result_ex_m,[31:0] data2_ex_m,[4:0] dst_ex_m,
	 input [70:0] m_wb, //reg_write_m_wb,mem_to_reg_m_wb,[31:0] alu_result_m_wb,[31:0] data_load_m_wb,[4:0] dst_m_wb,
	 input [1023:0] registers,
	 input [31:0] data,

	//Salidas de funcionamiento
	 output reg clk_pipe,
	 output reg alter_mux,
	 output reg alter_clk,
	 output [4:0] alter_address,
	 output reg rst_pipe,
	 
	//Salidas de envio
	 output reg tx_start,
	 output wire [7:0] tx_bus
    );
	 
	 reg [1023:0] buffer = 0;
	 reg [7:0] contador;
	 reg [4:0] contador_data = 0;
	 reg [2:0] contador_fin = 0;

   parameter IDLE = 0;
	parameter PC = 1;
	parameter IF_ID = 2;
	parameter ID_EX = 3;
	parameter EX_M = 4;
	parameter M_WB = 5;
	parameter MEMORY1 = 6;
	parameter MEMORY2 = 7;
	parameter MEMORY3 = 8;
	parameter REGISTERS = 9;
	parameter STEP = 10;
	parameter CONT1 = 11;
	parameter CONT2 = 12;
	parameter CONT3 = 13;
	parameter RESET = 14;

(* FSM_ENCODING="SEQUENTIAL", SAFE_IMPLEMENTATION="YES"*) reg [3:0] state = IDLE;

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
				contador <= 1;
				state <= PC;
			end
			
			CONT1: begin
				if(instruccion != 0) contador_fin <= 0;
				else contador_fin <= contador_fin + 1;
				if(contador_fin == 5) begin
					alter_mux <= 1;
					alter_clk <= 1;
					contador_data <= 32;
					state <= MEMORY1;
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

			PC: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer[7:0] <= {1'b0,pc};	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= IF_ID;
						buffer [39:0] <= {1'b0, if_id};
						tx_start <= 1;
						contador <= 5;
					end
				end
			end
			
			IF_ID: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= ID_EX;
						buffer[127:0] <= {1'b0,id_ex};
						tx_start <= 1;
						contador <= 16;
					end
				end
			end
			
			ID_EX: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= EX_M;
						buffer[71:0] <= ex_m;
						tx_start <= 1;
						contador <= 9;
					end
				end
			end
			
			EX_M: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= M_WB;
						buffer[71:0] <= {1'b0,m_wb};
						tx_start <= 1;
						contador <= 9;
					end
				end
			end
			
			M_WB: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= REGISTERS;
						buffer <= registers;
						tx_start <= 1;
						contador <= 128;
					end
				end
			end
			
			REGISTERS: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= IDLE;
						contador <= 0;
					end
				end
			end
			
			MEMORY1: begin
				if(tx_done_tick)begin
					if(contador_data > 0) begin
						contador_data <= contador_data - 1'b1;
						alter_clk <= 0;
						state <= MEMORY2;
					end
					else begin
						state <= REGISTERS;
						buffer <= registers;
						tx_start <= 1;
						contador <= 128;
					end
				end
			end
			
			MEMORY2: begin
				if(tx_done_tick)begin
					contador <= 4;
					alter_clk <= 1;
					buffer[31:0] <= data;
					tx_start <= 1;
					state <= MEMORY3;
				end
			end
			
			MEMORY3: begin
				if(tx_done_tick)begin
					if(contador > 0) begin
						buffer <= buffer >> 8;	
						tx_start <= 1;
						contador <= contador - 1'b1;
					end
					else begin
						state <= MEMORY1;
						contador <= 0;
					end
				end
			end
			
		endcase
	end

   assign tx_bus = buffer [7:0];
	assign alter_address = contador_data;

endmodule
