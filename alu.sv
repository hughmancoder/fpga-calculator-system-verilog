module alu (
    input signed [5:0] operand1, 
    input signed [5:0] operand2,
    input operator_select, // 0 for subtraction, 1 for addition
    output reg signed [5:0] result
);
    always_comb begin
        result = operator_select ? operand1 + operand2 : operand1 - operand2;
    end
endmodule;