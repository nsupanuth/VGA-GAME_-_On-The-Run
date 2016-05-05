`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:24 04/30/2016 
// Design Name: 
// Module Name:    status 
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
module status(reset,start,dead,CounterX,status);
input reset,dead,start,CounterX;
output reg status;
initial begin status = 1; end


always@(negedge reset or negedge start or negedge dead)
begin
if (!reset) begin
	status = 1; 
	end
else if (!start) begin
	status = 1; 
	end
else if (!dead) begin
	status = 0; 
	end//Start game
end




endmodule