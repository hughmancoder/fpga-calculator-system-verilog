module calculator (
    input clk,                 
    input reset,               // BTNL - reset button
    input confirm,             // BTNU - confirm operand
    input display_mode_change, // BTND - change display mode
    input [4:0] sw,
    output [6:0] seg,          
    output [3:0] an            
);

    wire signed [5:0] display_result;  
    wire display_mode; // 0 for decimal, 1 for hex

    control_logic control (
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .display_mode_change(display_mode_change),
        .operator_select(sw[4]),
        .operand_input(sw[3:0]),
        .display_mode(display_mode),
        .display_result(display_result)
    );


    display_control display (
        .clk(clk),
        .data(display_result),         
        .display_mode(display_mode),    
        .seg(seg),                      
        .an(an)                         
    );
    
endmodule