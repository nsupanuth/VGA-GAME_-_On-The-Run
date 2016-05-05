`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:38 04/27/2016 
// Design Name: 
// Module Name:    Move_obj 
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
module Move_obj(CounterX,CounterY,obj_R,obj_G,obj_B,clk,check);
input [9:0] CounterX;
input [8:0] CounterY;
input clk;
output reg obj_R,obj_G,obj_B,check;
input left;
input right;
integer pattern;
wire active;



always @(posedge clk)
	begin
	 case(pattern)
		2'b00: 
		begin
		Obeject car(CounterX,CounterY,obj_R,obj_G,obj_B,clk,right,left,active);
		check=active;
		end
		2'b01: 
		begin
		Obeject car(CounterX,CounterY,obj_R,obj_G,obj_B,clk,right,left,active);
		check=active;
		end
		2'b10: 
		begin
		Obeject car(CounterX,CounterY,obj_R,obj_G,obj_B,clk,right,left,active);
		check=active;
		end
		2'b11: 
		begin
		Obeject car(CounterX,CounterY,obj_R,obj_G,obj_B,clk,right,left,active);
		check=active;
		end
	 endcase
	end



endmodule
