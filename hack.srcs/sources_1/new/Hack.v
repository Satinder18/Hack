`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2021 12:17:47 PM
// Design Name: 
// Module Name: Hack
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


module Hack(
    input clk,
    input rst,
    input start
    //output [15:0] ans
    );
    wire enx,eny,eno,zx,zy,clro,nx,ny,no,f,ena,wea,clk190,dstart;
    wire[1:0] addra;
    wire [15:0]bus,ramdina,douta,ans;//,ans
    
    hack_control t1(clk,rst,dstart,ans,bus,enx,eny,eno,zx,zy,clro,nx,ny,no,f,ena,wea,addra,ramdina,douta);
    hack_datapath t2(clk,rst,bus,enx,eny,eno,zx,zy,clro,nx,ny,no,f,ans);
    blk_mem_gen_0 t3(clk,ena,wea,addra,ramdina,douta);
    vio_0 t4(clk,douta,ans);//,ena,wea,addra,ramdina);
    clk190 t5(clk,rst,clk190);
    dbounce t6(clk190,start,rst,dstart);
endmodule
