module display_control (
    input clk,
    input signed [5:0] data,        // 6-bit signed result from the ALU
    input display_mode,             // 0 (decimal), 1 (hex)
    output reg [6:0] seg,           // Segment control
    output reg [3:0] an             // Anode control (which display to activate)
);
    reg [3:0] digit0, digit1, digit2, digit3;
    reg [19:0] refresh_counter; // 20-bit counter for multiplexing
    reg [1:0] digit_select;
    reg [5:0] abs_data;
    reg is_negative;
    reg [7:0] extended_data;
    integer tens, ones;

    // Decimal to 7-segment encoding function
    function [6:0] dec_to_7seg;
        input [3:0] bin;
        begin
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
                4'b1110: dec_to_7seg = 7'b0111111; // '-' (negative sign)
                4'b1111: dec_to_7seg = 7'b1111111; // Blank
                default: dec_to_7seg = 7'b1111111; // Invalid
            endcase
        end
    endfunction

    // Hexadecimal to 7-segment encoding function
    function [6:0] hex_to_7seg;
        input [3:0] hex;
        begin
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
        end
    endfunction

    // Determine absolute value and sign
    always @(*) begin
        if (data < 0) begin
            abs_data = -data;
            is_negative = 1;
        end else begin
            abs_data = data;
            is_negative = 0;
        end
    end

    // Calculate digits to display
    always @(*) begin
        if (display_mode == 0) begin // Decimal mode
            tens = abs_data / 10;
            ones = abs_data % 10;
            digit0 = ones[3:0];
            digit1 = tens[3:0];
            digit2 = is_negative ? 4'hE : 4'hF; // '-' sign or blank
            digit3 = 4'hF; // Blank
        end else begin // Hex mode
            extended_data = { {2{data[5]}}, data[5:0] }; // Sign-extend to 8 bits
            digit0 = extended_data[3:0];
            digit1 = extended_data[7:4];
            digit2 = 4'hF; // Blank
            digit3 = 4'hF; // Blank
        end
    end

    // Refresh counter for multiplexing
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        digit_select <= refresh_counter[19:18]; // Adjust bits for refresh rate
    end

    // Multiplexing logic to drive the 7-segment display
    always @(*) begin
        case (digit_select)
            2'b00: begin
                an = 4'b1110; // Activate AN0 (rightmost digit)
                seg = display_mode ? hex_to_7seg(digit0) : dec_to_7seg(digit0);
            end
            2'b01: begin
                an = 4'b1101; // Activate AN1
                seg = display_mode ? hex_to_7seg(digit1) : dec_to_7seg(digit1);
            end
            2'b10: begin
                an = 4'b1011; // Activate AN2
                seg = display_mode ? hex_to_7seg(digit2) : dec_to_7seg(digit2);
            end
            2'b11: begin
                an = 4'b0111; // Activate AN3 (leftmost digit)
                seg = display_mode ? hex_to_7seg(digit3) : dec_to_7seg(digit3);
            end
        endcase
    end
endmodule
