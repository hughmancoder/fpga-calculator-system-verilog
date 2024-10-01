module operand_input (
    input [3:0] sw,
    input confirm, clk, reset,
    output reg [3:0] operand1, operand2
);

    reg confirmed = 0;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            operand1 <= 4'b0000;
            operand2 <= 4'b0000;
            confirmed <= 0;
        end else if (confirm) begin
            if (!confirmed) begin
                operand1 <= sw; // First operand
                confirmed <= 1;
            end else begin
                operand2 <= sw; // Second operand
                confirmed <= 0;
            end
        end
    end

endmodule
