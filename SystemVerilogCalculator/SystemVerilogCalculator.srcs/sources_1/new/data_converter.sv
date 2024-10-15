module data_converter (
    input signed [5:0] data,
    input display_mode, // 0 (dec), 1 (hex)
    output reg [3:0] digit0,
    output reg [3:0] digit1,
    output reg [3:0] digit2
);
    reg [5:0] magnitude_data;
    reg is_negative;
    reg [7:0] extended_data;
    integer tens, ones;

    always @(*) begin
        if (data[5]) begin 
            is_negative = 1;
            magnitude_data = -data;
        end else begin
            is_negative = 0;
            magnitude_data = data;
        end

        if (display_mode == 0) begin 
            tens = magnitude_data / 10;
            ones = magnitude_data % 10;
            digit0 = ones[3:0];
            digit1 = tens[3:0];
            digit2 = is_negative ? 4'hE : 4'hF; // '-' or blank
        end else begin  
            extended_data = {2'b00, magnitude_data}; 
            digit0 = extended_data[3:0];
            digit1 = extended_data[7:4];
            digit2 = is_negative ? 4'hE : 4'hF;  // '-' or blank
        end
    end
endmodule
