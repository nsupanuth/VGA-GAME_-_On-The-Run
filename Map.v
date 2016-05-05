`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:59 04/23/2016 
// Design Name: 
// Module Name:    Map 
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
module Map(clk,CounterX,CounterY,Map_R,Map_G,Map_B);
input [24:0]clk;
input [9:0] CounterX;
input [8:0] CounterY;
output reg Map_R,Map_G,Map_B;
reg Ground,Road,Border,block,g1;
reg [5:0] Positiony;
reg Positionx=0;
always @ (posedge clk[17])//32778
if (Positiony == 480) Positiony <= 0;
else  Positiony <= Positiony + 2; 

always @ (CounterX or CounterY)
begin


Ground <= ((CounterX>=0 && CounterX<=80 && CounterY>=0 && CounterY<=480) ||
			 (CounterX>=560 && CounterX<=640 && CounterY>=0 && CounterY<=480) );
Border <= ((CounterX>=80 && CounterX<=81 && CounterY>=0 && CounterY<=480 )
			||  (CounterX>=319 && CounterX<=320 && CounterY>=0 && CounterY<=480)
			||  (CounterX>=320 && CounterX<=321 && CounterY>=0 && CounterY<=480)
			||  (CounterX>=559 && CounterX<=560 && CounterY>=0 && CounterY<=480));
Road   <=(  (CounterX>=81 && CounterX <= 196 && CounterY>=0 && CounterY<=480)
			|| (CounterX>=204 && CounterX <= 319 && CounterY>=0 && CounterY<=480)
			|| (CounterX>=321 && CounterX <= 436 && CounterY>=0 && CounterY<=480)
			|| (CounterX>=444 && CounterX <= 559 && CounterY>=0 && CounterY<=480) ) ;
block  <= (( (CounterX>=196 && CounterX <= 204 )|| (CounterX>=436 && CounterX <= 444 ) )
			&&(( CounterY>=0+Positiony && CounterY<=20+Positiony)     ||(CounterY>=40+Positiony && CounterY<=60+Positiony)    ||( CounterY>=80+Positiony && CounterY<=100+Positiony)  
			||( CounterY>=120+Positiony &&CounterY<=140+Positiony)   ||( CounterY>=160+Positiony && CounterY<=180+Positiony)  ||( CounterY>=200+Positiony && CounterY<=220+Positiony) 
			||( CounterY>=240+Positiony && CounterY<=260+Positiony)  ||(CounterY>=280+Positiony && CounterY<=300+Positiony)   ||( CounterY>=320+Positiony && CounterY<=340+Positiony)  
			||( CounterY>=360+Positiony && CounterY<=380+Positiony)  ||( CounterY>=400+Positiony &&CounterY<=420+Positiony)   ||( CounterY>=440+Positiony && CounterY<=460+Positiony) ) ) ;

if((CounterX>=0) && (CounterX<=80))
			g1  <= ((((CounterX + (CounterY-Positiony/2))% 16 <= 5) ) && (CounterY >=0 ) && (CounterY<=480));
else if((CounterX>=559) && (CounterX<=640))
			g1  <= ((((CounterX + (CounterY-Positiony/2))% 16 <= 5) ) && (CounterY>=0) && (CounterY<=480));
else 
			g1<=0;
if(block==1)
	begin
	Map_R = 1;
	Map_G = 1;
	Map_B = 1;
	end
else
	begin
	Map_R = ( Road   )& ~Border;
	Map_G = ( Road |g1 )& ~Border ;
	Map_B = ( Road | block  ) & ~Border ;
	end

end

endmodule
