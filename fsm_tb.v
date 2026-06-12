module traffic_fsm_tb;

reg clk, reset;
wire [2:0] light;

traffic_fsm dut (
    .clk(clk),
    .reset(reset),
    .light(light)
);


always #5 clk = ~clk;

initial begin
  $timeformat(-9,0,"",5);
    $dumpfile("wave.vcd");   
    $dumpvars(0, traffic_fsm_tb);
  $monitor("Time=%t|Clock=%b|Reset=%b|Light=%b",$time,clk,reset,light);
    clk = 0;
    reset = 1;

    #10 reset = 0;

    #100 $finish;
end

endmodule
