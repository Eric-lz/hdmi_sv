// Framebuffer memory module

module memory #(
    parameter DATA_WIDTH = 8,
    parameter WIDTH = 640,
    parameter HEIGHT = 480
)(
    input clk, rst,
    input [DATA_WIDTH-1:0] data_in,
    input [$clog2(WIDTH):0] waddr_x,        // Write X address
    input [$clog2(HEIGHT):0] waddr_y,       // Write Y address
    input we,                               // Write enable

    input [$clog2(WIDTH):0] raddr_x,        // Read X address
    input [$clog2(HEIGHT):0] raddr_y,       // Read Y address
    output reg [DATA_WIDTH-1:0] data_out
);
    
    localparam FRAME_SIZE = WIDTH * HEIGHT;
    
    // write address, read address
    int waddr, raddr;

    // BRAM Framebuffer
    (* ram_style = "bram" *) reg [DATA_WIDTH-1:0] pixel [FRAME_SIZE:0];

    // Read/write logic
    always_ff @(posedge clk) begin
        if(we) begin
            waddr = waddr_y * WIDTH + waddr_x;
            pixel[waddr] <= data_in;
        end

        raddr = raddr_y * WIDTH + raddr_x;
        data_out <= pixel[raddr];
    end

endmodule
