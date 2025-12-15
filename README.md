# Booth-multiplier-verilog

This project implements a signed multiplier circuit in Verilog HDL using separate datapath and a controller for modular structure.
The design performs 8-bit signed multiplication using Booth's algorithm and has been verified with a testbench in vivado


## Booth's Algorithm:
Booth's algorithm is an efficient method for multiplying two binary numbers, it reduces the number of shift and add operations by taking two consecutive bits of the multiplier and deciding wheter to add or subtract the multiplicand into the partial product. It uses a registers **Accumulator**, **Q** and a flip flop **Qm1**, where a Accumulator holds the partial product, Q holds the multipllicand and Qm1 is loaded with the LSB of Q register. The algorithm is as follows:
1. Initialize **A** with 0, **Q** with multiplicand, **Qm1** with 0 and load the multiplier in a register **M**.
2. Check the value of {LSB of Q, Qm1}.
   - If the value is **01**, Add the value of M to A and store the result in A.
   - If the value is **10** , Subtract M from A and store the value in A.
   - If the value is **00** or **11**, proceed to the next step.
3. Arithmetically shift the combined value of {A, Q, Qm1} retaining the sign bit.
4. Repeat Step 2 and 3 for the number of bits in the multiplier.
5. The final product is the resulting value of the combined {A, Q} register.

## Datapath

