module tb_arithmetic_unit;

    // Inputs
    reg [3:0] operand1;
    reg [3:0] operand2;
    reg operation; // 1 for addition, 0 for subtraction

    // Outputs
    wire [3:0] result;

    // Instantiate the arithmetic unit
    arithmetic_unit uut (
        .operand1(operand1),
        .operand2(operand2),
        .operation(operation),
        .result(result)
    );

    initial begin
        // Initialize inputs
        operand1 = 4'b0000;
        operand2 = 4'b0000;
        operation = 0;

        // Test Addition
        #10 operand1 = 4'b0110;  // Operand 1 = 6
        operand2 = 4'b0011;  // Operand 2 = 3
        operation = 1;  // Perform addition (6 + 3 = 9)
        #10;

        // Test Subtraction
        operand1 = 4'b1001;  // Operand 1 = 9
        operand2 = 4'b0100;  // Operand 2 = 4
        operation = 0;  // Perform subtraction (9 - 4 = 5)
        #10;

        // Test Overflow in Addition
        operand1 = 4'b1111;  // Operand 1 = 15
        operand2 = 4'b0001;  // Operand 2 = 1
        operation = 1;  // Perform addition (15 + 1 = 16, overflow to 0)
        #10;
    end

endmodule
