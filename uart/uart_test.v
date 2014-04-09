module uart_test
	(
	input wire clk,
	input rst,
	output tx,
	output reg ledout
	);

	wire tx_done;
	reg [7:0] data = 8'h30;
	reg [12:0] contador = 28'b000000000000000000000000000;
	reg tx_start = 0; 

	uart uart_unit( 
		.clk(clk), 
		.rst(rst),
		.tx_start(tx_start),
		.tx_done_tick(tx_done),
		.r_data(data),
		.tx(tx)
	);
	
	always @(posedge clk) begin
		if (rst) begin
			data = 8'h30;
			ledout = 0;
			contador = 0;
		end
		else begin
			if (tx_done) begin
				data = data + 1'b1;
				ledout = ~ledout;
			end
			if (contador == 1) tx_start = ~tx_start; 
			if (contador == 28'b010000000000000000000000000) begin
				contador = 0;
				tx_start = ~tx_start;
				ledout = ~ledout;
			end
			
		end
		contador = contador + 1'b1;
	end
	
endmodule

