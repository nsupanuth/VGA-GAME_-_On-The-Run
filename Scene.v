`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:09 04/21/2016 
// Design Name: 
// Module Name:    Map1 
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
module Scene(
	output reg vga_R,vga_G,vga_B,
	input [9:0] CounterX,
	input [8:0] CounterY,
	input [24:0]clk
	);
	wire G =  (CounterX>=171) && (CounterX<=220) && (CounterY>=120) && (CounterY<=130)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=131) && (CounterY<=180)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=201) &&(CounterX<=230) && (CounterY>=151) && (CounterY<=160)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=161) && (CounterY<=180)
|| (CounterX>=171) &&(CounterX<=220) && (CounterY>=181) && (CounterY<=190);

wire A =  (CounterX>=261) && (CounterX<=290) && (CounterY>=120) && (CounterY<=130)
|| (CounterX>=251) &&(CounterX<=270) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=281) &&(CounterX<=300) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=141) && (CounterY<=150)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=141) && (CounterY<=150)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=151) && (CounterY<=160)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=151) && (CounterY<=160)
|| (CounterX>=241) &&(CounterX<=310) && (CounterY>=161) && (CounterY<=170)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=171) && (CounterY<=180)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=171) && (CounterY<=180)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=181) && (CounterY<=190)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=181) && (CounterY<=190);

wire M =  (CounterX>=321) && (CounterX<=330) && (CounterY>=120) && (CounterY<=130)
|| (CounterX>=381) &&(CounterX<=390) && (CounterY>=120) && (CounterY<=130)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=371) &&(CounterX<=390) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=321) &&(CounterX<=350) && (CounterY>=141) && (CounterY<=150)
|| (CounterX>=361) &&(CounterX<=390) && (CounterY>=141) && (CounterY<=150)
|| (CounterX>=321) &&(CounterX<=390) && (CounterY>=151) && (CounterY<=160)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=161) && (CounterY<=170)
|| (CounterX>=351) &&(CounterX<=360) && (CounterY>=161) && (CounterY<=170)
|| (CounterX>=371) &&(CounterX<=390) && (CounterY>=161) && (CounterY<=170)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=171) && (CounterY<=180)
|| (CounterX>=371) &&(CounterX<=390) && (CounterY>=171) && (CounterY<=180)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=181) && (CounterY<=190)
|| (CounterX>=371) &&(CounterX<=390) && (CounterY>=181) && (CounterY<=190);

wire E =  (CounterX>=401) && (CounterX<=470) && (CounterY>=120) && (CounterY<=130)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=131) && (CounterY<=140)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=141) && (CounterY<=150)
|| (CounterX>=401) &&(CounterX<=460) && (CounterY>=151) && (CounterY<=160)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=161) && (CounterY<=170)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=171) && (CounterY<=180)
|| (CounterX>=401) &&(CounterX<=470) && (CounterY>=181) && (CounterY<=190);

wire O =  (CounterX>=171) && (CounterX<=220) && (CounterY>=200) && (CounterY<=210)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=161) &&(CounterX<=180) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=211) &&(CounterX<=230) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=171) &&(CounterX<=220) && (CounterY>=261) && (CounterY<=270);

wire V =  (CounterX>=241) && (CounterX<=260) && (CounterY>=200) && (CounterY<=210)
|| (CounterX>=291) && (CounterX<=310) && (CounterY>=200) && (CounterY<=210)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=241) &&(CounterX<=260) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=291) &&(CounterX<=310) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=251) &&(CounterX<=270) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=281) &&(CounterX<=300) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=261) &&(CounterX<=290) && (CounterY>=261) && (CounterY<=270);

wire EE =  (CounterX>=321) && (CounterX<=390) && (CounterY>=200) && (CounterY<=210)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=321) &&(CounterX<=380) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=321) &&(CounterX<=340) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=321) &&(CounterX<=390) && (CounterY>=261) && (CounterY<=270);

wire R =  (CounterX>=401) && (CounterX<=460) && (CounterY>=200) && (CounterY<=210)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=451) &&(CounterX<=470) && (CounterY>=211) && (CounterY<=220)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=451) &&(CounterX<=470) && (CounterY>=221) && (CounterY<=230)
|| (CounterX>=401) &&(CounterX<=460) && (CounterY>=231) && (CounterY<=240)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=431) &&(CounterX<=450) && (CounterY>=241) && (CounterY<=250)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=441) &&(CounterX<=460) && (CounterY>=251) && (CounterY<=260)
|| (CounterX>=401) &&(CounterX<=420) && (CounterY>=261) && (CounterY<=270)
|| (CounterX>=451) &&(CounterX<=470) && (CounterY>=261) && (CounterY<=270);


	always@(clk)
	begin
		vga_R = G|A|M|EE|O|V|E|R;
		vga_G = G|A|M|EE|O|V|E|R;
		vga_B = G|A|M|EE|O|V|E|R;
	end
	
	
endmodule

