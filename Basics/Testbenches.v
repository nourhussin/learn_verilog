`timescale 1ns/1ns
`include "Basics/Wires.v"

module Testbenches ; // it's better to call your file and module as Wires_tb.v
    reg in;  // The inputs of wires module is defined as reg, because we'll change its values
    wire out; // We don't need to define it as reg, because we need only to show the ouput

    //! instantiat a Unit Under Test of your module
    Wires UUT(
        .in(in),
        .out(out)
    );
    localparam T = 10;

    // If I need a clock
    /* 
    initial begin
        clk = 0;
        forever begin
            #(T/2); clk = !clk;
        end
    end
    */

    initial begin
        $dumpfile("Testbenches.vcd");
        $dumpvars(0,Testbenches); // These two lines because I'm using iverilog 

        in = 1;
        #T;

        in = 0;
        #T;

        in = 1;
        #T;

        $finish;

    end
endmodule