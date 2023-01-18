`include "fulladder.v"

module twobitadder(A, B, Cin, Sum, Cout);

input [1:0] A, B;
input Cin;

output [1:0] Sum;
output Cout;

wire w1;

full_adder add1(A[0], B[0], Cin, Sum[0], w1);
full_adder add2(A[1], B[1], w1, Sum[1], Cout);

endmodule

