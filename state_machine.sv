module state_machine (
    input clk,
    input reset,
    input confirm,
    output reg [2:0] state
);
    typedef enum logic [2:0] {
        S0_IDLE      = 3'b000,
        S1_OP1       = 3'b001,
        S2_OP1_WR    = 3'b010,
        S3_OP2       = 3'b011,
        S4_OP2_WR    = 3'b100,
        S5_CALCULATE = 3'b101
    } state_t;

    state_t state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0_IDLE;
        end else begin
            case (state)
                S0_IDLE: begin
                    state <= S1_OP1;
                end
                S1_OP1: begin
                    if (confirm) state <= S2_OP1_WR;
                end
                S2_OP1_WR: begin
                    if (~confirm) state <= S3_OP2;
                end
                S3_OP2: begin
                    if (confirm) state <= S4_OP2_WR;
                end
                S4_OP2_WR: begin
                    if (~confirm) state <= S5_CALCULATE;
                end
                default: state <= S0_IDLE;
            endcase
        end
    end
endmodule