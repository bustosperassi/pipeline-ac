`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:02 02/06/2014 
// Design Name: 
// Module Name:    branch_detection 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module branch_detection(
		input clk,
		input rst,
		input [5:0] instruccion,
		input branch_mem,
		output reg stop_pc, // Para el latch y el PC
		output reg stop_latch,
		output reg bubble // Mete una burbuja
    );
	
	wire stop;
	assign stop	= (~instruccion[1])&&instruccion[2]&&(~instruccion[3])&&(~instruccion[4])&&(~instruccion[5]);
	reg [2:0] contador;
	
	always @(negedge clk or posedge rst) begin
		if (rst == 1) begin
			stop_pc = 0;
			stop_latch = 0;
			bubble = 0;
			contador = 0;
		end
		else begin
			if(stop_pc || bubble || stop_latch) begin
				contador = contador + 1;
				if(contador == 1) begin 
					bubble = 1;	
					stop_pc = 0;
				end
				if(contador == 2) stop_latch = 0;
				if((contador == 3) && ~branch_mem) begin
					bubble = 0;
					contador = 0;
				end
				if(contador == 4) begin
					bubble = 0;
					contador = 0;
				end
			end
			else begin
				if (stop == 1) begin
					stop_pc = 1;
					stop_latch = 1;
				end
			end
		end
	end
	
endmodule