module display_control(
    input BTND,                // Button to switch display mode
    input reset,               // Reset signal
    input confirmed_operand1,
    input confirmed_operand2,
    input [3:0] sw,            // Current input on switches
    input [3:0] result,        // Calculation result
    output [6:0] seg,          // Seven-segment display output
    output [3:0] an,           // Seven-segment display enable
    output reg mode            // Display mode: 0 for decimal, 1 for hexadecimal
);

    reg [3:0] display_value;

    // Toggle display mode on button press
    always @(posedge BTND) begin
        mode <= ~mode;
    end

    // Select value to display based on input state
    always @(*) begin
        if (reset)
            display_value = 4'b0000;
        else if (!confirmed_operand1)
            display_value = sw;
        else if (!confirmed_operand2)
            display_value = sw;
        else
            display_value = result;
    end

    // Seven-segment display module instantiation
    seven_segment_display decoder (
        .value(display_value),
        .mode(mode),
        .seg(seg),
        .an(an)
    );

endmodule
