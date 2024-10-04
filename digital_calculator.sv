module calculator (
    input clk,                 
    input reset,               // BTNL - reset button
    input confirm,             // BTNU - confirm operand
    input display_mode_change, // BTND - change display mode
    input sw[4:0]
    output [6:0] seg,          
    output [3:0] an            
);

    wire signed [5:0] display_result;  
    wire display_mode; // 0 for decimal, 1 for hex

    control_logic control (
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .display_mode_change(display_mode_change)
        .operator_select(sw[4]),
        .operand_input(sw[3:0]),
        .display_result(display_result)
        .display_mode(display_mode)
    );


    // Instantiate the display control module
    display_control display (
        .clk(clk),
        .data(display_result),          // Pass result from control_logic
        .display_mode(display_mode),    // Pass current display mode (decimal/hex)
        .seg(seg),                      // 7-segment display output
        .an(an)                         // Anode control for multiplexing displays
    );
    
endmodule
