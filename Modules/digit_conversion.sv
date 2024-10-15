`timescale 1ns / 1ps

module digit_conversion (
    input signed [5:0] data,        // 6-bit signed result from the ALU
    input display_mode,             // 0 (decimal), 1 (hex)
    output reg [3:0] digit0,        // Least significant digit (ones place in decimal mode)
    output reg [3:0] digit1,        // Second digit (tens place in decimal mode)
    output reg is_negative
);
    
    reg [5:0] magnitude_sign_data;
    logic [7:0] extended_data; 
    
    integer tens, ones;
    integer tens, ones;
      always @(*) begin 
        if (data[5]) begin 
            is_negative = 1;
            magnitude_sign_data = -data; 
        end else begin
            is_negative = 0;
            magnitude_sign_data = data;
        end
        
        if (display_mode == 0) begin 
            tens = magnitude_sign_data / 10;
            ones = magnitude_sign_data % 10;
            digit0 = ones[3:0];
            digit1 = tens[3:0];
        end else begin 
            extended_data = {2'b00, magnitude_sign_data}; 
            digit0 = extended_data[3:0];
            digit1 = extended_data[7:4];
        end
    end
endmodule
