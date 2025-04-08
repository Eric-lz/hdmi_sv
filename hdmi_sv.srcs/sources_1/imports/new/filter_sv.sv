`timescale 1ns / 1ps

module filter_sv #(
    parameter DATA_WIDTH = 8,
    parameter WIDTH = 640,
    parameter HEIGHT = 480,
    parameter DEPTH = 8
    )(
    input clk,
    input valid,
    input [DATA_WIDTH-1:0] rgb_in,          // 24-bit RGB input from dvi2rgb
    output reg led,                         // LED
    output reg [DATA_WIDTH-1:0] rgb_out,    // 24-bit RGB output to dvi2rgb
    output reg [$clog2(WIDTH)-1:0] p_x,
    output reg [$clog2(HEIGHT)-1:0] p_y,
    output reg hsync_out, vsync_out
    );

    reg running;

    always_ff @(posedge valid) begin
        if(valid) begin
            p_x <= 0;
            p_y <= 0;
            running <= 1;
            led <= 0;
        end
    end

    always_ff @(posedge clk) begin
        if(running & valid) begin
            rgb_out <= ~rgb_in;

            if(p_x == WIDTH-1) begin
                p_x <= 0;
                p_y <= p_y + 1;
                hsync_out <= 1;
            end else begin
                p_x <= p_x + 1;
                hsync_out <= 0;
            end

            if(p_y == HEIGHT-1) begin
                vsync_out <= 1;
                running <= 0;
                led <= 1;
            end else begin
                vsync_out <= 0;
            end
        end else begin
            p_x <= 0;
            p_y <= 0;
            rgb_out <= 0;
            led <= 0;
        end
    end
    
endmodule
