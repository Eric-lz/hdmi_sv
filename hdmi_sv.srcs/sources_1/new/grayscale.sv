// Convert RGB 24-bit input to grayscale 8-bit output

module grayscale(
    input [23:0] rgb_in,
    output reg [23:0] gray_out
    );
    
    reg [7:0] oitobits;
    
    always_comb begin
        oitobits = (rgb_in[23:16] + rgb_in[15:8] + rgb_in[7:0]) / 3;
//        oitobits = (rgb_in[23:12] + rgb_in[11:0]) / 2;
        gray_out = {oitobits, oitobits, oitobits};
        
    end
    
    // Luminance calculation
//    assign gray_out = res;
//    assign gray_out = rgb_in[7:0];
endmodule
