module seven_segment_display(
    input [3:0] value,    
    input mode,           // Display mode: 0 for decimal, 1 for hexadecimal
    output reg [6:0] seg, // Seven-segment display segments
    output reg [3:0] an   // Seven-segment display enable
);

    always @(*) begin
        case (value)
            4'b0000: seg = 7'b1000000; // Display 0
            4'b0001: seg = 7'b1111001; // Display 1
            4'b0010: seg = 7'b0100100; // Display 2
            4'b0011: seg = 7'b0110000; // Display 3
            4'b0100: seg = 7'b0011001; // Display 4
            4'b0101: seg = 7'b0010010; // Display 5
            4'b0110: seg = 7'b0000010; // Display 6
            4'b0111: seg = 7'b1111000; // Display 7
            4'b1000: seg = 7'b0000000; // Display 8
            4'b1001: seg = 7'b0010000; // Display 9
            4'b1010: seg = 7'b0001000; // Display A (hex)
            4'b1011: seg = 7'b0000011; // Display B (hex)
            4'b1100: seg = 7'b1000110; // Display C (hex)
            4'b1101: seg = 7'b0100001; // Display D (hex)
            4'b1110: seg = 7'b0000110; // Display E (hex)
            4'b1111: seg = 7'b0001110; // Display F (hex)
            default: seg = 7'b1111111; // Blank
        endcase
    end

    always @(*) begin
        an = 4'b1110;  // Only enable the first display for simplicity
    end
endmodule
