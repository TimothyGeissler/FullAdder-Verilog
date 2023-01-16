/*
Full Adder model in Verilog w/ testbench.
Compile with: iverilog -wimplicit -c filelist.txt -o fulladder.vvp 
*/
module full_adder(A, B, Cin, Sum, Cout);

input A, B, Cin;
output Sum, Cout;
wire w1, w2, w3; //wires needed other than inputs/outputs

// create gates
xor sumXOR(Sum, A, B, Cin); //(output, inputs)
and AND1(w1, A, B);
and AND2(w2, A, Cin);
and AND3(w3, B, Cin);
or coutOR(Cout, w1, w2, w3);


endmodule