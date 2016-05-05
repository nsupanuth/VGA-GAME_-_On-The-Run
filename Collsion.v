`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:41 05/01/2016 
// Design Name: 
// Module Name:    Collsion 
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
module Collsion(right,left,positionx,clk);
input right,left;
input [24:0]clk;
output integer positionx;
always @(clk)
	begin
	 if(right == 0  )
	 positionx = positionx+5;
	 else if(left == 0  )
	 positionx = positionx-5;
end

endmodule
