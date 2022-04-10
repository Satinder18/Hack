`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 10:08:19 PM
// Design Name: 
// Module Name: fun
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


module fun(
    input clk,
    input[15:0] x,
    input[15:0] y,
    input f,
    output reg [15:0]funo
    );
    
    always@(posedge clk)
    begin
    if(f)
    funo<=x+y;
    else
    funo<=x&y;
    end
endmodule
