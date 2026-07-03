module counter (
    input wire [3:0] d,       // Parallel data input for loading
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset signal (active high)
    input wire load,          // Load enable signal
    input wire en,            // Counter enable signal
    output reg [3:0] q        // 4-bit counter output
);

    // The block triggers on the rising edge of the clock
    always @(posedge clk) begin 
        if (reset)
            q <= 4'b0000;     // Reset counter to 0
        else if (load)
            q <= d;           // Parallel load input d into the counter
        else if (en)
            q <= q + 1'b1;    // Increment counter if enabled
        // If neither reset, load, nor en are active, q remains unchanged (latched)
    end

endmodule