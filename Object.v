module Object(CounterX,CounterY,obj_R,obj_G,obj_B,clk,right,left,check,check1,check2,check3,check4,Oncollision,dead,reset);
input [9:0] CounterX;
input [8:0] CounterY;
input [24:0]clk,Oncollision,check1,check2,check3,check4;
output reg obj_R,obj_G,obj_B,dead;
output integer check;
input left,reset;
input right;
integer positionx,var;
reg ck;

integer Y ;
initial begin Y = 0 ; end
initial begin positionx = 0 ; end
initial begin dead = 1 ;end
initial begin var=55; end
always @( posedge clk[17] )
	begin

	if(!reset)
	begin  dead=1;
	end
	else if(Oncollision == 1 && check1==1)begin //1
	if(positionx >= -242 && positionx <= -154)
			    dead=0;
	end

	else if(Oncollision == 1 && check2==1)begin //2
	if(positionx >= -130 && positionx <= -29)	// First is -117 to -29
			    dead=0;
	end

	else if(Oncollision == 1 && check3==1 )begin  //3
	if(positionx >= -10 && positionx <= 78)	//8 9    8 to 96
			    dead=0;
	end

	else if(Oncollision == 1 && check4==1)begin  //4
	if(positionx >= 80 && positionx <= 135)	//133 to 221
			   dead=0;
	end

	 if(right == 0 && positionx <= 135 ) //135
			positionx = positionx+2;
	 else if(left == 0 && positionx  >=-255  )
			positionx = positionx-2;
	end

wire border = (CounterX[9:3]==0) || (CounterX[9:3]==79) || (CounterY[8:3]==0) || (CounterY[8:3]==59);

wire rectangular =  ((CounterX>=285+positionx ) && (CounterX<=365+positionx )&& (CounterY>=350  ) && (CounterY<=460));//ref point car

wire carBorder = (CounterX>=285+positionx+var)&& (CounterX<=290+positionx+var) && (CounterY>=375+Y) && (CounterY<=450+Y)
					  || (CounterX>=290+positionx+var)&& (CounterX<=295+positionx+var) && (CounterY>=370+Y) && (CounterY<=380+Y)
					  || (CounterX>=295+positionx+var)&& (CounterX<=300+positionx+var) && (CounterY>=360+Y) && (CounterY<=375+Y)
					  || (CounterX>=300+positionx+var)&& (CounterX<=310+positionx+var) && (CounterY>=355+Y) && (CounterY<=360+Y)
					  || (CounterX>=310+positionx+var)&& (CounterX<=325+positionx+var) && (CounterY>=350+Y) && (CounterY<=355+Y)
					  || (CounterX>=325+positionx+var)&& (CounterX<=340+positionx+var) && (CounterY>=350+Y) && (CounterY<=355+Y)
					  || (CounterX>=340+positionx+var)&& (CounterX<=350+positionx+var) && (CounterY>=355+Y) && (CounterY<=360+Y)
					  || (CounterX>=350+positionx+var)&& (CounterX<=355+positionx+var) && (CounterY>=360+Y) && (CounterY<=375+Y)
					  || (CounterX>=355+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=370+Y) && (CounterY<=380+Y)
					  || (CounterX>=360+positionx+var)&& (CounterX<=365+positionx+var) && (CounterY>=375+Y) && (CounterY<=450+Y)
					  || (CounterX>=290+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=450+Y) && (CounterY<=455+Y)
					  || (CounterX>=310+positionx+var)&& (CounterX<=325+positionx+var) && (CounterY>=375+Y) && (CounterY<=380+Y)
					  || (CounterX>=325+positionx+var)&& (CounterX<=340+positionx+var) && (CounterY>=375+Y) && (CounterY<=380+Y)
					  || (CounterX>=300+positionx+var)&& (CounterX<=310+positionx+var) && (CounterY>=380+Y) && (CounterY<=385+Y)
					  || (CounterX>=340+positionx+var)&& (CounterX<=350+positionx+var) && (CounterY>=380+Y) && (CounterY<=385+Y)
				     || (CounterX>=295+positionx+var)&& (CounterX<=300+positionx+var) && (CounterY>=385+Y) && (CounterY<=390+Y)
					  || (CounterX>=350+positionx+var)&& (CounterX<=355+positionx+var) && (CounterY>=385+Y) && (CounterY<=390+Y)
					  || (CounterX>=290+positionx+var)&& (CounterX<=295+positionx+var) && (CounterY>=390+Y) && (CounterY<=395+Y)
					  || (CounterX>=355+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=390+Y) && (CounterY<=395+Y)
					  || (CounterX>=300+positionx+var)&& (CounterX<=350+positionx+var) && (CounterY>=405+Y) && (CounterY<=410+Y)
					  || (CounterX>=295+positionx+var)&& (CounterX<=300+positionx+var) && (CounterY>=410+Y) && (CounterY<=415+Y)
					  || (CounterX>=350+positionx+var)&& (CounterX<=355+positionx+var) && (CounterY>=410+Y) && (CounterY<=415+Y)
					  || (CounterX>=355+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=415+Y) && (CounterY<=420+Y)
					  || (CounterX>=290+positionx+var)&& (CounterX<=295+positionx+var) && (CounterY>=415+Y) && (CounterY<=420+Y)
					  || (CounterX>=345+positionx+var)&& (CounterX<=355+positionx+var) && (CounterY>=450+Y) && (CounterY<=460+Y)
					  || (CounterX>=295+positionx+var)&& (CounterX<=305+positionx+var) && (CounterY>=450+Y) && (CounterY<=460+Y);

wire insideCar = ((CounterX>=290+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=420+Y) && (CounterY<=450+Y) //btm
            ||(CounterX>=320+positionx+var) && (CounterX<=330+positionx+var) && (CounterY>=355+Y) && (CounterY<=360+Y)//mirrorblue
					  || (CounterX>=295+positionx+var)&& (CounterX<=355+positionx+var) && (CounterY>=410+Y) && (CounterY<=420+Y)//btm
					  || (CounterX>=290+positionx+var)&& (CounterX<=295+positionx+var) && (CounterY>=385+Y) && (CounterY<=390+Y)//Troof
					  || (CounterX>=355+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=385+Y) && (CounterY<=390+Y)//Troof
					  || (CounterX>=290+positionx+var)&& (CounterX<=300+positionx+var) && (CounterY>=380+Y) && (CounterY<=385+Y)//Troof
					  || (CounterX>=350+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=380+Y) && (CounterY<=385+Y)//Troof
					  || (CounterX>=290+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=375+Y) && (CounterY<=380+Y)//Troof
					  || (CounterX>=300+positionx+var)&& (CounterX<=350+positionx+var) && (CounterY>=360+Y) && (CounterY<=375)+Y);//Troof

wire mirror = 	((CounterX>=290+positionx+var)&& (CounterX<=300+positionx+var) && (CounterY>=405+Y) && (CounterY<=415+Y)//roof
			        || (CounterX>=355+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=410+Y) && (CounterY<=420+Y)//roof
					  || (CounterX>=350+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=400+Y) && (CounterY<=410+Y)//roof
					  || (CounterX>=290+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=390+Y) && (CounterY<=400+Y)//roof
					  || (CounterX>=290+positionx+var)&& (CounterX<=360+positionx+var) && (CounterY>=400+Y) && (CounterY<=405+Y)//roof
					  || (CounterX>=300+positionx+var)&& (CounterX<=350+positionx+var) && (CounterY>=380+Y) && (CounterY<=390+Y));

wire light =   ((CounterX>=310+positionx+var)&& (CounterX<=320+positionx+var) && (CounterY>=355+Y) && (CounterY<=360+Y)
					  ||(CounterX>=330+positionx+var)&& (CounterX<=340+positionx+var) && (CounterY>=355+Y) && (CounterY<=360+Y) );


always @(clk)
begin
if(carBorder==1)
	begin
			obj_R = 0;
		obj_G = 0;
		obj_B = 0;
		check =1;
	end
else if(insideCar)
	begin
		obj_R = 0;
		obj_G = 1;
		obj_B = 0;
		check=1;
	end
else if(mirror)
	begin
		obj_R = 0;
		obj_G = 0;
		obj_B = 1;
		check=1;
	end
else if(light)
	begin
		obj_R = 1;
		obj_G = 1;
		obj_B = 0;
		check=1;
	end
else
check=0;
/*begin
		obj_R <= carBorder; // || wheel;
		obj_G <= carBorder;//|| wheel;
		obj_B <= 0; // || wheel;
		check <= (obj_R|obj_G|obj_B );
	end*/
end
endmodule
