`timescale 1ns / 1ps

module display_control_tb;

    // Inputs
    reg signed [4:0] result;     // 5-bit signed result from the ALU
    reg [3:0] operand1, operand2;
    reg mode_change;
    reg reset;
    reg clk;

    // Outputs
    wire [6:0] seg;    // Segment control for the seven-segment display
    wire [3:0] an;     // Anode control for which digit to activate

    // Instantiate the Unit Under Test (UUT)
    display_ctrl uut (
        .result(result),
        .operand1(operand1),
        .operand2(operand2),
        .mode_change(mode_change),
        .reset(reset),
        .seg(seg),
        .an(an)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock (10 ns period)

    // Stimulus procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 1;       // Activate reset
        mode_change = 0;
        result = 5'b00000;  // Initial result to display

        // Wait for the global reset
        #10;
        reset = 0;       // Release reset

        // Test case 1: Display positive result in decimal mode
        result = 5'b00101;  // +5
        #20;

        // Test case 2: Display negative result
        result = -5;  // -5 in decimal
        #20;

        // Test case 3: Change to hexadecimal mode
        mode_change = 1;
        #10;
        mode_change = 0;  // Go to hex mode
        result = 5'b10101;  // -11 in two's complement
        #20;

        // Test case 4: Display larger positive value
        result = 5'b11111;  // -1 in decimal
        #20;

        // Test case 5: Test positive large value in hex mode
        mode_change = 1;  // Switch back to decimal mode
        #10;
        mode_change = 0;
        result = 5'b10001;  // -15 in decimal
        #20;

        // End simulation
        $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time=%d | result=%d | an=%b | seg=%b | mode_change=%b | reset=%b", 
                 $time, result, an, seg, mode_change, reset);
    end

endmodule
