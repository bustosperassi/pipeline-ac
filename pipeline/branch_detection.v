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
		output reg stop,
		output reg bubble,
		output [1:0] flag_reg
    );
	 
	 reg [1:0]flag; // Se levanta cuando aparece una instruccion de branch y ayuda a meter 2 burbujas utilizandose de contador. 
	
	assign flag_reg = flag;
	
	always @(negedge clk) begin
		if(rst == 1) begin
			stop 	<= 0;
			bubble <= 0;
			flag <= 0;
		end
		else begin
			if(flag != 0) begin
				if(flag == 3) begin
						stop <= 0;
						flag <= 0;
						bubble <= 0;
				end
				else begin
						if(flag == 1) begin
							bubble <= 1;
						end
						flag <= flag + 1;
				end
			end
			else begin
				case(instruccion)
					6'b000100: // beq
						begin
							flag <= 1;
							stop <= 1;
						end					
					6'b000101: // bne
						begin
							flag <= 1;
							stop <= 1;
						end
					6'b000010: // jump
						begin
							flag <= 1;
							stop <= 1;
						end
					default: 
						begin
							stop <= 0;
							flag <= 0;
						end
				endcase
			end
		end
	end
	 
endmodule
