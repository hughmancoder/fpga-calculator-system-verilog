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

    state_t state;
    reg signed [5:0] operand1;
    reg signed [5:0] operand2;
    wire signed [5:0] alu_result;

    alu alu_instance(.operand1(operand1), .operand2(operand2), .operator_select(operator_select), .result(alu_result))

    input_handler input_handler_instance (
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .display_mode_change(display_mode_change),
        .operand_input(operand_input),
        .state(state),
        .operand1(operand1),
        .operand2(operand2),
        .display_result(display_result),
        .display_mode(display_mode)
    );

    state_machine state_machine_instance (
    .clk(clk),
    .reset(reset),
    .confirm(confirm),
    .state(state)
    );

    always @(posedge clk) begin
        if (state == 3'b101) 
            display_result <= alu_result;
    end

endmodule
