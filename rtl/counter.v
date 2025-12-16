`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 07:16:08 PM
// Design Name: 
// Module Name: counter
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


module counter(
    output reg [3:0] count, 
    input decr, ldcnt, clk
    );
    
    always @(posedge clk)
    begin
        if(ldcnt) count <= 4'b1000;
        else if(decr) count <= count - 1;
    end
    
endmodule
