`timescale 1ns / 1ps

module control_logic_tb();
    reg clk;
    reg confirm;
    reg reset;
    reg display_mode_change;
    reg operator_select;
    reg [3:0] operand_input;
    wire display_mode;
    wire signed [5:0] display_result;

    control_logic uut (
        .clk(clk),
        .confirm(confirm),
        .reset(reset),
        .display_mode_change(display_mode_change),
        .operator_select(operator_select),
        .operand_input(operand_input),
        .display_mode(display_mode),
        .display_result(display_result)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Initial test setup
        confirm = 0;
        reset = 1;
        display_mode_change = 0;
        operator_select = 0;
        operand_input = 4'b0000;

        // Apply reset
        #10;
        reset = 0;

        // **Input Operand1**
        operand_input = 4'b0011;
        #10;

        confirm = 1;
        #10;
        confirm = 0;
        #10;
        // **Input Operand2**
        operand_input = 4'b0101;
        #10;

        $display("State INFO", uut.state);

        confirm = 1;
        #10;
        confirm = 0;
        #10;
        
        $display("State INFO", uut.state);

        // **Perform Addition**
        operator_select = 1;
        #20;
        
         $display("Operand1 INFO", uut.operand1);
         $display("Operand2 INFO", uut.operand2);
         

        if (uut.display_result !== 6'd8) begin
            $display("Test Failed: Expected addition result = 8, got %d", uut.display_result);
        end else begin
            $display("Test Passed: Addition result = %d", uut.display_result);
        end

        // **Perform Subtraction**
        operator_select = 0;
        #10;

        if (uut.display_result !== -6'd2) begin
            $display("Test Failed: Expected subtraction result = -2, got %d", uut.display_result);
        end else begin
            $display("Test Passed: Subtraction result = %d", uut.display_result);
        end

        // **Test Display Mode Change**
        display_mode_change = 1;
        #10;
        display_mode_change = 0;
        #10;

        if (uut.display_mode !== 1) begin
            $display("Test Failed: Expected display_mode = 1 after toggle, got %d", uut.display_mode);
        end else begin
            $display("Test Passed: Display mode toggled to %d", uut.display_mode);
        end

        display_mode_change = 1;
        #10;
        display_mode_change = 0;
        #10;

        if (uut.display_mode !== 0) begin
            $display("Test Failed: Expected display_mode = 0 after second toggle, got %d", uut.display_mode);
        end else begin
            $display("Test Passed: Display mode toggled back to %d", uut.display_mode);
        end

        #100;
        $finish;
    end
endmodule
