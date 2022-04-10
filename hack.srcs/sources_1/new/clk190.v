`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 12:48:14 PM
// Design Name: 
// Module Name: clk190
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk190(
 input clk,
   input rst,
   output clk190
    );
    
    reg [18:0] clk_div;
    always@(posedge clk,posedge rst)
    begin
    if(rst==1)
    clk_div=0;
    else
    clk_div=clk_div+1;
    end
    
    assign clk190 = clk_div[18];
endmodule
