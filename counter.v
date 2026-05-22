module (clk,
        rst_n,
        count);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        count <= 0;
    else
        count <= count + 1;
end