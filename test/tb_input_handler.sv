module tb_input_handler;

    // Inputs
    reg [3:0] sw;
    reg sw4;
    reg BTNL;
    reg BTNU;

    // Outputs
    wire [3:0] operand1;
    wire [3:0] operand2;
    wire confirmed_operand1;
    wire confirmed_operand2;
    wire reset;

    // Instantiate the input handler
    input_handler uut (
        .sw(sw),
        .sw4(sw4),
        .BTNL(BTNL),
        .BTNU(BTNU),
        .operand1(operand1),
        .operand2(operand2),
        .confirmed_operand1(confirmed_operand1),
        .confirmed_operand2(confirmed_operand2),
        .reset(reset)
    );

    initial begin
        // Initialize inputs
        sw = 4'b0000;
        BTNL = 0;
        BTNU = 0;
        sw4 = 0;

        // Test reset
        #10 BTNL = 1; #5 BTNL = 0;  // Trigger reset
        #10;

        // Select operand 1
        sw = 4'b1010;  // Operand 1 = 10
        #10 BTNU = 1; #5 BTNU = 0;  // Confirm operand 1
        #10;

        // Select operand 2
        sw = 4'b0011;  // Operand 2 = 3
        #10 BTNU = 1; #5 BTNU = 0;  // Confirm operand 2
        #10;

        // Check reset
        #10 BTNL = 1; #5 BTNL = 0;  // Trigger reset again
        #10;
    end

endmodule
