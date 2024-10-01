module input_handler(
    input [3:0] sw,
    input sw4,               // Operation select switch
    input BTNL,              // Reset button
    input BTNU,              // Confirm button
    output reg [3:0] operand1,
    output reg [3:0] operand2,
    output reg confirmed_operand1,
    output reg confirmed_operand2,
    output reg reset
);

    always @(posedge BTNL or posedge BTNU) begin
        if (BTNL) begin
            // Reset all values
            operand1 <= 4'b0000;
            operand2 <= 4'b0000;
            confirmed_operand1 <= 1'b0;
            confirmed_operand2 <= 1'b0;
            reset <= 1'b1;
        end
        else if (BTNU) begin
            // Confirm operand values in sequence
            reset <= 1'b0;
            if (!confirmed_operand1) begin
                operand1 <= sw[3:0];
                confirmed_operand1 <= 1'b1;
            end
            else if (!confirmed_operand2) begin
                operand2 <= sw[3:0];
                confirmed_operand2 <= 1'b1;
            end
        end
    end
endmodule
