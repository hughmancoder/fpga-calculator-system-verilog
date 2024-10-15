`timescale 1ns / 1ps
module display_control_tb;

    reg clk;
    reg signed [5:0] data;
    reg display_mode; 
    wire [6:0] seg;
    wire [3:0] an;

    
    display_control uut (
        .clk(clk),
        .data(data),
        .display_mode(display_mode),
        .seg(seg),
        .an(an)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    
    initial begin
        
        data = 0;
        display_mode = 0;

        
        #100;

        
        display_mode = 0; 

        data = 6'd15;  
        #1000;
        data = -6'd12; 
        #1000;
        data = 6'd31;  
        #1000;
        data = -6'd32; 
        #1000;

        
        display_mode = 1; 

        data = 6'd20;  
        #1000;
        data = -6'd5;  
        #1000;

        
        data = 6'd0;   
        #1000;
        data = -6'd1;  
        #1000;

        
        $stop;
    end

    
    initial begin
        $monitor("Time=%0dns | clk=%b | data=%d | display_mode=%b | seg=%b | an=%b",
                 $time, clk, data, display_mode, seg, an);
    end

endmodule
