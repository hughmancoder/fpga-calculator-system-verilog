module digital_calculator (
    input [3:0] sw,       // sw[3:0] for operand input
    input sw4,            // sw4 for selecting operator (1 for addition, 0 for subtraction)
    input reset,          // Button for resetting at any time
    input confirm,        // Button for confirming operand
    input mode_change,    // Button for changing display mode
    input clk,            // Clock signal
    output [6:0] seg,     // Seven-segment display output
    output [3:0] an       // Anode control for seven-segment display
);

    // Wires for internal connections
    wire [3:0] operand1, operand2;
    wire [3:0] result;
    wire operator_sel; // 1 add, 0 sub
    wire display_mode;
    
    // Operand Input Module
    operand_input op_in (
        .sw(sw),
        .confirm(confirm),
        .clk(clk),
        .reset(reset),
        .operand1(operand1),
        .operand2(operand2)
    );
    
    always @(*) begin
        if (reset)
            operator_sel <= 0; // Reset operator to addition
        else
            operator_sel <= sw4; // 1 for addition, 0 for subtraction
    end
    
    // Arithmetic Logic Unit (ALU) Module
    alu alu_unit (
        .operand1(operand1),
        .operand2(operand2),
        .operator_sel(operator_sel),
        .result(result)
    );
    
    // Display Control Module
    display_ctrl disp_ctrl (
        .result(result),
        .operand1(operand1),
        .operand2(operand2),
        .mode_change(mode_change),
        .reset(reset),
        .display_mode(display_mode),
        .seg(seg),
        .an(an)
    );

endmodule
