module operand_display_handler (
    input clk,
    input reset,
    input confirm,
    input display_mode_change,
    input [3:0] operand_input,
    input [2:0] state,
    output reg signed [5:0] operand1,
    output reg signed [5:0] operand2,
    output reg signed [5:0] display_result,
    output reg display_mode
);

    reg display_mode_change_prev;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            operand1 <= 6'sb000000;
            operand2 <= 6'sb000000;
            display_result <= 6'sb000000;
            display_mode <= 0;
        end else begin

            // posedge detection
            if (display_mode_change_prev == 0 && display_mode_change == 1) begin
                display_mode <= ~display_mode;  
            end
            display_mode_change_prev <= display_mode_change;
       


            end
            case (state)
                3'b001: display_result <= $signed({1'b0, operand_input});  
                3'b010: if (confirm) operand1 <= $signed({1'b0, operand_input}); 
                3'b011: display_result <= $signed({1'b0, operand_input});  
                3'b100: if (confirm) operand2 <= $signed({1'b0, operand_input});  
                default:
            endcase
        end
    end
endmodule