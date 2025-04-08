`timescale 1ns / 1ns

module tb_serdes;
    
    parameter DATA_WIDTH = 8;       // Pixel depth
    parameter WIDTH = 8;          // Line width
    parameter HEIGHT = 4;         // Frame height
    parameter H_SYNC_WIDTH = 1;    // Horizontal sync pulse width
    parameter H_BACK_PORCH = 1;    // Horizontal back porch
    parameter H_FRONT_PORCH = 1;   // Horizontal front porch
    parameter V_SYNC_WIDTH = 1;     // Vertical sync pulse width
    parameter V_BACK_PORCH = 1;    // Vertical back porch
    parameter V_FRONT_PORCH = 1;    // Vertical front porch
    
    // Testbench signals
    logic [DATA_WIDTH-1:0] vid_in;
    logic PixelClk_i;
    logic vsync_in;
    logic vde_in;
    logic [7:0] sw;
    logic reset;
    
    logic [DATA_WIDTH-1:0] vid_out;
    logic hsync_out;
    logic vsync_out;
    logic vde_out;
    logic pixelclk;
    logic [7:0] led;
    
    // Instantiate the DUT (Device Under Test)
    serdes #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT),
        .H_SYNC_WIDTH(H_SYNC_WIDTH),
        .H_BACK_PORCH(H_BACK_PORCH),
        .H_FRONT_PORCH(H_FRONT_PORCH),
        .V_SYNC_WIDTH(V_SYNC_WIDTH),
        .V_BACK_PORCH(V_BACK_PORCH),
        .V_FRONT_PORCH(V_FRONT_PORCH)
    ) dut (
        .vid_in(vid_in),
        .PixelClk_i(PixelClk_i),
        .vsync_in(vsync_in),
        .vde_in(vde_in),
        .sw(sw),
        .reset(reset),
        .vid_out(vid_out),
        .hsync_out(hsync_out),
        .vsync_out(vsync_out),
        .vde_out(vde_out),
        .pixelclk(pixelclk),
        .led(led)
    );
    
    // Clock generation
    initial begin
        PixelClk_i = 0;
        forever #5 PixelClk_i = ~PixelClk_i; // 100 MHz clock
    end
    
    // Video signal
    initial begin
        #5 vid_in = 0;
        forever #10 vid_in = $random;
    end
    
    // Test stimulus
    initial begin
        // Initialize inputs
        sw = 0;
        reset = 0;
        vsync_in = 0;
        vde_in = 0;
        
        #20 reset = 1;
        #10 reset = 0;
        
        // Start simulation
        #30 sw[0] = 1; // Enable processing

        #30 vsync_in = 1;
        #10 vsync_in = 0;
        #20 vde_in = 1;

        #500 sw[0] = 0;

        #500 vde_in = 0;
        
        // Finish simulation
        #3000;
        $finish;
    end
    
    // Monitor signals
    initial begin
        $monitor("Time: %0t | vid_in: %h | vid_out: %h | LED: %b", $time, vid_in, vid_out, led);
    end
    
endmodule