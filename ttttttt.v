`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:54:41 04/29/2016
// Design Name:   Random
// Module Name:   E:/kmutt work/final_project/On_the_run/ttttttt.v
// Project Name:  On_the_run
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Random
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ttttttt;

	// Inputs
	reg clk;

	// Outputs
	wire [3:0] data;

	// Instantiate the Unit Under Test (UUT)
	Random uut (
		.clk(clk), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		forever begin
      #10 ; clk=~clk;
		end
        
		// Add stimulus here

	end
      
endmodule

