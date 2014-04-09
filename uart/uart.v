//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:29 02/02/2014 
// Design Name: 
// Module Name:    uart 
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
module uart( 
	  input wire clk,
	  input wire rst,
	  input wire tx_start,
	  output wire tx_done_tick,
	  input wire [7:0] r_data,
	  output tx
    );
	
	wire tick;
	//wire [7:0] rx_data_out;
	
	mod_m_counter baud_gen_unit(
		.clk(clk), 
		.tick(tick)
	);
		
	uart_tx uart_tx_unit(
		.clk(clk),
		.tx_start(tx_start), 
		.s_tick(tick),
		.din(r_data),
		.tx_done_tick(tx_done_tick),
		.tx(tx)
	);	

	
endmodule
