module tb_display_control;

    // Inputs
    reg BTND;
    reg reset;
    reg confirmed_operand1;
    reg confirmed_operand2;
    reg [3:0] sw;
    reg [3:0] result;

    // Outputs
    wire [6:0] seg;
    wire [3:0] an;
    wire mode;

    // Instantiate the display control
    display_control uut (
        .BTND(BTND),
        .reset(reset),
        .confirmed_operand1(confirmed_operand1),
        .confirmed_operand2(confirmed_operand2),
        .sw(sw),
        .result(result),
        .seg(seg),
        .an(an),
        .mode(mode)
    );

    initial begin
        // Initialize inputs
        BTND = 0;
        reset = 0;
        confirmed_operand1 = 0;
        confirmed_operand2 = 0;
        sw = 4'b0000;
        result = 4'b0000;

        // Test displaying operand 1
        #10 sw = 4'b1010;  // Operand 1 = 10 (decimal)
        confirmed_operand1 = 0;
        confirmed_operand2 = 0;
        #10;

        // Confirm operand 1
        confirmed_operand1 = 1;
        #10;

        // Test displaying operand 2
        sw = 4'b0011;  // Operand 2 = 3 (decimal)
        confirmed_operand2 = 0;
        #10;

        // Confirm operand 2
        confirmed_operand2 = 1;
        #10;

        // Test displaying result
        result = 4'b1100;  // Result = 12
        #10;

        // Switch display mode (decimal/hexadecimal)
        #10 BTND = 1; #5 BTND = 0;  // Toggle display mode
        #10;

        // Test reset
        reset = 1;
        #10 reset = 0;
        #10;
    end

endmodule
