module serdes #(
    parameter DATA_WIDTH = 8,       // Pixel depth
    parameter WIDTH = 640,          // Line width
    parameter HEIGHT = 480         // Frame height
)(
    // Video input (output from DVI2RGB)
    input logic [DATA_WIDTH-1:0] vid_in,
    input logic pclk_in,
    input logic vsync_in,
    input logic vde_in,
    input logic start,
    input logic reset,

    // Video output (input to RGB2DVI)
    output logic [23:0] vid_out,
    output logic hsync_out,
    output logic vsync_out,
    output logic vde_out,
    output logic pclk_out,
    output logic led
);

    // Deserializer
    wire [DATA_WIDTH-1:0] rgb_in;
    wire [$clog2(WIDTH):0] pw_x;
    wire [$clog2(HEIGHT):0] pw_y;
    wire we;
    rgb_deser #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) rgb_deser (
        .data_in(vid_in),
        .pclk_in(pclk_in),
        .vsync_in(vsync_in),
        .vde_in(vde_in),
        .start(start),
        .data_out(rgb_in),
        .p_x(pw_x),
        .p_y(pw_y),
        .we(we),
        .done(led)
    );

    // Memory
    wire [DATA_WIDTH-1:0] mem_out;
    wire [$clog2(WIDTH):0] pr_x;
    wire [$clog2(HEIGHT):0] pr_y;
    memory #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) memory (
        .clk(pclk_in),
        .rst(reset),
        .data_in(rgb_in),
        .waddr_x(pw_x),
        .waddr_y(pw_y),
        .we(we),
        .raddr_x(pr_x),
        .raddr_y(pr_y),
        .data_out(mem_out)
    );

    // Serializer
    rgb_ser #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) rgb_ser (
        .clk(pclk_in),
        .reset(reset),
        .data_in(mem_out),
        .data_out(vid_out),
        .hsync_out(hsync_out),
        .vsync_out(vsync_out),
        .vde_out(vde_out),
        .pclk_out(pclk_out),
        .p_x(pr_x),
        .p_y(pr_y)
    );

endmodule
