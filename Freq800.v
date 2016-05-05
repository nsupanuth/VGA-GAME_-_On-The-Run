`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:44 04/05/2016 
// Design Name: 
// Module Name:    Freq800 
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
module Freq800(out,clk);
input clk;
output reg out;
reg [27:0] count=0;
	always @ (posedge clk)
		if(count == 27'd250000000)
		begin
	      count <= 27'd0;
			out=~out;
		end
		else
		   count <= count + 1;

endmodule
