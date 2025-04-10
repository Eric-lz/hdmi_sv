// HDMI BRAM Framebuffer

/// Grayscale (8-bit) or color (24-bit)
// GRAYSCALE has to be defined in rgb_ser.sv also
//`define GRAYSCALE

// Resolution timings must be set in rgb_ser.sv

module top #(
    parameter DATA_WIDTH = 24,
    parameter WIDTH = 800,
    parameter HEIGHT = 600
)(
    // Clock
    input logic clk,
    
    // HDMI input
    input logic hdmi_rx_clk_n,
    input logic hdmi_rx_clk_p,
    input logic [2:0] hdmi_rx_n,
    input logic [2:0] hdmi_rx_p,
    inout logic hdmi_rx_scl,
    inout logic hdmi_rx_sda,
    output logic hdmi_rx_txen,
    output logic hdmi_rx_hpa,
    
    // HDMI output
    output logic hdmi_tx_clk_n,
    output logic hdmi_tx_clk_p,
    output logic [2:0] hdmi_tx_n,
    output logic [2:0] hdmi_tx_p,
    
    // LEDs
    output logic [7:0] led,
    
    // Switches
    input logic [7:0] sw,
    
    // Center button
    input logic btnc
);

    wire reset;
    assign reset = sw[1];
    assign led[1] = reset;
    
    // Clocking wizard
    clk_wiz_0 clk_wiz (
        // Clock out ports
        .clk_out1(clk_200M),     // output clk_out1
        // Status and control signals
        .reset(reset),          // input reset
        .locked(),              // output locked
        // Clock in ports
        .clk_in1(clk)       // input clk_in1
    );

    // HDMI DDC signals
    wire hdmi_rx_scl_i, hdmi_rx_scl_o, hdmi_rx_scl_t;
    wire hdmi_rx_sda_i, hdmi_rx_sda_o, hdmi_rx_sda_t;
    IOBUF hdmi_rx_scl_iobuf
       (.I(hdmi_rx_scl_o),
        .IO(hdmi_rx_scl),
        .O(hdmi_rx_scl_i),
        .T(hdmi_rx_scl_t)
    );
    IOBUF hdmi_rx_sda_iobuf
       (.I(hdmi_rx_sda_o),
        .IO(hdmi_rx_sda),
        .O(hdmi_rx_sda_i),
        .T(hdmi_rx_sda_t)
    );
    
    // HDMI HPA
    assign hdmi_rx_txen = 1;
    assign hdmi_rx_hpa = 1;

    // Video input (output from DVI2RGB)
    wire [23:0] vid_in;
    wire vde_in;
    wire hsync_in;
    wire vsync_in;
    wire pclk_in;
    wire aPixelClkLckd_i;
    wire pLocked_i;

    // DVI to RGB
    dvi2rgb_0 dvi2rgb (
        .TMDS_Clk_p(hdmi_rx_clk_p),     // input wire TMDS_Clk_p
        .TMDS_Clk_n(hdmi_rx_clk_n),     // input wire TMDS_Clk_n
        .TMDS_Data_p(hdmi_rx_p),        // input wire [2 : 0] TMDS_Data_p
        .TMDS_Data_n(hdmi_rx_n),        // input wire [2 : 0] TMDS_Data_n
        .RefClk(clk_200M),              // input wire RefClk
        .aRst(reset),                   // input wire aRst
        .vid_pData(vid_in),          // output wire [23 : 0] vid_pData
        .vid_pVDE(vde_in),            // output wire vid_pVDE
        .vid_pHSync(hsync_in),        // output wire vid_pHSync
        .vid_pVSync(vsync_in),        // output wire vid_pVSync
        .PixelClk(pclk_in),            // output wire PixelClk
        .aPixelClkLckd(aPixelClkLckd_i),  // output wire aPixelClkLckd
        .pLocked(pLocked_i),              // output wire pLocked
        .SDA_I(hdmi_rx_sda_i),          // input wire SDA_I
        .SDA_O(hdmi_rx_sda_o),          // output wire SDA_O
        .SDA_T(hdmi_rx_sda_t),          // output wire SDA_T
        .SCL_I(hdmi_rx_scl_i),          // input wire SCL_I
        .SCL_O(hdmi_rx_scl_o),          // output wire SCL_O
        .SCL_T(hdmi_rx_scl_t),          // output wire SCL_T
        .pRst(reset)                     // input wire pRst
    );

    // Grayscale converter
`ifdef GRAYSCALE
    wire [7:0] gray_out;
    grayscale gray (
        .rgb_in(vid_in),
        .gray_out(gray_out)
    );
`endif

    // Serializer output (BRAM)
    reg [23:0] ser_out;
    reg hsync_ser, vsync_ser;
    reg vde_ser, pclk_ser;
    
    // Serializer/Deserializer wrapper
    // Writes frame into BRAM and outputs its contents
    serdes #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) serdes (
`ifdef GRAYSCALE
        .vid_in(gray_out),
`else
        .vid_in(vid_in),
`endif
        .pclk_in(pclk_in),
        .vsync_in(vsync_in),
        .vde_in(vde_in),
        .start(btnc),
        .reset(reset),
        .vid_out(ser_out),
        .hsync_out(hsync_ser),
        .vsync_out(vsync_ser),
        .vde_out(vde_ser),
        .pclk_out(pclk_ser),
        .led(led[0])
    );
    
    // Output to RGB2DVI
    reg [23:0] vid_out;
    reg hsync_out, vsync_out;
    reg vde_out, pclk_out;
    
    // HDMI bypass
    always_ff @(pclk_in or pclk_ser) begin
        if(sw[0])begin
            vid_out <= ser_out;
            hsync_out <= hsync_ser;
            vsync_out <= vsync_ser;
            vde_out <= vde_ser;
            pclk_out <= pclk_ser;
        end else begin
            vid_out <= vid_in;
            hsync_out <= hsync_in;
            vsync_out <= vsync_in;
            vde_out <= vde_in;
            pclk_out <= pclk_in;
        end
    end

    // RGB to DVI
    rgb2dvi_0 rgb2dvi (
        .TMDS_Clk_p(hdmi_tx_clk_p),     // output wire TMDS_Clk_p
        .TMDS_Clk_n(hdmi_tx_clk_n),     // output wire TMDS_Clk_n
        .TMDS_Data_p(hdmi_tx_p),        // output wire [2 : 0] TMDS_Data_p
        .TMDS_Data_n(hdmi_tx_n),        // output wire [2 : 0] TMDS_Data_n
        .aRst(reset),                   // input wire aRst
        .vid_pData(vid_out),            // input wire [23 : 0] vid_pData
        .vid_pVDE(vde_out),          // input wire vid_pVDE
        .vid_pHSync(hsync_out),      // input wire vid_pHSync
        .vid_pVSync(vsync_out),      // input wire vid_pVSync
        .PixelClk(pclk_out)           // input wire PixelClk
    );
    
endmodule
