`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:02 04/29/2016 
// Design Name: 
// Module Name:    Random 
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
module Random(clk,data);
  input  clk;
  output reg [3:0] data=4'b1111;

wire feedback = data[3] ^ data[0] ;

always @(posedge clk)
    data <= {data[3:0], feedback} ;

endmodule

