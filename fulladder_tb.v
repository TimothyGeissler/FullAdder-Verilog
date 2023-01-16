module full_adder_tb;

reg A, B, Cin; //input regs
wire Sum, Cout; //Output wires

//Instantiate module to test
full_adder adder(
    .A(A), 
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout));

//Init reg inputs
initial begin
    A = 0;
    B = 0;
    Cin = 0;
    #80 //delay 80ns
    $finish
end

 //Manipulate inputs (toggle @ different intervals indefinitely)
always begin
     #10 A =~ A;
end

always begin
    #20 B =~ B;
end

always begin
    #40 Cin =~ Cin;
end

//Display results whenever A, B, Cin change
always @(A, B, Cin) begin
    #1; //Small delay for lines to stabilize
    $display("A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b");
end

endmodule