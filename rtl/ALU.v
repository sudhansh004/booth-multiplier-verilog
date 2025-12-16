`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 07:13:15 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    output reg [7:0] Z, 
    input [7:0] in1, in2, 
    input addsub
    );
    
    always@(*)
    begin
        if(addsub) Z = in1 + in2;
        else Z = in1 - in2;
    end
    
endmodule
