`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:50:33 12/06/2013 
// Design Name: 
// Module Name:    mem_stage 
//////////////////////////////////////////////////////////////////////////////////
module mem_stage(
	 input no_clk,
	 //input rst,
	 input mem_write,
    input [4:0] address,
    input [31:0] write_data,
    output [31:0] data_out
    );
	 
	 data_memory memoria_datos (
		.clka(no_clk), 
		.wea(mem_write), 
		.addra(address[4:0]), 
		.dina(write_data), 
		.douta(data_out)
	 );
	 
	 
	 /*reg [31:0] data [31:0];
	
	always@(posedge no_clk or posedge rst) begin
		if (rst == 1) begin
			data[0] <= 0;
			data[1] <= 0;
			data[2] <= 0;
			data[3] <= 0;
			data[4] <= 0;
			data[5] <= 0;
			data[6] <= 0;
			data[7] <= 0;
			data[8] <= 0;
			data[9] <= 0;
			data[10] <= 0;
			data[11] <= 0;
			data[12] <= 0;
			data[13] <= 0;
			data[14] <= 0;
			data[15] <= 0;
			data[16] <= 0;
			data[17] <= 0;
			data[18] <= 0;
			data[19] <= 0;
			data[20] <= 0;
			data[21] <= 0;
			data[22] <= 0;
			data[23] <= 0;
			data[24] <= 0;
			data[25] <= 0;
			data[26] <= 0;
			data[27] <= 0;
			data[28] <= 0;
			data[29] <= 0;
			data[30] <= 0;
			data[31] <= 0;
		end
		else begin
			if(mem_write==1) data[address] <= write_data;
			else data_out <= data[address];
		end
	end
	 	*/ 
endmodule
