`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:45 02/22/2014 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
			input clk,
			input rst,
			input enable,
			input [6:0] pc_in,
			input stop,
			output reg bubble,
			output reg [6:0]PC
    );
	reg [1:0]flag;
	reg aux_stop;
	
	always @(clk) begin
		if (rst == 1) begin
			PC = 0;
			aux_stop = 0;
			flag = 0;
			bubble = 0;
		end
		else begin
			if (clk == 0) begin
				if(flag == 0) begin
					aux_stop = stop;
				end
				if(enable && ~aux_stop) begin
					PC = pc_in;
				end
			end
			else begin
				if(aux_stop || (flag != 0))
				begin
					if(flag == 3) begin
						flag = 0;
					end
					else begin
						if(flag == 2)
						begin
							bubble = 0;
							aux_stop = 0;
							flag = flag + 1;
						end
						else
						begin
							flag = flag + 1;
							bubble = 1;
						end
					end
				end
			end			
		end
	end
endmodule
