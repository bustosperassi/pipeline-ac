`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:01:15 01/22/2014
// Design Name:   forwarding
// Module Name:   /home/nico/pipeline-ac/pipeline/forwarding_test.v
// Project Name:  pipeline
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: forwarding
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module forwarding_test;

	// Inputs
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] dst_mem;
	reg [4:0] dst_wb;
	reg wb_mem;
	reg wb_wb;

	// Outputs
	wire [1:0] cortoA;
	wire [1:0] cortoB;

	// Instantiate the Unit Under Test (UUT)
	forwarding uut (
		.rs(rs), 
		.rt(rt), 
		.dst_mem(dst_mem), 
		.dst_wb(dst_wb), 
		.wb_mem(wb_mem), 
		.wb_wb(wb_wb), 
		.cortoA(cortoA), 
		.cortoB(cortoB)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;
		dst_mem = 0;
		dst_wb = 0;
		wb_mem = 0;
		wb_wb = 0;

		#100;
		// La salida debe ser cortoA 00 cortoB 00
		rs = 4'b0001;
		rt = 4'b0001;
		dst_mem = 4'b0001;
		dst_wb = 4'b0010;
		wb_mem = 0;
		wb_wb = 1;

		#100;
		// La salida debe ser cortoA 01 cortoB 10
		rs = 4'b0010;
		rt = 4'b0001;
		dst_mem = 4'b0010;
		dst_wb = 4'b0001;
		wb_mem = 1;
		wb_wb = 1;
		
		#100;
		// La salida debe ser cortoA 10 cortoB 01
		rs = 4'b0011;
		rt = 4'b0010;
		dst_mem = 4'b0010;
		dst_wb = 4'b0011;
		wb_mem = 1;
		wb_wb = 1;
		
		#100;
		// La salida debe ser cortoA 11 cortoB 11
		rs = 4'b0001;
		rt = 4'b0001;
		dst_mem = 4'b0001;
		dst_wb = 4'b0001;
		wb_mem = 1;
		wb_wb = 1;


	end
      
endmodule

