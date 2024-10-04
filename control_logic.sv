module control_logic (
    input clk,                 
    input confirm,             
    input reset,    
    input display_mode_change           
    input operator_select, 
    input [3:0] operand_input, 
    output reg display_mode
    output reg signed [5:0] display_result
);
    
    typedef enum logic [2:0] {
        S0_IDLE      = 3'b000,
        S1_OP1       = 3'b001,
        S2_OP1_WR    = 3'b010,
        S3_OP2       = 3'b011,
        S4_OP2_WR    = 3'b100,
        S5_CALCULATE = 3'b101
    } state_t;

    state_t state;
    reg signed [5:0] operand1;
    reg signed [5:0] operand2;
    reg signed [5:0] alu_result;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            operand1 <= 6'sb000000;
            operand2 <= 6'sb000000;
            display_result <= 6'sb000000;
            display_mode <= 0;
            state <= S0_IDLE;
        end else begin
            if (display_mode_change) begin
                display_mode <= ~display_mode; // Toggle display mode
            end
            case (state)
                S0_IDLE: begin
                    state <= S1_OP1;
                end
                S1_OP1: begin
                    display_result = $signed({1'b0, operand_input});
                    if (confirm) begin
                        state <= S2_OP1_WR;
                        operand1 <= $signed({1'b0, operand_input});
                    end
                end

                S2_OP1_WR: begin
                    if (~confirm) begin
                        state <= S3_OP2;
                    end
                end

                S3_OP2: begin
                    display_result = $signed({1'b0, operand_input});
                    if (confirm) begin
                        state <= S4_OP2_WR;
                        operand2 <= $signed({1'b0, operand_input});
                    end
                end

                S4_OP2_WR: begin
                    if (~confirm) begin
                        state <= S5_CALCULATE;
                    end
                end

                S5_CALCULATE: begin
                    // TODO: ALU module
                    display_result <= alu_result; 
                end
            endcase
        end
    end

    // combinational_logic
    always_comb begin
        alu_result = operator_select ? operand1 + operand2 : operand1 - operand2;
    end

endmodule
