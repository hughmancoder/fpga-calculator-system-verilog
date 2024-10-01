module arithmetic_unit(
    input [3:0] operand1,
    input [3:0] operand2,
    input operation,          // 1: Addition, 0: Subtraction
    output reg [3:0] result
);

    always @(*) begin
        if (operation) 
            result = operand1 + operand2;  // Perform addition
        else 
            result = operand1 - operand2;  // Perform subtraction
    end
endmodule
