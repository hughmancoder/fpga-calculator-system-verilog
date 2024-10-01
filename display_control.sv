module display_ctrl (
    input [3:0] result, operand1, operand2,
    input mode_change, reset,
    output reg display_mode, 
    output reg [6:0] seg, 
    output reg [3:0] an
);

    always @(*) begin
        if (reset) 
            display_mode <= 0; // Reset display mode to default
        
        // Switch display mode between hex and decimal
        if (mode_change)
            display_mode <= ~display_mode; 

        // Display either operand or result based on mode
        if (display_mode) begin
            // Hexadecimal display
            seg = hex_to_7seg(result);
        end else begin
            // Decimal display
            seg = dec_to_7seg(result);
        end
        an = 4'b1110; // Activate first display digit
    end

    function [6:0] bin_to_7seg;
        input [3:0] bin;
        // TODO
    endfunction


    function [6:0] hex_to_7seg;
        input [3:0] hex;
        
    endfunction
endmodule
