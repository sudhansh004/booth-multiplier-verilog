`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 07:21:28 PM
// Design Name: 
// Module Name: control_path
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


module control_path(
    output reg ldA, clrA, shiftA, ldQ, clrQ, shiftQ, ldM, clrff, addsub, 
    input start, eqz, 
    output reg decr, ldcnt, done, 
    input clk, q0, qm1
    );
    
    reg [2:0] state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
    
    always@(posedge clk)
    begin
        case(state)
            S0 : if(start) state <= S1;
            S1 : state <= S2;
            S2 : #2 if({q0, qm1} == 2'b01) state <= S3;
                    else if({q0, qm1} == 2'b10) state <= S4;
                    else state <= S5;
            S3 : state <= S5;
            S4 : state <= S5;
            S5 : #2 if(({q0, qm1} == 2'b01) && !eqz) state <= S3;
                    else if(({q0, qm1} == 2'b10) && !eqz) state <= S4;
                    else if(eqz) state <= S6;
            S6 : state <= S0;
            default : state <= S0;
         endcase
     end 
     
     always @(state)
     begin
        case(state)
            S0 : begin clrA = 0;
                       clrQ = 0; 
                       ldA = 0;
                       shiftA = 0; 
                       clrQ = 0; 
                       ldQ = 0; 
                       shiftQ = 0; 
                       ldM = 0; 
                       clrff = 0; 
                       done = 0; end
            S1 : begin clrA = 1; 
                       clrff = 1;
                       clrQ = 1; 
                       ldcnt = 1; 
                       ldM = 1; end
            S2 : begin clrA = 0; 
                       clrff = 0; 
                       clrQ = 0;
                       ldcnt = 0; 
                       ldM = 0; 
                       ldQ = 1; end
            S3 : begin ldA = 1; 
                       addsub = 1; 
                       ldQ = 0; 
                       shiftA = 0; 
                       shiftQ = 0; 
                       decr = 0; end
            S4 : begin ldA = 1; 
                       addsub = 0; 
                       ldQ = 0; 
                       shiftA = 0; 
                       shiftQ = 0; 
                       decr = 0; end  
            S5 : begin shiftA = 1; 
                       shiftQ = 1; 
                       ldA = 0; 
                       ldQ = 0; 
                       decr = 1; end
            S6 : begin done = 1; 
                       shiftA = 0; 
                       shiftQ = 0;
                       decr = 0; end
            default : begin clrA = 0; 
                            shiftA = 0; 
                            ldQ = 0; 
                            shiftQ = 0; end
         endcase  
                   
     end
     
    
    
endmodule

