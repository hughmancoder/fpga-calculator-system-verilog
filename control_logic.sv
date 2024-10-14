`timescale 1ns / 1ps

module control_logic (
    input clk,                 
    input confirm,             
    input reset,    
    input display_mode_change,           
    input operator_select, 
    input [3:0] operand_input, 
    output reg display_mode,
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

    wire [2:0] state;

    state_machine state_machine_instance (
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .state(state)
    );

    reg signed [5:0] operand1;
    reg signed [5:0] operand2;
    wire signed [5:0] alu_result;
    wire signed [5:0] operand_input_display;

    alu alu_instance(
        .operand1(operand1), 
        .operand2(operand2), 
        .operator_select(operator_select), 
        .result(alu_result)
    );

    input_handler input_handler_instance(
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .display_mode_change(display_mode_change),
        .operand_input(operand_input),
        .state(state),  
        .operand1(operand1),
        .operand2(operand2),
        .operand_input_display(operand_input_display),
        .display_mode(display_mode)
    );
    
    assign display_result = (state == S5_CALCULATE) ? alu_result : operand_input_display;
    

endmodule
