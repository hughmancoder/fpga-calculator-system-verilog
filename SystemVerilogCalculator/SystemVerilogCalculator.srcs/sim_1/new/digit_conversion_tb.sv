`timescale 1ns / 1ps
module digit_conversion_tb;
    reg signed [5:0] data;
    reg display_mode;
    wire [3:0] digit0;
    wire [3:0] digit1;
    wire is_negative;
    
    
    digit_conversion dut (
        .data(data),
        .display_mode(display_mode),
        .digit0(digit0),
        .digit1(digit1),
        .is_negative(is_negative)
    );
    
    initial begin
        // decimal positive number
        data = 6'd23;  
        display_mode = 1'b0;  
        #10;
        $display("Test Case 1: Data = %0d, Expected digit0 = 3, Expected digit1 = 2, Expected is_negative = 0", data);
        if (digit0 !== 3 || digit1 !== 2 || is_negative !== 0) begin
            $display("Test Case 1 Failed: digit0 = %0d, digit1 = %0d, is_negative = %0b", digit0, digit1, is_negative);
        end else begin
            $display("Test Case 1 Passed");
        end
        
        // decimal negative number
        data = -6'd14;  
        display_mode = 1'b0;  
        #10;
        $display("Test Case 2: Data = %0d, Expected digit0 = 5, Expected digit1 = 4, Expected is_negative = 1", data);
        if (digit0 !== 4 || digit1 !== 1 || is_negative !== 1) begin
            $display("Test Case 2 Failed: digit0 = %0d, digit1 = %0d, is_negative = %0b", digit0, digit1, is_negative);
        end else begin
            $display("Test Case 2 Passed");
        end

        // hex positive number
        data = 6'd30;  
        display_mode = 1'b1;  
        #10;
        $display("Test Case 3: Data = %0d, Expected digit0 = E, Expected digit1 = 1, Expected is_negative = 0", data);
        if (digit0 !== 4'hE || digit1 !== 4'h1 || is_negative !== 0) begin
            $display("Test Case 3 Failed: digit0 = %0h, digit1 = %0h, is_negative = %0b", digit0, digit1, is_negative);
        end else begin
            $display("Test Case 3 Passed");
        end

        // hex negative number 
        data = -6'd15;  
        display_mode = 1'b1;  
        #10;
        $display("Test Case 4: Data = %0d, Expected digit0 = F, Expected digit1 = E, Expected is_negative = 1", data);
        if (digit0 !== 4'hF || is_negative !== 1) begin
            $display("Test Case 4 Failed: digit0 = %0h, digit1 = %0h, is_negative = %0b", digit0, digit1, is_negative);
        end else begin
            $display("Test Case 4 Passed");
        end
        $finish;
    end

endmodule
