module d_flip_flop (
    input wire d,      // Data input
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output reg q, q_       // Output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin  // if reset is true
        q <= 1'b0;     // Reset the output to 0
    end else begin
        q <= d;        // On clock edge, set output to data input
    end
end

endmodule
