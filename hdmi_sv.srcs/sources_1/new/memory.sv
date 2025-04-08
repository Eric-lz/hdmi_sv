// Framebuffer memory module

module memory #(
    parameter DATA_WIDTH = 8,
    parameter WIDTH = 640,
    parameter HEIGHT = 480
    )(
    input clk, rst,
    input [DATA_WIDTH-1:0] data_in,
    input [$clog2(WIDTH):0] waddr_x,
    input [$clog2(HEIGHT):0] waddr_y,
    input we,

    input [$clog2(WIDTH):0] raddr_x,
    input [$clog2(HEIGHT):0] raddr_y,
    output reg [DATA_WIDTH-1:0] data_out
    );
    
    localparam FRAME_SIZE = WIDTH * HEIGHT;
    
    int waddr, raddr;

    // Frame buffer
//    (* ram_style = "bram" *) reg [DATA_WIDTH-1:0] pixel [0:FRAME_SIZE-1];
    (* ram_style = "bram" *) reg [DATA_WIDTH-1:0] pixel [FRAME_SIZE:0];

    // Reset logic
    // Clear all memory
//    always_ff @(posedge rst) begin
//        if(rst) begin
//            for(int i=0; i<FRAME_SIZE; i=i+1) begin
//                pixel[i] <= 0;
//            end
//        end
//    end

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
