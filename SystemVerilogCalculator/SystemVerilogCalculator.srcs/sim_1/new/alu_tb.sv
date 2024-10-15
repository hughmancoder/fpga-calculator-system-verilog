`timescale 1ns / 1ps

module alu_tb;
    reg signed [5:0] operand1;
    reg signed [5:0] operand2;
    reg operator_select;
    wire signed [5:0] result;
    
    alu dut (
        .operand1(operand1),
        .operand2(operand2),
        .operator_select(operator_select),
        .result(result)
    );
    
initial begin

        operand1 = 6'd10;    
        operand2 = 6'd5;     
        operator_select = 1; 
        #10;
        check_result(result, operand1 + operand2);

        
        operand1 = 6'd10;    
        operand2 = 6'd5;     
        operator_select = 0; 
        #10;
        check_result(result, operand1 - operand2);

        
        operand1 = -6'd4;    
        operand2 = -6'd6;    
        operator_select = 1; 
        #10;
        check_result(result, operand1 + operand2);

        
        operand1 = -6'd4;    
        operand2 = 6'd6;     
        operator_select = 0; 
        #10;
        check_result(result, operand1 - operand2);

        
        operand1 = 6'd0;     
        operand2 = 6'd0;     
        operator_select = 1; 
        #10;
        check_result(result, operand1 + operand2);

        
        $finish;
    end

    
    task check_result(input signed [5:0] actual, input signed [5:0] expected);
        if (actual === expected) begin
            $display("Test Passed %d %d", actual, expected);
        end else begin
            $display("Test Faile %d %d", actual, expected);
        end
    endtask
endmodule

