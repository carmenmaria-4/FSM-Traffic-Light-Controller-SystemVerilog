`timescale 1ns / 1ps
module tb();
logic clk_100M, rst, r, g;
top top_0(.*);

initial begin
    clk_100M=0;
    forever #5 clk_100M=~clk_100M;
end
initial begin
    rst=0;
    
    @(negedge clk_100M)
    rst=1;
    @(negedge clk_100M)
    rst=0;
    
    repeat(200) @(posedge clk_100M);
    $stop();
end
endmodule
