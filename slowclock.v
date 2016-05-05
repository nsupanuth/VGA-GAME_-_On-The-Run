`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:06 04/29/2016 
// Design Name: 
// Module Name:    slowclock 
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
module slowclock(out,clk);
input clk;
output reg out;
reg[29:0] count =0;
always @ (posedge clk)
	if(count == 29'd2500000)//15sec for random
		begin
		count <= 29'd0;
		out =~out ;
		end
	else
		count <= count + 29'd1;
endmodule
