`timescale 1ns / 1ps

module filter_sv(
    input sw,                           // Switch
    input [23:0] rgb_in,                // 24-bit RGB input from dvi2rgb
    input hsync_in, vsync_in,           
    input vde_in,                       // Blanking interval
    input pclk_in,                      // Pixel clock input
    output reg led,                     // LED
    output reg [23:0] rgb_out,          // 24-bit RGB output to dvi2rgb
    output reg hsync_out, vsync_out,
    output reg vde_out,                 // Blanking interval
    output reg pclk_out                 // Pixel clock output
);

    always_comb begin
        led = sw;
        hsync_out = hsync_in;
        vsync_out = vsync_in;
        vde_out = vde_in;
        
        if (sw) begin
            rgb_out = ~rgb_in;
        end else begin
            rgb_out = rgb_in;
        end
        
        pclk_out = pclk_in;
    end
    
endmodule
