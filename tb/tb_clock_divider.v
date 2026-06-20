`timescale 1ns/1ps

module tb_clock_divider;

reg clk;
reg rst;

wire tick;

clock_divider #(
    .DIV_VALUE(5)
)
dut
(
    .clk(clk),
    .rst(rst),
    .tick(tick)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("waveforms/clock_divider.vcd");
    $dumpvars(0,tb_clock_divider);

    clk = 0;
    rst = 1;

    #20;
    rst = 0;

    #500;

    $finish;

end

endmodule