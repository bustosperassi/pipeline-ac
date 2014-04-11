`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:46:16 04/04/2014
// Design Name:   forwarding
// Module Name:   /home/nico/pipeline-ac/pipeline/unidad_corto_test.v
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

module unidad_corto_test;

	// Inputs
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] dst_ex;
	reg [4:0] dst_mem;
	reg [4:0] dst_wb;
	reg wb_ex;
	reg wb_mem;
	reg wb_wb;

	// Outputs
	wire [1:0] cortoA;
	wire [1:0] cortoB;

	// Instantiate the Unit Under Test (UUT)
	forwarding uut (
		.rs(rs), 
		.rt(rt), 
		.dst_ex(dst_ex), 
		.dst_mem(dst_mem), 
		.dst_wb(dst_wb), 
		.wb_ex(wb_ex), 
		.wb_mem(wb_mem), 
		.wb_wb(wb_wb), 
		.cortoA(cortoA), 
		.cortoB(cortoB)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;
		dst_ex = 0;
		dst_mem = 0;
		dst_wb = 0;
		wb_ex = 0;
		wb_mem = 0;
		wb_wb = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rs = 1;
		rt = 0;
		dst_ex = 0;
		dst_mem = 0;
		dst_wb = 1;
		wb_ex = 0;
		wb_mem = 0;
		wb_wb = 1;

		#100;
		rs = 2;
		rt = 0;
		dst_ex = 0;
		dst_mem = 2;
		dst_wb = 2;
		wb_ex = 0;
		wb_mem = 1;
		wb_wb = 1;

		#100;
		rs = 3;
		rt = 0;
		dst_ex = 3;
		dst_mem = 3;
		dst_wb = 3;
		wb_ex = 1;
		wb_mem = 1;
		wb_wb = 1;

		#100;
		rs = 5;
		rt = 0;
		dst_ex = 5;
		dst_mem = 5;
		dst_wb = 1;
		wb_ex = 1;
		wb_mem = 1;
		wb_wb = 1;
		
		#100;
		rs = 6;
		rt = 0;
		dst_ex = 6;
		dst_mem = 1;
		dst_wb = 1;
		wb_ex = 1;
		wb_mem = 1;
		wb_wb = 1;
		
		#100;
		rs = 7;
		rt = 0;
		dst_ex = 1;
		dst_mem = 7;
		dst_wb = 1;
		wb_ex = 1;
		wb_mem = 1;
		wb_wb = 1;
		
		#100;
		rs = 8;
		rt = 0;
		dst_ex = 8;
		dst_mem = 1;
		dst_wb = 8;
		wb_ex = 1;
		wb_mem = 1;
		wb_wb = 1;

		#100;
		rs = 9;
		rt = 0;
		dst_ex = 9;
		dst_mem = 9;
		dst_wb = 9;
		wb_ex = 0;
		wb_mem = 0;
		wb_wb = 0;
		
	end
      
endmodule

