// Convert RGB 24-bit input to grayscale 8-bit output

module grayscale(
    input [23:0] rgb_in,
    output reg [7:0] gray_out
    );
    
    // Luminance calculation
    assign gray_out = (rgb_in[23:16] + rgb_in[15:8] + rgb_in[7:0]) / 3;
    
endmodule
