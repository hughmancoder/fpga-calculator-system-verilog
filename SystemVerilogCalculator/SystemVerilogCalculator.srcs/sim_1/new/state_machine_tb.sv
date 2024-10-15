`timescale 1ns / 1ps

module state_machine_tb;
    reg clk;
    reg reset;
    reg confirm;

    
    wire [2:0] state;

    
    state_machine uut (
        .clk(clk),
        .reset(reset),
        .confirm(confirm),
        .state(state)
    );

    
    always #5 clk = ~clk;

    
    initial begin
        
        clk = 0;
        reset = 0;
        confirm = 0;

       
        reset = 1;
        #10;  
        reset = 0;
        
        
        $display("State after reset: %b", state);
        
        
        #10
        $display("State after 10 ns: %b", state);
        confirm = 1;  
        #10;
        confirm = 0;  
         
         
        confirm = 1;  
        #10;
        confirm = 0;  
        #20;


        $display("Final state: %b", state);
            if (state!== 3 ) begin
            $display("Test Failed, state is %d 3 (CALCULATE)", state);
        end else begin
            $display("Test Passed state is %d", state);
        end

        
        $stop;
    end
endmodule
