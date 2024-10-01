module tb_seven_segment_display;

    // Inputs
    reg [3:0] value;
    reg mode;  // Display mode: 0 for decimal, 1 for hexadecimal

    // Outputs
    wire [6:0] seg;
    wire [3:0] an;

    // Instantiate the seven-segment display decoder
    seven_segment_display uut (
        .value(value),
        .mode(mode),
        .seg(seg),
        .an(an)
    );

    initial begin
        // Initialize inputs
        value = 4'b0000;
        mode = 0;

        // Test decimal values
        #10 value = 4'b0000;  // Display 0
        #10 value = 4'b1001;  // Display 9
        #10 value = 4'b0011;  // Display 3

        // Test hexadecimal values
        mode = 1;
        #10 value = 4'b1010;  // Display A
        #10 value = 4'b1111;  // Display F
        #10 value = 4'b1100;  // Display C
        #10 value = 4'b0110;  // Display 6
        #10;
    end

endmodule
