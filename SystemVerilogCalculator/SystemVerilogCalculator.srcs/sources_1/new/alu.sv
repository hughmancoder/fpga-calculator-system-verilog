`timescale 1ns / 1ps

module alu (
    input logic signed [5:0] operand1, 
    input logic signed [5:0] operand2,
    input logic operator_select, // 0 for subtraction, 1 for addition
    output logic signed [5:0] result
);

    logic [5:0] sum, sub;
    logic [5:0] operand2_complement;
    logic carry_out_add, carry_out_sub;
    
    // addition operand1 + operand2
    logic carry_add[5:0]; 
    full_adder FA0_add (operand1[0], operand2[0], 1'b0, sum[0], carry_add[0]);
    full_adder FA1_add (operand1[1], operand2[1], carry_add[0], sum[1], carry_add[1]);
    full_adder FA2_add (operand1[2], operand2[2], carry_add[1], sum[2], carry_add[2]);
    full_adder FA3_add (operand1[3], operand2[3], carry_add[2], sum[3], carry_add[3]);
    full_adder FA4_add (operand1[4], operand2[4], carry_add[3], sum[4], carry_add[4]);
    full_adder FA5_add (operand1[5], operand2[5], carry_add[4], sum[5], carry_out_add);

    assign operand2_complement = ~operand2; 
    
    // subtraction (operand1 - operand2 = operand1 + ~operand2 + 1)
    logic carry_sub[5:0];
    full_adder FA0_sub (operand1[0], operand2_complement[0], 1'b1, sub[0], carry_sub[0]); 
    full_adder FA1_sub (operand1[1], operand2_complement[1], carry_sub[0], sub[1], carry_sub[1]);
    full_adder FA2_sub (operand1[2], operand2_complement[2], carry_sub[1], sub[2], carry_sub[2]);
    full_adder FA3_sub (operand1[3], operand2_complement[3], carry_sub[2], sub[3], carry_sub[3]);
    full_adder FA4_sub (operand1[4], operand2_complement[4], carry_sub[3], sub[4], carry_sub[4]);
    full_adder FA5_sub (operand1[5], operand2_complement[5], carry_sub[4], sub[5], carry_out_sub);

    assign result = operator_select ? sum : sub;

endmodule