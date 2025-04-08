`timescale 1ns / 1ns

module tb_rgbser;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter WIDTH = 640;
    parameter HEIGHT = 480;
    
    // Testbench signals
    reg clk;
    reg reset;
    reg [DATA_WIDTH-1:0] data_in;

    wire [DATA_WIDTH-1:0] data_out;
    wire hsync_out;
    wire vsync_out;
    wire vde_out;
    wire [$clog2(WIDTH)-1:0] p_x;
    wire [$clog2(HEIGHT)-1:0] p_y;

    // Instantiate the framebuffer_serializer
    rgb_ser #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out),
        .hsync_out(hsync_out),
        .vsync_out(vsync_out),
        .vde_out(vde_out),
        .p_x(p_x),
        .p_y(p_y)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 100MHz clock
    end

    // Initial block for stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        data_in = 0;

        // Apply reset
        reset = 1;
        #10 reset = 0;

        // Write pixel data to BRAM (simulating frame data)
        // Let's set the first few pixels to a value
        data_in = 8'hAB;  // Set some test data
        // Simulate a few frames of data
        for (int i = 0; i < HEIGHT; i++) begin
            // Cycle through 640 pixels in one row (active video region)
            for (int x = 0; x < WIDTH; x++) begin
                // Apply data to BRAM and toggle pixel clock
                #10;
                data_in = 8'hCD; // Here, we can simulate different pixel values for testing
            end

            #10;
        end

        // Check output after some time to verify the behavior
        #150;

        // End simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time: %t, p_x: %d, p_y: %d, data_out: %h, hsync_out: %b, vsync_out: %b, vde_out: %b",
                 $time, p_x, p_y, data_out, hsync_out, vsync_out, vde_out);
    end

endmodule