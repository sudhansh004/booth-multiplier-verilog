`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 07:00:20 PM
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(
        output reg [7:0] data_out, 
        input [7:0] data_in, 
        input s_in, clk, ld, clr, shift
    );
    
    always @(posedge clk)
    begin
        if(clr)
            data_out <= 8'b0;
        else if(ld)
            data_out <= data_in;
        else if(shift)
            data_out <= {s_in, data_out[7:1]};
    end
    
endmodule
