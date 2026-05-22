module counter (input wire clk, 
                input wire rst_n, 
                output reg [3:0] count);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      out <= 4'b0000
      and else begin
        out <= out + 1b1
      end
    end

endmodule