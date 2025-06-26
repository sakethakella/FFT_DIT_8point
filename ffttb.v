// Testbench for 8-point Radix-2 DIT FFT Engine (Q1.15, Verilog)
`timescale 1ns/1ps

module ffttb;
    reg clk, rst;
    reg signed [15:0] x_real_0, x_imag_0;
    reg signed [15:0] x_real_1, x_imag_1;
    reg signed [15:0] x_real_2, x_imag_2;
    reg signed [15:0] x_real_3, x_imag_3;
    reg signed [15:0] x_real_4, x_imag_4;
    reg signed [15:0] x_real_5, x_imag_5;
    reg signed [15:0] x_real_6, x_imag_6;
    reg signed [15:0] x_real_7, x_imag_7;
    wire signed [15:0] X_real_0, X_imag_0;
    wire signed [15:0] X_real_1, X_imag_1;
    wire signed [15:0] X_real_2, X_imag_2;
    wire signed [15:0] X_real_3, X_imag_3;
    wire signed [15:0] X_real_4, X_imag_4;
    wire signed [15:0] X_real_5, X_imag_5;
    wire signed [15:0] X_real_6, X_imag_6;
    wire signed [15:0] X_real_7, X_imag_7;

    // Instantiate the FFT module
    fft_8point uut (
        .clk(clk), .rst(rst),
        .x_real_0(x_real_0), .x_imag_0(x_imag_0),
        .x_real_1(x_real_1), .x_imag_1(x_imag_1),
        .x_real_2(x_real_2), .x_imag_2(x_imag_2),
        .x_real_3(x_real_3), .x_imag_3(x_imag_3),
        .x_real_4(x_real_4), .x_imag_4(x_imag_4),
        .x_real_5(x_real_5), .x_imag_5(x_imag_5),
        .x_real_6(x_real_6), .x_imag_6(x_imag_6),
        .x_real_7(x_real_7), .x_imag_7(x_imag_7),
        .X_real_0(X_real_0), .X_imag_0(X_imag_0),
        .X_real_1(X_real_1), .X_imag_1(X_imag_1),
        .X_real_2(X_real_2), .X_imag_2(X_imag_2),
        .X_real_3(X_real_3), .X_imag_3(X_imag_3),
        .X_real_4(X_real_4), .X_imag_4(X_imag_4),
        .X_real_5(X_real_5), .X_imag_5(X_imag_5),
        .X_real_6(X_real_6), .X_imag_6(X_imag_6),
        .X_real_7(X_real_7), .X_imag_7(X_imag_7)
    );

    integer i;

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // VCD dump for waveform analysis
    initial begin
        $dumpfile("fft_tb.vcd");
        $dumpvars(0, ffttb);
    end

    // Stimulus
    initial begin
        rst = 1;
        x_real_0 = 0; x_imag_0 = 0;
        x_real_1 = 0; x_imag_1 = 0;
        x_real_2 = 0; x_imag_2 = 0;
        x_real_3 = 0; x_imag_3 = 0;
        x_real_4 = 0; x_imag_4 = 0;
        x_real_5 = 0; x_imag_5 = 0;
        x_real_6 = 0; x_imag_6 = 0;
        x_real_7 = 0; x_imag_7 = 0;
        #20;
        rst = 0;
        // Example: Impulse input (x[0]=1, rest=0)
        x_real_0 = 16'sh7FFF; x_imag_0 = 0;
        x_real_1 = 0; x_imag_1 = 0;
        x_real_2 = 0; x_imag_2 = 0;
        x_real_3 = 0; x_imag_3 = 0;
        x_real_4 = 0; x_imag_4 = 0;
        x_real_5 = 0; x_imag_5 = 0;
        x_real_6 = 0; x_imag_6 = 0;
        x_real_7 = 0; x_imag_7 = 0;
        #100;
        // Example: All ones
        x_real_0 = 16'sh1000; x_imag_0 = 0;
        x_real_1 = 16'sh1000; x_imag_1 = 0;
        x_real_2 = 16'sh1000; x_imag_2 = 0;
        x_real_3 = 16'sh1000; x_imag_3 = 0;
        x_real_4 = 16'sh1000; x_imag_4 = 0;
        x_real_5 = 16'sh1000; x_imag_5 = 0;
        x_real_6 = 16'sh1000; x_imag_6 = 0;
        x_real_7 = 16'sh1000; x_imag_7 = 0;
        #100;
        // Example: Custom test vector (add more as needed)
        x_real_0 = 16'sh7FFF; x_imag_0 = 0;
        x_real_1 = 16'sh0000; x_imag_1 = 0;
        x_real_2 = 16'sh8000; x_imag_2 = 0;
        x_real_3 = 16'sh0000; x_imag_3 = 0;
        x_real_4 = 16'sh7FFF; x_imag_4 = 0;
        x_real_5 = 16'sh0000; x_imag_5 = 0;
        x_real_6 = 16'sh8000; x_imag_6 = 0;
        x_real_7 = 16'sh0000; x_imag_7 = 0;
        #200;
        $finish;
    end
endmodule
