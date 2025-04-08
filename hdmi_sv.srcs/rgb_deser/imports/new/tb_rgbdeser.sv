`timescale 1ns / 1ns

module tb_rgb_deser;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter WIDTH = 640;
    parameter HEIGHT = 480;

    // Inputs
    reg [DATA_WIDTH-1:0] data_in;
    reg pclk_in;
    reg start;

    // Outputs
    wire [DATA_WIDTH-1:0] data_out;
    wire [$clog2(WIDTH)-1:0] p_x;
    wire [$clog2(HEIGHT)-1:0] p_y;
    wire we;

    // Instantiate the rgb_deser module
    rgb_deser #(
        .DATA_WIDTH(DATA_WIDTH),
        .WIDTH(WIDTH),
        .HEIGHT(HEIGHT)
    ) uut (
        .data_in(data_in),
        .pclk_in(pclk_in),
        .start(start),
        .data_out(data_out),
        .p_x(p_x),
        .p_y(p_y),
        .we(we)
    );

    // Clock generation for pclk_in
    always begin
        #5 pclk_in = ~pclk_in;  // Toggle every 5ns for a 100MHz pixel clock
    end

    // Stimulus generation
    initial begin
        // Initialize signals
        pclk_in = 0;
        start = 0;
        data_in = 8'b0;

        // Test sequence
        #10;
        
        // Set the start signal to begin capturing frame data
        start = 1;
        #10;
        start = 0;  // Start stays high for one clock cycle, capturing frame data

        // Apply some test data to data_in
        data_in = 8'hFF;  // Example data
        #10;

        // Apply more data to data_in and simulate frame capturing
        data_in = 8'hAA;
        #10;
        data_in = 8'h55;
        #10;
        data_in = 8'h00;
        #10;

        // Simulate a full frame capture cycle
        // This assumes WIDTH = 640 and HEIGHT = 480
        repeat (WIDTH * HEIGHT) begin
            data_in = $random;  // Random data input for each pixel
            #10;  // Simulate time for pixel clock (100MHz)
        end

        // Assert that we stopped capturing after HEIGHT rows
        #10;
        if (!we) begin
            $display("Test Passed: Frame capture stopped after %0d pixels", WIDTH * HEIGHT);
        end else begin
            $display("Test Failed: Frame capture did not stop correctly");
        end

        // End of test
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("At time %t, data_in=%h, data_out=%h, p_x=%d, p_y=%d, we=%b",
                 $time, data_in, data_out, p_x, p_y, we);
    end

endmodule
