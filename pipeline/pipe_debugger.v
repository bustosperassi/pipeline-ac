`timescale 1ns / 1ps

module pipe_debugger(
		input wire top_clk,
		input wire enable,
		input wire rx,
		output wire tx
		);
	 
	//_-_-_-_-_-_-_-_-Unidad de Debug + UART-_-_-_-_-_-_-_-_-_//
	
	wire rx_done_tick, tx_done_tick, s_tick, alter_mux, alter_clk, tx_start, clk, rst;
	wire [31:0]instruccion; 
	wire [6:0] pc;
	wire [38:0] if_id;
	wire [126:0] id_ex;
	wire [71:0] ex_m;
	wire [70:0] m_wb;
	wire [1023:0] registros;
	wire [7:0] rx_bus;
	wire [7:0] tx_bus;
	
	pipeline pipe_instance (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.instruccion(instruccion), 
		.pc(pc), 
		.if_id(if_id), 
		.id_ex(id_ex), 
		.ex_m(ex_m), 
		.m_wb(m_wb), 
		.registros(registros)
	);
	
	debug_unit debug_instance (
		.top_clk(top_clk), 
		.rx_done_tick(rx_done_tick), 
		.rx_bus(rx_bus), 
		.tx_done_tick(tx_done_tick), 
		.instruccion(instruccion), 
		.send_data({registros,1'b0,m_wb,ex_m,1'b0,id_ex,1'b0,if_id,1'b0,pc}),
		.clk_pipe(clk), 
		.rst_pipe(rst), 
		.tx_start(tx_start), 
		.tx_bus(tx_bus)
	);
	
	baud baud_instance (
		 .sys_clk(top_clk), 
		 .baud_clk(s_tick)
	);

	uart_rx rx_instance (
		 .clk(top_clk), 
		 .reset(rst), 
		 .rx(rx), 
		 .s_tick(s_tick), 
		 .rx_done_tick(rx_done_tick), 
		 .dout(rx_bus)
	);

	uart_tx tx_instance (
		 .clk(top_clk), 
		 .reset(rst), 
		 .tx_start(tx_start), 
		 .s_tick(s_tick), 
		 .din(tx_bus), 
		 .tx_done_tick(tx_done_tick), 
		 .tx(tx)
	);

endmodule
