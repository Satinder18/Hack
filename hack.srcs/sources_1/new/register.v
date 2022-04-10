`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 09:39:31 PM
// Design Name: 
// Module Name: register
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


module register(
    input clk,
    input rst,
    input zx,
    input en,
    input [15:0] din,
    output reg[15:0] x
    );
    always@(posedge clk)
    begin
    if(rst || zx)
    x <=16'b0;
    else
    begin
    
    if(en)
    begin
    
    if(zx)
    x =16'b0;
    else
    x=din;
    
    end
    end
    end
endmodule
