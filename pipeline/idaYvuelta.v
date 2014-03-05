`timescale 1ns / 1ps

//Esto es para probar!


module UART(
	input rx,
	input clk,
	output tx,
	output clockPipeline,
	input [143:0] bus_UART,
	input [31:0] instruccion,
	output resetUART
	
    );
	 

wire s_tick;
wire rx_done_tick;
wire tx_done_tick;
wire tx_start;
wire [7:0] rx_bus;
wire [7:0] tx_bus;

baud BaudGenerator (
    .sys_clk(clk), 
    .baud_clk(s_tick)
    );

uart_rx rxx (
    .clk(clk), 
    .reset(reset), 
    .rx(rx), 
    .s_tick(s_tick), 
    .rx_done_tick(rx_done_tick), 
    .dout(rx_bus)
    );

uart_tx txx (
    .clk(clk), 
    .reset(reset), 
    .tx_start(tx_start), 
    .s_tick(s_tick), 
    .din(tx_bus), 
    .tx_done_tick(tx_done_tick), 
    .tx(tx)
    );
	 
/*interface inter (
   .rx_done_tick(rx_done_tick), 
    .rx_bus(rx_bus), 
    .tx_done_tick(tx_done_tick), 
    .tx_start(tx_start), 
    .tx_bus(tx_bus), 
    .clk(clk), 
    .reset(reset),
	 .clockPipeline(clockPipeline),
	 .bus_UART(bus_UART),
	 .instruccion(instruccion),
	 .resetUART(resetUART)
    );
*/
	echo echoes (
		.rx_done_tick(rx_done_tick), 
		.rx_bus(rx_bus), 
		.tx_done_tick(tx_done_tick), 
		.clk(clk), 
		.reset(reset),
		.tx_start(tx_start), 
		.tx_bus(tx_bus) 
    );

endmodule
