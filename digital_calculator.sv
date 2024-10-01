module digital_calculator(
    input [3:0] sw,          // 4-bit input switches for operand values
    input sw4,               // Operation select switch (1: add, 0: subtract)
    input BTNL,              // Reset button
    input BTNU,              // Confirm button for operand selection
    input BTND,              // Display mode switch (hex/decimal)
    output [6:0] seg,        // Seven-segment display output
    output [3:0] an          // Seven-segment display enable
);

    wire [3:0] operand1, operand2;
    wire [3:0] result;
    wire confirmed_operand1, confirmed_operand2, reset;
    wire mode;

    // Instantiate the input handler module
    input_handler i_handler (
        .sw(sw),
        .sw4(sw4),
        .BTNL(BTNL),
        .BTNU(BTNU),
        .operand1(operand1),
        .operand2(operand2),
        .confirmed_operand1(confirmed_operand1),
        .confirmed_operand2(confirmed_operand2),
        .reset(reset)
    );

    // Instantiate the arithmetic unit module
    arithmetic_unit a_unit (
        .operand1(operand1),
        .operand2(operand2),
        .operation(sw4),
        .result(result)
    );

    // Instantiate the display control module
    display_control d_control (
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

endmodule
