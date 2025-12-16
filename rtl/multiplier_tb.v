`timescale 1ns / 1ps

module multiplier_tb();
    reg clk, start;
    reg [7:0] data_in;
    wire [15:0] product;
    
    always #5 clk = ~clk;
    
    datapath dut1(clk, ldA, shiftA, clrA, ldQ, shiftQ, clrQ, clrff, ldM, addsub, ldcnt, decr,data_in,
    eqz, q0, qm1, product);
    
    control_path uut1(ldA, clrA, shiftA, ldQ, clrQ, shiftQ, ldM, clrff, addsub, 
                 start, eqz, 
                 decr, ldcnt, done, 
                 clk, q0, qm1);
                 
    initial 
    begin
        clk = 1'b0;
        // input 5 * 3 = 15 = 000F
        $monitor ($time, " M: %b", datapath.M);
        #3 start = 1'b1; data_in = 8'b00000101;
        #24 data_in = 8'b00000011;
        wait(done); start = 1'b0;
        $display("result : %b", datapath.product);
        
        // input 4 * 3 = 12 = 000C
        #3 start = 1'b1; data_in = 8'b00000100;
        #26 data_in = 8'b00000011;
        wait(done); start = 1'b0;
        $display("result : %b", datapath.product);
        
        // input -5 * 6 = -30 = FFE2
        #3 start = 1'b1; data_in = 8'b11111011;
        #26 data_in = 8'b00000110;
        wait(done); start = 1'b0;
        $display("result : %b", datapath.product);
        
        // input 12 * 13 = A8
        #3 start = 1'b1; data_in = 8'h0c;
        #26 data_in = 8'h0e;
        wait(done); start = 1'b0;
        $display("result : %b", datapath.product);
        
        #50 $finish;
    end

endmodule
