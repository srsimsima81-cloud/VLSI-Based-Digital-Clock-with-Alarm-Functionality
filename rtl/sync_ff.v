module sync_ff(
    input clk,
    input async_in,
    output reg sync_out
);

reg q1;

always @(posedge clk)
begin
    q1 <= async_in;
    sync_out <= q1;
end

endmodule