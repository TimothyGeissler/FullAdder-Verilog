//`include "twobitadder.v"

module twobitadder_tb;

wire [1:0] A, B;
wire Cin;

wire [1:0] Sum;
wire Cout; 

wire [2:0] result;
assign result = A + B + Cin;

twobitadder tba(A, B, Cin, Sum, Cout); //Instantiate module to test

integer i;
assign {Cin, A, B} = i[4:0]; //Cin = i[4], A = i[3:2], B = i[1:0]

initial begin
    $dumpfile("tba_wvfrm.vcd");
    $dumpvars(0, twobitadder_tb);
    for (i = 0; i < 32; i++) begin
        #20; //stabilize outputs for 20ns
        if ((Cout == result[2]) && (Sum == result[1:0])) begin
            $display("PASSED - A: %b, B: %b, Cin: %b --> Cout: %b, Sum: %b", A, B, Cin, Cout, Sum);
        end else begin
            $display("FAILED - A: %b, B: %b, Cin: %b --> Cout: %b, Sum: %b - EXPECTED: %b", A, B, Cin, Cout, Sum, result);
        end
    end
    $finish;
end

/*
for (A=2'b00; A<=2'b11; A=A+1) begin
    $display("%b", A[0]);
end*/


endmodule