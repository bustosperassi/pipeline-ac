`timescale 1ns / 1ps

module pipe_debugger(
		input top_clk,
		input top_rst,
		input enable,
		input tx,
		input rx
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
	wire [31:0] data_mem;
	wire [7:0] rx_bus;
	wire [7:0] tx_bus;
	wire [4:0] alter_address;
	
	pipeline pipe_instance (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.alter_mux(alter_mux), 
		.alter_clk(alter_clk), 
		.alter_address(alter_address), 
		.instruccion(instruccion), 
		.pc(pc), 
		.if_id(if_id), 
		.id_ex(id_ex), 
		.ex_m(ex_m), 
		.m_wb(m_wb), 
		.registros(registros), 
		.data_mem(data_mem)
	);
	
	debug_unit debug_instance (
		.top_clk(top_clk), 
		.rst(top_rst), 
		.rx_done_tick(rx_done_tick), 
		.rx_bus(rx_bus), 
		.tx_done_tick(tx_done_tick), 
		.instruccion(instruccion), 
		.pc(pc), 
		.if_id(if_id), 
		.id_ex(id_ex), 
		.ex_m(ex_m), 
		.m_wb(m_wb), 
		.registers(registros), 
		.data(data_mem), 
		.clk_pipe(clk), 
		.alter_mux(alter_mux), 
		.alter_clk(alter_clk), 
		.alter_address(alter_address), 
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
