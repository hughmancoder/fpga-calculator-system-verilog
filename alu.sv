module alu (
    input [3:0] operand1, operand2,
    input operator_sel,
    output reg [3:0] result
);

    always @(*) begin
        if (operator_sel)
            result = operand1 + operand2; 
        else
            result = operand1 - operand2; 
    end

endmodule
