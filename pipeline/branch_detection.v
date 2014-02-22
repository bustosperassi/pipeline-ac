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
		input [5:0] instruccion,
		output reg stop
    );
	
	always @(instruccion) begin
		case(instruccion)
			6'b000100: // beq
				begin
					stop <= 1;
				end					
			6'b000101: // bne
				begin
					stop <= 1;
				end
			6'b000010: // jump
				begin
					stop <= 1;
				end
			default: 
				begin
					stop <= 0;
				end
		endcase
	end
endmodule
