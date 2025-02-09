`timescale 1ns/1ps  // time delays in the simulation in nanosecs, and the precision is in picosecs.
module d_flip_flop (
    input wire d,      // Data input
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output reg q, q_   // Outputs
);

always @(posedge clk or posedge reset) begin
    if (reset) begin  // if reset is true
        q <= 1'b0;     // Reset the output to 0
        q_ <= 1'b1;    // Reset the output to 1 (or any desired value)
    end else begin
        q <= d;        // On clock edge, set output to data input
        q_ <= ~d;      // Set q_ to the inverse of d (or any desired logic)
    end
end

endmodule