//`timescale 1ns / 1ps

//module display_control_tb;

//    // Inputs
//    reg clk;
//    reg [4:0] result;
//    reg [3:0] sw_input;
//    reg [1:0] display_state; // INPUT, RESULT
//    reg display_mode; // 0 decimal, 1 hex

//    // Outputs
//    wire [6:0] seg;
//    wire [3:0] an;

//    // Instantiate the display_control module
//    display_control uut (
//        .clk(clk),
//        .result(result),
//        .sw_input(sw_input),
//        .display_state(display_state),
//        .display_mode(display_mode),
//        .seg(seg),
//        .an(an)
//    );

//    // Clock generation
//    always #5 clk = ~clk; // Clock with 10ns period (100MHz)

//    initial begin
//        // Initialize inputs
//        clk = 0;
//        result = 5'b00000;
//        sw_input = 4'b0000;
//        display_state = 2'b00; // INPUT state
//        display_mode = 0; // Decimal mode

//        // Test case 1: Display operand1 in decimal
//        #10 sw_input = 4'b0011;  // Set sw_input to 3 (decimal)
//        display_state = 2'b00;   // Set display_state to INPUT
//        display_mode = 0;        // Set to decimal mode
//        #100; // Wait for display to refresh

//        // Test case 2: Display operand2 in hex
//        #10 sw_input = 4'b1010;  // Set sw_input to 10 (hex 'A')
//        display_state = 2'b00;   // Keep display_state in INPUT
//        display_mode = 1;        // Set to hexadecimal mode
//        #100; // Wait for display to refresh

//        // Test case 3: Display result in decimal
//        #10 result = 5'b01101;   // Set result to 13 (decimal)
//        display_state = 2'b11;   // Set display_state to RESULT
//        display_mode = 0;        // Set to decimal mode
//        #100; // Wait for display to refresh

//        // Test case 4: Display result in hex
//        #10 result = 5'b01101;   // Set result to 13 (hex 'D')
//        display_state = 2'b11;   // Set display_state to RESULT
//        display_mode = 1;        // Set to hexadecimal mode
//        #100; // Wait for display to refresh

//        // Test case 5: Display another number in decimal
//        #10 result = 5'b10000;   // Set result to 16 (decimal)
//        display_state = 2'b11;   // RESULT
//        display_mode = 0;        // Decimal mode
//        #100; // Wait for display to refresh

//        // Test case 6: Display another number in hex
//        #10 result = 5'b10000;   // Set result to 16 (hex '10')
//        display_state = 2'b11;   // RESULT
//        display_mode = 1;        // Hexadecimal mode
//        #100; // Wait for display to refresh

//        // End of simulation
//        $stop;
//    end

//endmodule
