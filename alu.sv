module alu (
    input [3:0] operand1, operand2, // 4-bit unsigned inputs from switches
    input operator_sel,             // 1 for addition, 0 for subtraction
    output reg signed [4:0] result  // 5-bit signed result to handle negative results
);

    always @(*) begin
        if (operator_sel) begin
            // Treat both operands as unsigned and perform addition
            result = operand1 + operand2;
        end else begin
            // Convert operands to signed and perform subtraction
            result = $signed(operand1) - $signed(operand2);
        end
    end

endmodule
