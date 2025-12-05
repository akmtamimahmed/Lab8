`timescale 1ns / 1ps
// PROBLEM 1: Bouncy Counter (Counts at 100MHz speed)
module bouncy_counter(
    input clk,          // 100MHz System Clock
    input btn,          // Button to count
    input sw,           // Reset switch
    output reg [15:0] led // 16 LEDs
    );

    always @(posedge clk) begin
        if (sw) begin
            led <= 16'b0; // Reset counter when switch is HIGH [cite: 14]
        end else if (btn) begin
            led <= led + 1; // Increment continuously while button is pressed [cite: 11]
        end
    end
endmodule