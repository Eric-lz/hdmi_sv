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
    output reg [$clog2(WIDTH):0] p_x,
    output reg [$clog2(HEIGHT):0] p_y,
    output reg we,
    output reg done
    );

    reg running = 0;

    enum {READY, WAIT_VSYNC, WAIT_VDE, RUNNING, DONE} state;

     always_ff @(posedge pclk_in) begin
         case (state)
             READY: begin
                 p_x <= 0;
                 p_y <= 0;
                 we <= 0;
                 done <= 0;
                 if(start) state <= WAIT_VSYNC;
             end

             WAIT_VSYNC: begin
                 if(vsync_in) state <= WAIT_VDE;
             end

             WAIT_VDE: begin
                 if(vde_in) begin
//                     we <= 1;
//                     data_out <= data_in;
//                     p_x <= p_x + 1;
                     state <= RUNNING;
                 end
             end

             RUNNING: begin
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
            
             DONE: begin
                 we <= 0;
                 data_out <= 0;
                 done <= 1;
                 if(~start) state <= READY;
             end
         endcase
     end
     
endmodule
