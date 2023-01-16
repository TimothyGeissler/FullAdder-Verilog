module full_adder_tb;

reg A, B, Cin; //input regs
wire Sum, Cout; //Output wires

wire[1:0] result;
assign result = A + B + Cin; //result[1] == Cout, result[0] = Sum

//Instantiate module to test
full_adder adder(
    .A(A), 
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout));

//Init reg inputs
initial begin
    $dumpfile("fulladder_wvfrm.vcd");
    $dumpvars(0, full_adder_tb);
    A = 0;
    B = 0;
    Cin = 0;
    #80 //delay 80ns
    $finish;
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
    if ((Sum == result[0]) && (Cout == result[1])) begin // Compare outputs to expected results
        $display("PASSED - A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b", A, B, Cin, Sum, Cout);
    end else begin
        $display("FAILED - A: %b, B: %b, Cin: %b, Sum: %b, Cout: %b => EXPECTED - Sum: %b, Cout: %b", A, B, Cin, Sum, Cout, result[0], result[1]);
    end
    
end

endmodule