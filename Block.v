`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:55:54 04/27/2016 
// Design Name: 
// Module Name:    Block 
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
module Block(CounterX,CounterY,obj_R,obj_G,obj_B,clk,check,var1,check1,check2,check3,check4,Oncollision,CheckPositionY,reset);
input [9:0] CounterX;
input [8:0] CounterY;
input [24:0]clk;
input check1,check2,check3,check4,reset;
input [8:0]var1;

output reg obj_R,obj_G,obj_B,check,Oncollision,CheckPositionY;

integer Position;
always @ (posedge clk[17]  )
begin
 if(!reset)
	begin
   Position<=0;
	CheckPositionY <= 0;
	end	
else if (Position == 480) begin
		Position <= 0;
		CheckPositionY <= 1;
		end
else if(Position>=300 && Position < 470)begin
		Oncollision <= 1;	// range of position Y is the same as car//445
		Position <= Position + 3;
	end	
else  begin
		Oncollision <= 0; 
		Position <= Position + 3;
		CheckPositionY <= 0;
end		
end

		wire Obs = check1 && (((CounterX>=113+0) && (CounterX <= 161+0) && (CounterY >= 302+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=109+0) && (CounterX <= 113+0) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=161+0) && (CounterX <= 165+0) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=113+0) && (CounterX <= 161+0) && (CounterY >= 282+Position-250) && (CounterY <= 290+Position-250) 
		              || (CounterX>=93+0)  && (CounterX <= 109+0) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=97+0)  && (CounterX <= 109+0) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=101+0) && (CounterX <= 109+0) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=105+0) && (CounterX <= 109+0) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=165+0) && (CounterX <= 181+0) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=165+0) && (CounterX <= 177+0) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=165+0) && (CounterX <= 173+0) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=165+0) && (CounterX <= 169+0) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=105+0) && (CounterX <= 109+0) && (CounterY >= 294+Position-250) && (CounterY <= 298+Position-250) 
		              || (CounterX>=165+0) && (CounterX <= 169+0) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250)
		              || (CounterX>=113+0) && (CounterX <= 117+0) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250)  
		              || (CounterX>=157+0) && (CounterX <= 161+0) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250) 
		              || (CounterX>=117+0) && (CounterX <= 157+0) && (CounterY >= 290+Position-250) && (CounterY <= 294+Position-250) 
		              || (CounterX>=117+0) && (CounterX <= 121+0) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250) 
		              || (CounterX>=153+0) && (CounterX <= 157+0) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250)
		              || (CounterX>=121+0) && (CounterX <= 125+0) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=149+0) && (CounterX <= 153+0) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=125+0) && (CounterX <= 149+0) && (CounterY >= 262+Position-250) && (CounterY <= 270+Position-250)
		              || (CounterX>=129+0) && (CounterX <= 145+0) && (CounterY >= 254+Position-250) && (CounterY <= 262+Position-250)
		            || (CounterX>=133+0) && (CounterX <= 141+0) && (CounterY >= 250+Position-250) && (CounterY <= 254+Position-250)));

		wire Obs1 = check2 && (((CounterX>=113+125) && (CounterX <= 161+125) && (CounterY >= 302+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=109+125) && (CounterX <= 113+125) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=161+125) && (CounterX <= 165+125) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=113+125) && (CounterX <= 161+125) && (CounterY >= 282+Position-250) && (CounterY <= 290+Position-250) 
		              || (CounterX>=93+125)  && (CounterX <= 109+125) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=97+125)  && (CounterX <= 109+125) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=101+125) && (CounterX <= 109+125) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=105+125) && (CounterX <= 109+125) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=165+125) && (CounterX <= 181+125) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=165+125) && (CounterX <= 177+125) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=165+125) && (CounterX <= 173+125) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=165+125) && (CounterX <= 169+125) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=105+125) && (CounterX <= 109+125) && (CounterY >= 294+Position-250) && (CounterY <= 298+Position-250) 
		              || (CounterX>=165+125) && (CounterX <= 169+125) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250)
		              || (CounterX>=113+125) && (CounterX <= 117+125) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250)  
		              || (CounterX>=157+125) && (CounterX <= 161+125) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250) 
		              || (CounterX>=117+125) && (CounterX <= 157+125) && (CounterY >= 290+Position-250) && (CounterY <= 294+Position-250) 
		              || (CounterX>=117+125) && (CounterX <= 121+125) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250) 
		              || (CounterX>=153+125) && (CounterX <= 157+125) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250)
		              || (CounterX>=121+125) && (CounterX <= 125+125) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=149+125) && (CounterX <= 153+125) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=125+125) && (CounterX <= 149+125) && (CounterY >= 262+Position-250) && (CounterY <= 270+Position-250)
		              || (CounterX>=129+125) && (CounterX <= 145+125) && (CounterY >= 254+Position-250) && (CounterY <= 262+Position-250)
		            || (CounterX>=133+125) && (CounterX <= 141+125) && (CounterY >= 250+Position-250) && (CounterY <= 254+Position-250)));


		wire Obs2 = check3 && (((CounterX>=113+240) && (CounterX <= 161+240) && (CounterY >= 302+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=109+240) && (CounterX <= 113+240) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=161+240) && (CounterX <= 165+240) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=113+240) && (CounterX <= 161+240) && (CounterY >= 282+Position-250) && (CounterY <= 290+Position-250) 
		              || (CounterX>=93+240)  && (CounterX <= 109+240) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=97+240)  && (CounterX <= 109+240) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=101+240) && (CounterX <= 109+240) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=105+240) && (CounterX <= 109+240) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=165+240) && (CounterX <= 181+240) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=165+240) && (CounterX <= 177+240) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=165+240) && (CounterX <= 173+240) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=165+240) && (CounterX <= 169+240) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=105+240) && (CounterX <= 109+240) && (CounterY >= 294+Position-250) && (CounterY <= 298+Position-250) 
		              || (CounterX>=165+240) && (CounterX <= 169+240) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250)
		              || (CounterX>=113+240) && (CounterX <= 117+240) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250)  
		              || (CounterX>=157+240) && (CounterX <= 161+240) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250) 
		              || (CounterX>=117+240) && (CounterX <= 157+240) && (CounterY >= 290+Position-250) && (CounterY <= 294+Position-250) 
		              || (CounterX>=117+240) && (CounterX <= 121+240) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250) 
		              || (CounterX>=153+240) && (CounterX <= 157+240) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250)
		              || (CounterX>=121+240) && (CounterX <= 125+240) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=149+240) && (CounterX <= 153+240) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=125+240) && (CounterX <= 149+240) && (CounterY >= 262+Position-250) && (CounterY <= 270+Position-250)
		              || (CounterX>=129+240) && (CounterX <= 145+240) && (CounterY >= 254+Position-250) && (CounterY <= 262+Position-250)
		            || (CounterX>=133+240) && (CounterX <= 141+240) && (CounterY >= 250+Position-250) && (CounterY <= 254+Position-250)));				


		wire Obs3 = check4 && (((CounterX>=113+365) && (CounterX <= 161+365) && (CounterY >= 302+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=109+365) && (CounterX <= 113+365) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=161+365) && (CounterX <= 165+365) && (CounterY >= 290+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=113+365) && (CounterX <= 161+365) && (CounterY >= 282+Position-250) && (CounterY <= 290+Position-250) 
		              || (CounterX>=93+365)  && (CounterX <= 109+365) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=97+365)  && (CounterX <= 109+365) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=101+365) && (CounterX <= 109+365) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=105+365) && (CounterX <= 109+365) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=165+365) && (CounterX <= 181+365) && (CounterY >= 298+Position-250) && (CounterY <= 306+Position-250) 
		              || (CounterX>=165+365) && (CounterX <= 177+365) && (CounterY >= 306+Position-250) && (CounterY <= 310+Position-250) 
		              || (CounterX>=165+365) && (CounterX <= 173+365) && (CounterY >= 310+Position-250) && (CounterY <= 314+Position-250) 
		              || (CounterX>=165+365) && (CounterX <= 169+365) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250) 
		              || (CounterX>=105+365) && (CounterX <= 109+365) && (CounterY >= 294+Position-250) && (CounterY <= 298+Position-250) 
		              || (CounterX>=165+365) && (CounterX <= 169+365) && (CounterY >= 314+Position-250) && (CounterY <= 318+Position-250)
		              || (CounterX>=113+365) && (CounterX <= 117+365) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250)  
		              || (CounterX>=157+365) && (CounterX <= 161+365) && (CounterY >= 298+Position-250) && (CounterY <= 302+Position-250) 
		              || (CounterX>=117+365) && (CounterX <= 157+365) && (CounterY >= 290+Position-250) && (CounterY <= 294+Position-250) 
		              || (CounterX>=117+365) && (CounterX <= 121+365) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250) 
		              || (CounterX>=153+365) && (CounterX <= 157+365) && (CounterY >= 274+Position-250) && (CounterY <= 282+Position-250)
		              || (CounterX>=121+365) && (CounterX <= 125+365) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=149+365) && (CounterX <= 153+365) && (CounterY >= 266+Position-250) && (CounterY <= 274+Position-250)
		              || (CounterX>=125+365) && (CounterX <= 149+365) && (CounterY >= 262+Position-250) && (CounterY <= 270+Position-250)
		              || (CounterX>=129+365) && (CounterX <= 145+365) && (CounterY >= 254+Position-250) && (CounterY <= 262+Position-250)
		              || (CounterX>=133+365) && (CounterX <= 141+365) && (CounterY >= 250+Position-250) && (CounterY <= 254+Position-250)));				



always @(clk)
begin 
		obj_R = Obs2 | Obs | Obs1 | Obs3;
		obj_G = 0;
		obj_B = 0 ;
		check= obj_R|obj_G|obj_B;
end


endmodule