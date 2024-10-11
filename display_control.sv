module display_control (
    input clk,
    input signed [5:0] data,        // 6-bit signed result from the ALU
    input display_mode,             // 0 (decimal), 1 (hex)
    output reg [6:0] seg,           // Segment control
    output reg [3:0] an             // Anode control (which display to activate)
);
    
    localparam [6:0] NEG_SIGN_SEG = 7'b0111111;  
    localparam [6:0] BLANK_SEG = 7'b1111111;     
    reg [19:0] refresh_counter = 0; // counter for multiplexing
    reg [1:0] digit_select;

    wire [3:0] digit0, digit1;    
    wire is_negative;            

    // Instantiate digit_conversion module
    digit_conversion convert_digits (
        .data(data),
        .display_mode(display_mode),
        .digit0(digit0),
        .digit1(digit1),
        .is_negative(is_negative)
    );

    // Refresh counter for multiplexing
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
        digit_select <= refresh_counter[19:18]; 
    end

    // Multiplexing logic to drive the 7-segment display
    always @(*) begin
        case (digit_select)
            2'b00: begin
                an = 4'b1110; // AN0: rightmost digit
                seg = display_mode ? hex_to_7seg(digit0) : dec_to_7seg(digit0);
            end
            2'b01: begin
                an = 4'b1101; // AN1
                seg = display_mode ? hex_to_7seg(digit1) : dec_to_7seg(digit1);
            end
            2'b10: begin
                an = 4'b1011; // AN2
                seg = is_negative ? NEG_SIGN_SEG : BLANK_SEG;
            end
            2'b11: begin
                an = 4'b0111; // AN3 
                seg = BLANK_SEG; 
            end
        endcase
    end

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
                default: dec_to_7seg = 7'b1111111; 
            endcase
        end
    endfunction

    function [6:0] hex_to_7seg;
        input [3:0] bin;
        begin
            case (bin)
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
                default: hex_to_7seg = 7'b1111111; // Blank
            endcase
        end
    endfunction
endmodule
