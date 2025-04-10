// RGB Serializer
// Takes image data from memory and sends it pixel by pixel

// Video timings
// Uncomment at least one
`define GRAYSCALE
//`define VGA640
//`define SVGA800
`define HD720
//`define CUSTOM

module rgb_ser #(
    parameter DATA_WIDTH = 8,      // Pixel depth
    parameter WIDTH = 640,         // Line width
    parameter HEIGHT = 480         // Frame height

    `ifdef HD720
        ,
        parameter H_FRONT_PORCH = 110,  // Horizontal front porch
        parameter H_SYNC_WIDTH = 40,    // Horizontal sync pulse width
        parameter H_BACK_PORCH = 220,   // Horizontal back porch
        parameter V_FRONT_PORCH = 5,    // Vertical front porch
        parameter V_SYNC_WIDTH = 5,     // Vertical sync pulse width
        parameter V_BACK_PORCH = 20     // Vertical back porch
    `endif
    `ifdef VGA640
        ,
        parameter H_FRONT_PORCH = 16,   // Horizontal front porch
        parameter H_SYNC_WIDTH = 96,    // Horizontal sync pulse width
        parameter H_BACK_PORCH = 48,    // Horizontal back porch
        parameter V_FRONT_PORCH = 10,   // Vertical front porch
        parameter V_SYNC_WIDTH = 2,     // Vertical sync pulse width
        parameter V_BACK_PORCH = 33     // Vertical back porch
    `endif
    `ifdef SVGA800
        ,
        parameter H_FRONT_PORCH = 40,   // Horizontal front porch
        parameter H_SYNC_WIDTH = 128,    // Horizontal sync pulse width
        parameter H_BACK_PORCH = 88,    // Horizontal back porch
        parameter V_FRONT_PORCH = 1,   // Vertical front porch
        parameter V_SYNC_WIDTH = 4,     // Vertical sync pulse width
        parameter V_BACK_PORCH = 23     // Vertical back porch
    `endif
    `ifdef CUSTOM
        ,
        parameter H_FRONT_PORCH = 1,   // Horizontal front porch
        parameter H_SYNC_WIDTH = 1,    // Horizontal sync pulse width
        parameter H_BACK_PORCH = 1,    // Horizontal back porch
        parameter V_FRONT_PORCH = 1,   // Vertical front porch
        parameter V_SYNC_WIDTH = 1,    // Vertical sync pulse width
        parameter V_BACK_PORCH = 1     // Vertical back porch
    `endif
)(
    input logic clk,                        // Clock input
    input logic reset,                      // Active-high reset
    input logic [DATA_WIDTH-1:0] data_in,   // Data from the framebuffer (BRAM)
    
    output logic [23:0] data_out,           // Serialized pixel data output
    output logic hsync_out,                 // Horizontal sync signal
    output logic vsync_out,                 // Vertical sync signal
    output logic pclk_out,                  // Pixel clock
    output logic vde_out,                   // Active video
    output logic [$clog2(WIDTH):0] p_x,     // Read X address
    output logic [$clog2(HEIGHT):0] p_y     // Read Y address
);

    // Internal signal to track pixel position
    reg [$clog2(WIDTH):0] x_pos = 0;
    reg [$clog2(HEIGHT):0] y_pos = 0;
    reg hsync_reg = 0;
    reg vsync_reg = 0;
    reg vde_reg = 0;

    // Horizontal sync parameters
    localparam H_ACTIVE_VIDEO = WIDTH; // Active video width
    localparam H_TOTAL = H_ACTIVE_VIDEO + H_SYNC_WIDTH + H_BACK_PORCH + H_FRONT_PORCH; // Total line width (with sync and porch)
    localparam H_SYNC_PULSE_START = H_ACTIVE_VIDEO + H_FRONT_PORCH;
    localparam H_SYNC_PULSE_END = H_SYNC_PULSE_START + H_SYNC_WIDTH;
    
    // Vertical sync parameters
    localparam V_ACTIVE_VIDEO = HEIGHT; // Active video height
    localparam V_TOTAL = V_ACTIVE_VIDEO + V_SYNC_WIDTH + V_BACK_PORCH + V_FRONT_PORCH; // Total frame height (with sync and porch)
    localparam V_SYNC_PULSE_START = V_ACTIVE_VIDEO + V_FRONT_PORCH;
    localparam V_SYNC_PULSE_END = V_SYNC_PULSE_START + V_SYNC_WIDTH;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            x_pos <= 0;
            y_pos <= 0;
            p_x <= 0;
            p_y <= 0;
            hsync_reg <= 0;
            vsync_reg <= 0;
            vde_reg <= 0;
            data_out <= 0;
        end else begin
            // Horizontal sync logic
            if (x_pos < H_SYNC_PULSE_START) begin
                hsync_reg <= 0; // Assert HSYNC during sync pulse
            end else if (x_pos < H_SYNC_PULSE_END) begin
                hsync_reg <= 1;
            end else begin
                hsync_reg <= 0;
            end

            // Vertical sync logic
            if (y_pos < V_SYNC_PULSE_START) begin
                vsync_reg <= 0; // Assert HSYNC during sync pulse
            end else if (y_pos < V_SYNC_PULSE_END) begin
                vsync_reg <= 1;
            end else begin
                vsync_reg <= 0;
            end

            // Video data enable (vde) logic: Enable only during active video
            if ((x_pos < H_ACTIVE_VIDEO) && (y_pos < V_ACTIVE_VIDEO)) begin
                vde_reg <= 1;
                `ifdef GRAYSCALE
                    data_out <= {data_in, data_in, data_in};
                `else
                    data_out <= data_in;
                `endif
            end else begin
                vde_reg <= 0;
                data_out <= 0; // No valid data outside of active video area
            end

            // Update pixel position
            if (x_pos == H_TOTAL - 1) begin
                x_pos <= 0;
                if (y_pos == V_TOTAL - 1) begin
                    y_pos <= 0; // Reset Y position after one frame
                end else begin
                    y_pos <= y_pos + 1;
                end
            end else begin
                x_pos <= x_pos + 1;
            end

            // Update pixel address signal
            if (x_pos < H_ACTIVE_VIDEO) begin
                p_x <= x_pos;
            end// Update pixel address signal
            if (y_pos < V_ACTIVE_VIDEO) begin
                p_y <= y_pos;
            end
        end
    end

    // Assign outputs
    assign hsync_out = hsync_reg;
    assign vsync_out = vsync_reg;
    assign vde_out = vde_reg;
    assign pclk_out = clk;
endmodule
