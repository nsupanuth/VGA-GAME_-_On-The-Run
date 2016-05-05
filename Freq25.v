`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:17 04/05/2016 
// Design Name: 
// Module Name:    Freq25 
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
module Freq25(count,clk);
input clk;
output reg [24:0]count;
always @ (posedge clk)
	if(count == 25'd25000000)
		begin
		count <= 25'd0;
		end
	else
		count <= count + 25'd1;
endmodule
