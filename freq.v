`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:53 04/30/2016 
// Design Name: 
// Module Name:    freq 
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
module freq(out,clk);
input clk;
output reg out;
reg[24:0] count =0;
always @ (posedge clk)
	if(count == 25'd100000)
		begin
		count <= 25'd0;
		out =~out ;
		end
	else
		count <= count + 25'd1;
endmodule
