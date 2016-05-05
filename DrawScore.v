`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:17:51 04/23/2014 
// Design Name: 
// Module Name:    DrawScore 
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

module DrawScore(clk,CheckPositionY,CounterX,CounterY,R_Score_on,G_Score_on,B_Score_on,R_Score_off,G_Score_off,B_Score_off,check,reset,dead);

reg [15:0] ScorePositionX = 320;
reg [15:0] ScorePositionY = 50;
input [9:0] CounterX;
input [8:0] CounterY;
input CheckPositionY,reset,dead;
input [24:0]clk;
output reg R_Score_on,G_Score_on,B_Score_on,R_Score_off,G_Score_off,B_Score_off,check;

integer Ten = 0;
integer Unit = 0;
integer p_y=1;
reg ZeroBlack,ZeroWhite,OneBlack,OneWhite,TwoBlack,TwoWhite,ThreeBlack,ThreeWhite,FourBlack,FourWhite,FiveBlack,FiveWhite,SixBlack,SixWhite,SevenBlack,SevenWhite,EightBlack,EightWhite,NineBlack,NineWhite;
reg ScoreWhiteUnit,ScoreBlackUnit,ScoreWhiteTen,ScoreBlackTen;

always @ (posedge clk[17] )
begin
ScorePositionX <= 320;
ScorePositionY <= 20;
if (CheckPositionY == 1 && p_y)
			begin
			if (Unit == 9)
				begin
					Ten <= Ten + 1;
					Unit <= 0;
				end
			else if (Ten == 10)
				begin  Ten <= 0; Unit <= Unit + 1; end
			else
				begin		Unit <= Unit + 1;end
			end
else if (!reset)
	begin
		ScorePositionX <= 320;
		ScorePositionY <= 50;
		Ten <= 0;
		Unit <= 0;
		p_y = 1;
	end
else if(!dead)
	begin
		ScorePositionY <= 380;
		p_y = 0 ;
end

end

always @ (CounterX or CounterY)
begin

case (Unit)
0 : begin

ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteUnit <=  (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||	    (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

end
1 : begin

ScoreBlackUnit <= (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+3*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+2*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+7*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteUnit <=  (CounterX>=ScorePositionX+3+3*3) && (CounterX<=ScorePositionX+3+7*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+7*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);

end
2 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
3 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////
end
4 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+6*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)

||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+6*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////////
end
5 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
6 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
7 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||	    (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);
end
8 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
9 : begin
ScoreBlackUnit <= (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+8*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX+3+0*3) && (CounterX<=ScorePositionX+3+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteUnit <= (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX+3+5*3) && (CounterX<=ScorePositionX+3+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+1*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX+3+4*3) && (CounterX<=ScorePositionX+3+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3);

end
endcase

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (Ten > 0)
case (Ten)
0 : begin

ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteTen <=  (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+10*3)

||	    (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

end
1 : begin

ScoreBlackTen <= (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+3*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+2*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+7*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);

ScoreWhiteTen <=  (CounterX>=ScorePositionX-30+3*3) && (CounterX<=ScorePositionX-30+7*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+7*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);

end
2 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
3 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////
end
4 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+6*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)

||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)

||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)

||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);


ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+6*3) && (CounterY<=ScorePositionY+9*3)

||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3);

////////////////////////////////////////
end
5 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
6 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
7 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||	    (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+13*3);
end
8 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3);
end
9 : begin
ScoreBlackTen <= (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+0*3) && (CounterY<=ScorePositionY+1*3)
||          (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+1*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+8*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+4*3) && (CounterY<=ScorePositionY+5*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+9*3) && (CounterY<=ScorePositionY+10*3)
||	    (CounterX>=ScorePositionX-30+0*3) && (CounterX<=ScorePositionX-30+9*3) && (CounterY>=ScorePositionY+13*3) && (CounterY<=ScorePositionY+14*3);
ScoreWhiteTen <= (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+4*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+9*3)
||          (CounterX>=ScorePositionX-30+5*3) && (CounterX<=ScorePositionX-30+8*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+1*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+10*3) && (CounterY<=ScorePositionY+13*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+1*3) && (CounterY<=ScorePositionY+4*3)
||          (CounterX>=ScorePositionX-30+4*3) && (CounterX<=ScorePositionX-30+5*3) && (CounterY>=ScorePositionY+5*3) && (CounterY<=ScorePositionY+9*3);

end
endcase

R_Score_on =    ScoreWhiteUnit | ScoreWhiteTen;
G_Score_on =	 0;
B_Score_on =	 ScoreWhiteUnit | ScoreWhiteTen;

R_Score_off =  ScoreBlackUnit | ScoreBlackTen;
G_Score_off =  ScoreBlackUnit | ScoreBlackTen;
B_Score_off =  ScoreBlackUnit | ScoreBlackTen;

check = R_Score_on |G_Score_on|B_Score_on|R_Score_off|G_Score_off|B_Score_off;
end
endmodule