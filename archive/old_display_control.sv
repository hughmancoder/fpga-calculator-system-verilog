module display_control (
    input signed [5:0] data,        // 6-bit unsigned result from the ALU
    output reg [6:0] seg,             // Segment control
    output reg [3:0] an               // Anode control (which display to activate)
);

    reg [3:0] abs_result_digit1, abs_result_digit2; // Two digits for the absolute value of the result
    reg is_negative;                                 // Flag to indicate negative result
    reg display_mode;
    
        // Multiplexing logic to select which digit to display
    always @(posedge clk) begin
        if (reset) begin
            an <= 4'b1110; // Activate first display
        end else begin
            an <= {an[2:0], an[3]}; // Rotate through the digits
        end
    end                                // Mode to switch between hex and decimal

    always @(*) begin
        if (reset) begin
            display_mode <= 0; // Reset display mode to default (decimal)
        end else if (mode_change) begin
            display_mode <= ~display_mode; // Switch between hex and decimal mode
        end

        // Check if the result is negative and calculate the absolute value
        if (result < 0) begin
            is_negative = 1;
            abs_result_digit1 = -result % 10;  // Least significant digit of the absolute value
            abs_result_digit2 = -result / 10;  // Most significant digit of the absolute value
        end else begin
            is_negative = 0;
            abs_result_digit1 = result % 10;   // Least significant digit
            abs_result_digit2 = result / 10;   // Most significant digit
        end

        // Select which display to activate and set the appropriate segments
        // TODO: look into correct display modes and test
        case (an)
            4'b1110: begin
                if (is_negative)
                    seg = 7'b0111111;  // Display minus sign ('-')
                else if (display_mode) begin
                    seg = hex_to_7seg(abs_result_digit1);
                end else begin
                    seg = dec_to_7seg(abs_result_digit1);
                end
            end
            4'b1101: begin
                if (display_mode) begin
                    seg = hex_to_7seg(abs_result_digit2);
                end else begin
                    seg = dec_to_7seg(abs_result_digit2);
                end
            end
            default: seg = 7'b1111111; // Default: turn off segments
        endcase
    end

    function [6:0] dec_to_7seg;
        input [3:0] bin;
        case (bin)
            4'b0000: dec_to_7seg = 7'b1000000; // 0
            4'b0001: dec_to_7seg = 7'b1111001; // 1
            4'b0010: dec_to_7seg = 7'b0100100; // 2
            4'b0011: dec_to_7seg = 7'b0110000; // 3
            4'b0100: dec_to_7seg = 7'b0011001; // 4
            4'b0101: dec_to_7seg = 7'b0010010; // 5
            4'b0110: dec_to_7seg = 7'b0000010; // 6
            4'b0111: dec_to_7seg = 7'b1111000; // 7
            4'b1000: dec_to_7seg = 7'b0000000; // 8
            4'b1001: dec_to_7seg = 7'b0010000; // 9
            default: dec_to_7seg = 7'b1111111; // Invalid
        endcase
    endfunction

    function [6:0] hex_to_7seg;
        input [3:0] hex;
        case (hex)
            4'b0000: hex_to_7seg = 7'b1000000; // 0
            4'b0001: hex_to_7seg = 7'b1111001; // 1
            4'b0010: hex_to_7seg = 7'b0100100; // 2
            4'b0011: hex_to_7seg = 7'b0110000; // 3
            4'b0100: hex_to_7seg = 7'b0011001; // 4
            4'b0101: hex_to_7seg = 7'b0010010; // 5
            4'b0110: hex_to_7seg = 7'b0000010; // 6
            4'b0111: hex_to_7seg = 7'b1111000; // 7
            4'b1000: hex_to_7seg = 7'b0000000; // 8
            4'b1001: hex_to_7seg = 7'b0010000; // 9
            4'b1010: hex_to_7seg = 7'b0001000; // A
            4'b1011: hex_to_7seg = 7'b0000011; // B
            4'b1100: hex_to_7seg = 7'b1000110; // C
            4'b1101: hex_to_7seg = 7'b0100001; // D
            4'b1110: hex_to_7seg = 7'b0000110; // E
            4'b1111: hex_to_7seg = 7'b0001110; // F
            default: hex_to_7seg = 7'b1111111; // Invalid
        endcase
    endfunction



endmodule
