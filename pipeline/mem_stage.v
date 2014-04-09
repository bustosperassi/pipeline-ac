`timescale 1ns / 1ps

module mem_stage(
	 input no_clk,
	 input mem_write,
    input [6:0] address,
    input [31:0] write_data,
    output [31:0] data_out
    );
	 
	 data_memory memoria_datos (
		.clka(no_clk), 
		.wea(mem_write), 
		.addra(address[6:0]), 
		.dina(write_data), 
		.douta(data_out)
	 );

endmodule
