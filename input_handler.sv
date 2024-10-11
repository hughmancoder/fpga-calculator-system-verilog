`timescale 1ns / 1ps

module input_handler (
    input clk,
    input reset,
    input confirm,
    input display_mode_change,
    input [3:0] operand_input,
    input [2:0] state,
    output reg signed [5:0] operand1,
    output reg signed [5:0] operand2,
    output reg signed [5:0] operand_input_display,
    output reg display_mode
);

    typedef enum logic [2:0] {
        S0_IDLE      = 3'b000,
        S1_OP1       = 3'b001,
        S2_OP1_WR    = 3'b010,
        S3_OP2       = 3'b011,
        S4_OP2_WR    = 3'b100,
        S5_CALCULATE = 3'b101
    } state_t;

    reg display_mode_change_prev;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            operand1 <= 6'sb000000;
            operand2 <= 6'sb000000;
            operand_input_display <= 6'sb000000;
            display_mode_change_prev <= 0;
            display_mode <= 0;
        end else begin
            // Positive edge detection for display mode change
            if (display_mode_change_prev == 0 && display_mode_change == 1) begin
                display_mode <= ~display_mode;  
            end
            display_mode_change_prev <= display_mode_change;

            case (state)
                S1_OP1: begin
                operand_input_display <= $signed({1'b0, operand_input});  
                if (confirm) begin
                    operand1 <= $signed({1'b0, operand_input}); 
                end
            end
            S2_OP1_WR: if (confirm) operand1 <= $signed({1'b0, operand_input}); 
            S3_OP2: begin
                operand_input_display <= $signed({1'b0, operand_input});  
                if (confirm) begin
                    operand2 <= $signed({1'b0, operand_input});  
                end
            end

                S3_OP2: operand_input_display <= $signed({1'b0, operand_input});  
                S4_OP2_WR: if (confirm) operand2 <= $signed({1'b0, operand_input});  
                default:;
            endcase
        end
    end
endmodule
