`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:31 04/20/2016 
// Design Name: 
// Module Name:    Main 
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
module Main(clk, vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B,right,left,reset,start);
	input clk,right,left,reset,start;
	output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B ;
	wire inDisplayArea;
	wire [9:0] CounterX;
	wire [8:0] CounterY;
	wire Map_R, Map_G, Map_B,objr,objb,objg,block_r,block_g,block_b,block_r2,block_g2,block_b2;
	wire char_R,char_G,char_B;
	wire slow;
	wire [24:0]twofive;  
	wire positionx;
	wire check,Block1,dead,score,Block2;
	wire [3:0]data;
	wire [8:0]position;
	wire check1,check2,check3,check4,status;
	wire Oncollision,CheckPositionY,Oncollision2,CheckPositionY2;
	wire R_Score_on,G_Score_on,B_Score_on,R_Score_off,G_Score_off,B_Score_off;
	hvsync_generator syncgen(clk,vga_h_sync, vga_v_sync,inDisplayArea, CounterX, CounterY);
   Freq25 divider25(twofive,clk);
	slowclock divider(slow,clk);
	Random rand(slow,data);
	status menu(reset,start,dead,twofive,status);
	Scene show(scene_r,scene_b,scene_g,CounterX,CounterY,clk);
	Object character(CounterX,CounterY,objr,objg,objb,twofive,right,left,check,check1,check2,check3,check4,Oncollision,dead,reset);
	Map map1(twofive,CounterX,CounterY,Map_R,Map_G,Map_B);
	Block object_block1(CounterX,CounterY,block_r,block_g,block_b,twofive,Block1,position,check1,check2,check3,check4,Oncollision,CheckPositionY,reset);
	Generate_block block(data[1:0],position,check1,check2,check3,check4,CheckPositionY);
	DrawScore Draw(twofive,CheckPositionY,CounterX,CounterY,R_Score_on,G_Score_on,B_Score_on,R_Score_off,G_Score_off,B_Score_off,score,reset,dead);
	
	   reg R;
		reg G;
		reg B;
		always @(posedge clk)
			  begin
			if(status)
			begin
				if(check==1)
					begin 
					R = objr ;
					G = objg ;	
					B = objb ;			
					end
				else if(Block1)
					begin
					R = block_r;
					G = block_g;	
					B = block_b;		
					end
				else if(Block2)
					begin
					R = block_r2;
					G = block_g2;	
					B = block_b2;		
					end
				else if(score)
					begin
					R = R_Score_on|R_Score_off;
					G = G_Score_on|G_Score_off;	
					B = B_Score_on|B_Score_off;		
					end	
				else
					begin
					R = Map_R;
					G = Map_G;
					B = Map_B;
					end
				end 
			else 
					begin
						if(score)
						begin
							R = R_Score_on|R_Score_off;
							G = G_Score_on|G_Score_off;	
							B = B_Score_on|B_Score_off;		
						end	
						else
						begin
							R = scene_r;
							G = scene_g;
							B = scene_b;
						end
					end
			end
	reg vga_R, vga_G, vga_B;
		always @(posedge clk)
		begin
			 vga_R <= R & inDisplayArea ;
			 vga_G <= G & inDisplayArea ;
			 vga_B <= B & inDisplayArea ;
		end

//Map1 cr1(vga_R,vga_G,vga_B,CounterX,CounterY);

endmodule