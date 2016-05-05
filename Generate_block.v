`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:24 04/29/2016 
// Design Name: 
// Module Name:    Generate_block 
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
module Generate_block(Random,position,check1,check2,check3,check4,ck);
input  [1:0] Random;
input ck;
//output reg [1:0]Active_pic;
output reg check1,check2,check3,check4;
output reg [8:0]position;
initial begin  check1=1;check2=1;check3=0;check4=1; end
always@(posedge ck)
	  begin
		check1<=1;
		check2<=1;
		check3<=1;
		check4<=1;
		case(Random)
		2'b00: 
		begin
			position = 0;
			check1<=0;
		//	Active_pic=1;
		end
		2'b01: 
		begin
			position = 125;
			check2<=0;
			//Active_pic=2;
		end
		2'b10:
		begin
			position = 250;
			check3<=0;
			//Active_pic=3;
		end
		2'b11: 
		begin
			position = 375;
			check4<=0;
			//Active_pic=4;
		end
		endcase
	  end

endmodule