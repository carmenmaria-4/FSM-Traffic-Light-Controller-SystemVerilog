`timescale 1ns / 1ps
module counter(
    input logic rst, clk,
    output logic [31:0] counter
    );
    always_ff @(posedge clk, posedge rst) begin
        if(rst == 1'b1) begin
            counter <= 32'd0;
        end
        else begin
            counter <= counter + 32'd1;
        end
    end
endmodule
