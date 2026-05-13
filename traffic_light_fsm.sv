`timescale 1ns / 1ps
module traffic_light_fsm(
    input logic clk, rst,
    input logic [3:0] counter,
    output logic r, g
    );
    localparam state_red=2'd0;
    localparam state_green=2'd1;
    localparam state_yellow=2'd2;
    
    logic [1:0] state, state_next;
    
    always_comb begin
        case(state)
            state_red: begin
                if(counter==7) begin
                    state_next=state_green;
                end
                else begin
                    state_next=state_red;
                end
            end
            state_green: begin
                if(counter==13) begin
                    state_next=state_yellow;
                end
                else begin
                    state_next=state_green;
                end
            end
            state_yellow: begin
                if(counter==15) begin
                    state_next=state_red;
                end
                else begin
                    state_next=state_yellow;
                end
            end
            default: state_next=state_red;
        endcase
    end
    
    always_ff @(posedge clk, posedge rst) begin
        if(rst==1'b1) begin
            state <= state_red;
        end
        else begin
            state <= state_next;
        end
    end
    
    assign r = (state != state_green);
    assign g = (state != state_red);
    
endmodule
