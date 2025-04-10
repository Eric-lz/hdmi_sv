// RGB deserializer
// Takes image data and stores it into memory
// Grabs one frame every time the start signal is high

module rgb_deser #(
    parameter DATA_WIDTH = 8,
    parameter WIDTH = 640,
    parameter HEIGHT = 480
)(
    input [DATA_WIDTH-1:0] data_in,
    input pclk_in,
    input vsync_in,
    input vde_in,
    input start,
    
    output reg [DATA_WIDTH-1:0] data_out,
    output reg [$clog2(WIDTH):0] p_x,       // Pixel X address
    output reg [$clog2(HEIGHT):0] p_y,      // Pixel Y address
    output reg we,                          // Write enable
    output reg done
);

    reg running = 0;

    enum {READY, WAIT_VSYNC, RUNNING, DONE} state;

     always_ff @(posedge pclk_in) begin
         case (state)
            // ready to capture, waiting for start signal
            READY: begin
                p_x <= 0;
                p_y <= 0;
                we <= 0;
                done <= 0;
                if(start) state <= WAIT_VSYNC;
            end

            // waiting for the next frame to start (vsync pulse)
            WAIT_VSYNC: begin
                if(vsync_in) state <= RUNNING;
            end

            // capture started
            RUNNING: begin
            // write only when in active video
            if (vde_in) begin
                we <= 1;
                data_out <= data_in;
                if (p_x == WIDTH-1) begin
                    p_x <= 0;
                    p_y <= p_y + 1;
                end else begin
                    p_x <= p_x + 1;
                end
                if (p_x == WIDTH-1 & p_y == HEIGHT-1) begin
                    we <= 0;
                    state <= DONE;
                end
                end else begin
                    we <= 0;
                    data_out <= 0;
                    p_x <= p_x;
                    p_y <= p_y;
                    state <= RUNNING;
                end
            end
        
            // frame capture finished
            DONE: begin
                we <= 0;
                data_out <= 0;
                done <= 1;
                if(~start) state <= READY;
            end
         endcase
     end
     
endmodule
