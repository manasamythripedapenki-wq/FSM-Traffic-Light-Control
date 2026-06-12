`timescale 1ns/1ns
module traffic_fsm(
    input clk, reset,
    output reg [2:0] light
);

reg [1:0] s;

always @(posedge clk or posedge reset) begin
    if(reset)
        s <= 0;
    else
        s <= s + 1;
end

always @(*) begin
    case(s)
        0: light = 3'b100;
        1: light = 3'b010;
        2: light = 3'b001;
        default: light = 3'b100;
    endcase
end

endmodule
