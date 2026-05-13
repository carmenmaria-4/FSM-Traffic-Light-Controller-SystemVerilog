`timescale 1ns / 1ps
module top(
    input logic clk_100M, rst,
    output logic r, g
    );
    logic out_freq;
    logic [3:0] out_counter;
    
    freq freq_0(
    .clk_100M(clk_100M),
    .rst(rst),
    .clk_1M(out_freq)
    );
    counter counter0(
    .clk(out_freq),
    .rst(rst),
    .counter(out_counter)
    );
    traffic_light_fsm fsm_0(
    .clk(out_freq),
    .rst(rst),
    .counter(out_counter),
    .r(r),
    .g(g)
    );
endmodule
