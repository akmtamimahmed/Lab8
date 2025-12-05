`timescale 1ns / 1ps
// PROBLEM 2: Slow 50Hz Polling Counter
module slow_counter(
    input clk,          // 100MHz System Clock
    input btn,          // Button to count
    input sw,           // Reset switch
    output reg [15:0] led // 16 LEDs
    );

    // 100MHz / 50Hz = 2,000,000 ticks per cycle [cite: 21]
    parameter MAX_COUNT = 2000000; 
    reg [31:0] timer;
    reg slow_tick;

    // --- 50Hz Clock Generator ---
    always @(posedge clk) begin
        if (timer >= MAX_COUNT - 1) begin
            timer <= 0;
            slow_tick <= 1; // Pulse 'high' 50 times a second
        end else begin
            timer <= timer + 1;
            slow_tick <= 0;
        end
    end

    // --- Counter Logic ---
    always @(posedge clk) begin
        if (sw) begin
            led <= 0; // Reset
        end else if (slow_tick) begin
            // Only check the button exactly when the 50Hz tick fires [cite: 24]
            if (btn) 
                led <= led + 1; 
        end
    end
endmodule