`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 12:43:56 PM
// Design Name: 
// Module Name: dbounce
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


module dbounce(
    input clk,
    input din,
    input rst,
    output dout
    );
    reg A,B,C;
        always@(posedge clk,posedge rst)
        begin 
        if (rst==1)
        begin
        A<=0;
        B<=0;
        C<=0;
        end
        else
        begin
        A<=din;
        B<=A;
        C<=B;
        end
        end
        
        assign dout= A & B & ~C;
    
endmodule
