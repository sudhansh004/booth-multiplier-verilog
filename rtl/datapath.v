`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2025 06:47:08 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input clk, ldA, shiftA, clrA, ldQ, shiftQ, clrQ, clrff, ldM, addsub, ldcnt, decr,
    input [7:0] data_in,
    output eqz, q0, qm1, 
    output [15:0] product
    );
    
    wire [7:0] A, M, Z, Q;
    wire [3:0] count;
    assign eqz = ~|count;
    assign product = {A, Q};
    assign q0 = Q[0];
    
    shiftreg AR(A, Z, A[7], clk, ldA, clrA, shiftA);
    shiftreg QR(Q, data_in, A[0], clk, ldQ, clrQ, shiftQ);
    PIPO MR(data_in, M, clk, ldM);
    dff Qm1(Q[0], qm1, clk, clrff);
    ALU AS(Z, A, M, addsub);
    counter CR(count, decr, ldcnt, clk);
    
    
    
    
endmodule
