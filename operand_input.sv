module operand_input (
    input [3:0] sw,             
    input confirm, clk, reset,
    output reg [3:0] operand1, operand2,
    output reg selecting_op1, selecting_op2  
);

    
    typedef enum logic [2:0] {
        IDLE = 3'b000,        
        OP1 = 3'b001,         
        OP1_RELEASE = 3'b010, 
        OP2 = 3'b011,         
        OP2_RELEASE = 3'b100, 
        DONE = 3'b101         
    } state_t;

    state_t current_state, next_state;

    // Commented out debouncing logic
    /*
    reg button_pressed;         // Register for button press detection

    // Button debounce logic (commented out)
    reg [15:0] debounce_count;
    always @(posedge clk) begin
        if (confirm == 1'b1) begin
            if (debounce_count < 16'hFFFF)
                debounce_count <= debounce_count + 1;
            else
                button_pressed <= 1'b1;  // Button press registered after debounce
        end else begin
            debounce_count <= 0;
            button_pressed <= 1'b0;      // Reset debounce logic on button release
        end
    end
    */

    // Directly use `confirm` signal as button press without debouncing
    wire button_pressed = confirm;

    // State machine for operand selection with release states
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            operand1 <= 4'b0000;
            operand2 <= 4'b0000;
        end else begin
            current_state <= next_state;
        end
    end

    // State transitions with press and release states
    always @(*) begin
        next_state = current_state;  
        case (current_state)
            IDLE: begin
                next_state = OP1;  
            end
            OP1: begin
                if (button_pressed) begin
                    next_state = OP1_RELEASE;  
                end
            end
            OP1_RELEASE: begin
                if (!button_pressed) begin
                    next_state = OP2;  
                end
            end
            OP2: begin
                if (button_pressed) begin
                    next_state = OP2_RELEASE;  
                end
            end
            OP2_RELEASE: begin
                if (!button_pressed) begin
                    next_state = DONE;  
                end
            end
            DONE: begin
                // Stay in done state until reset
            end
        endcase
    end

    always @(posedge clk) begin
        selecting_op1 <= 0;
        selecting_op2 <= 0;

        case (current_state)
            OP1: begin
                selecting_op1 <= 1;  // Indicate selecting operand 1
                if (button_pressed)
                    operand1 <= sw;  // Store operand 1 on button press
            end
            OP2: begin
                selecting_op2 <= 1;  // Indicate selecting operand 2
                if (button_pressed)
                    operand2 <= sw;  // Store operand 2 on button press
            end
            default: begin
                // No action in other states (IDLE, OP1_RELEASE, OP2_RELEASE, DONE)
            end
        endcase
    end

endmodule
