// TODO: implement with combinational logic
module alu (
    input signed [5:0] operand1,
    input signed [5:0] operand2, 
    input operator_select,          // sw[4]
    output reg signed [5:0] result  // 6-bit signed result to handle negative results
);

    always @(*) begin
        if (operator_select) begin
            result = operand1 + operand2;
        end else begin
            result = operand1 - operand2;
        end
    end

endmodule