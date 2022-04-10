`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2021 05:21:10 AM
// Design Name: 
// Module Name: test_lock
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


module hack_test(

    );
    
    wire [15:0] ans;
    reg start,clk,rst;
    
    Hack t1(clk,rst,start,ans);
    initial begin
    clk=0;
    repeat(40) #2 clk=~clk;
    $finish;
    end
    
    initial begin
    rst=1;
    #5 
    rst=0;
    start=1;
    #3
    start=0;
    end
    
    endmodule