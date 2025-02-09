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
      	.q(q),
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
        reset = 0; #10;
        
      	// Apply test vectors
      	integer i;
      	for (i = 1; i < 5; i = i + 1) begin
          	d = i % 2;
         	#10;
    	end
        
        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
      $monitor("At time %t, d = %b, clk = %b, reset = %b, q = %b, q_ = %b", $time, d, clk, reset, q, q_);
    end
  
  	// Dumpfile and Dumpvars
	initial begin
  		$dumpfile("waveform.vcd"); // Name of the VCD file
  		$dumpvars(0, testbench); // Dump all variables
  
	end
endmodule