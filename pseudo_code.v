module adc_converter (
    input wire clk,           // Clock signal
    input wire reset,         // Reset signal
    input wire [11:0] analog_in, // Analog input voltage (12-bit for higher resolution)
    output reg [7:0] digital_out // 8-bit digital output value
);

    // Internal signals
    reg [7:0] adc_value;

    // ADC conversion process
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            adc_value <= 8'b0;
            digital_out <= 8'b0;
        end else begin
            // Normalize analog_in to a range of 0 to 1 and convert to 8-bit digital value
            adc_value <= (analog_in * 255) / 4095; // 4095 is the max value for 12-bit input
            digital_out <= adc_value;
        end
    end

endmodule