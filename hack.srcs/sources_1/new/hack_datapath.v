`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 09:30:41 PM
// Design Name: 
// Module Name: hack_datapath
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


module hack_datapath(
    input clk,
    input rst,
    input [15:0] datain,
    input enx,
    input eny,
    input eno,
    input zx,
    input zy,
    input clro,
    input nx,
    input ny,
    input no,
    input f,
    output[15:0] ans
    );
    wire [15:0]x,xbar,y,ybar,outa,outb,fo,fobar,out;
    register A(clk,rst,zx,enx,datain,x);
    register B(clk,rst,zy,eny,datain,y);
    mux a(clk,nx,x,outa);
    mux b(clk,ny,y,outb);
    fun t1(clk,outa,outb,f,fo);
    mux f1(clk,no,fo,out);
    register O(clk,rst,clro,eno,out,ans);
endmodule
