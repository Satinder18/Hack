`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2021 04:01:27 PM
// Design Name: 
// Module Name: hack_control
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


module hack_control(
    input clk,
    input rst,
    input start,
    input [15:0]ans,
    output reg [15:0] datain,
    output reg enx,
    output reg eny,
    output reg eno,
    output reg zx,
    output reg zy,
    output reg clro,
    output reg nx,
    output reg ny,
    output reg no,
    output reg f,
    output reg ena, //ram control
    output reg wea,
    output reg [1:0] addra,
    output reg [15:0] ramdina, 
    input[15:0] douta
    );
    
    reg [15:0]temp;
    reg [3:0]prst,nxst;
    parameter s0=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,s4=4'b0100,s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000;
    
    //state register
    always@(posedge start,posedge rst)
    begin 
    if(rst)
    prst=s0;
    else
    prst=nxst;
    end
    
    //next state logic
    always@(*)
    begin
    case(prst)
    s0: nxst=s1;
    s1: nxst=s2;
    s2: nxst=s3;
    s3: nxst=s4;
    s4: #2 nxst=s5;
    s5: nxst=s6;
    s6: #5 nxst=s0;
    default: nxst=s0;
    endcase
    end
    
    always@(*)
    begin
    case(prst)
    s0:    //initial state
    begin 
     datain=0;
     enx=0;
     eny=0;
     eno=0;
     zx=0;
     zy=0;
     clro=0;
     nx=0;
     ny=0;
     no=0;
     f=0;
     ena=0; //ram control
     wea=0;
     addra=0;
     ramdina=0;
    end
    s1:   //fetch 1st data from ram ie control bit from addr 0 and put it in temp variable
    begin
    datain=0;
    temp=douta;
    enx=0;
    eny=0;
    eno=0;
    zx=temp[0];
    zy=temp[2];
    clro=0;
    nx=temp[1];
    ny=temp[3];
    no=temp[5];
    f=temp[4];
    ena=1; //ram control
    wea=0;
    addra=2'b00;
    ramdina=0;
    end
    s2:     //load the first data in A register from adddr 1
    begin
        datain=douta;
        enx=1;
        eny=0;
        eno=0;
        zx=temp[0];
        zy=temp[2];
        clro=1;
        nx=temp[1];
        ny=temp[3];
        no=temp[5];
        f=temp[4];
        ena=1; //ram control
        wea=0;
        addra=2'b01;
        ramdina=0;
        end   
     s3:      //load the 2nd data in B register from adddr 2
         begin
         datain=douta;
         enx=0;
         eny=1;
         eno=0;
         zx=temp[0];
         zy=temp[2];
         clro=1;
         nx=temp[1];
         ny=temp[3];
         no=temp[5];
         f=temp[4];
         ena=1; //ram control
         wea=0;
         addra=2'b10;
         ramdina=0;
         end       
      s4:         //compute the result
      begin
               datain=0;
               enx=0;
               eny=0;
               eno=0;
               zx=temp[0];
               zy=temp[2];
               clro=0;
               nx=temp[1];
               ny=temp[3];
               no=temp[5];
               f=temp[4];
               ena=0; //ram control
               wea=0;
               addra=2'b11;
               ramdina=0;
          end   
      s5: //storer result in o register
      begin
               datain=0;
               enx=0;
               eny=0;
               eno=1;
               zx=temp[0];
               zy=temp[2];
               clro=0;
               nx=temp[1];
               ny=temp[3];
               no=temp[5];
               f=temp[4];
               ena=0; //ram control
               wea=0;
               addra=2'b11;
               ramdina=0;
          end
      s6: //store result in ram at addr 3
            begin
               datain=0;
               enx=0;
               eny=0;
               eno=1;
               zx=temp[0];
               zy=temp[2];
               clro=0;
               nx=temp[1];
               ny=temp[3];
               no=temp[5];
               f=temp[4];
               ena=1; //ram control
               wea=1;
               addra=2'b11;
               ramdina=ans;
               end
    endcase
    end
endmodule
