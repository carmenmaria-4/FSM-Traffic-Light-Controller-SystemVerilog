`timescale 1ns / 1ps
module freq(
    input logic clk_100M, rst,
    output logic clk_1M
    );
    logic [31:0] counter;
    always_ff @(posedge clk_100M) begin
        if(rst == 1'b1) begin
            clk_1M <= 1'b0;
            counter <= 32'd0;
        end
        else begin
        //assign counter smaller value so it will simulate on vivado, 
        //when put on the fpga the value needs to be changed to 50*10^6;
            if (counter == 5-1) begin
                counter <= 32'd0;
                clk_1M <= ~clk_1M;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
