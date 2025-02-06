`timescale 1ns/1ps  // time delays in the simulation in nanosecs, and the precision is in picosecs.

module testbench;
    reg d;
    reg clk;
    reg reset;
    wire q, q_;

    // Instantiate the D flip-flop
    d_flip_flop uut (
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q)
        .q_(q_)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock (changing every 5ns)
    end

    // Stimulus
    initial begin
        // Initialize inputs
        d = 0;
        reset = 1;
        #10; // wait for 10 units of time (10ns) before moving to next line
        
        // Release reset
        reset = 0;
        #10;
        
        // Apply test vectors
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        
        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("At time %t, d = %b, clk = %b, reset = %b, q = %b", $time, d, clk, reset, q);
    end
endmodule