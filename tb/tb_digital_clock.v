`timescale 1ns/1ps

module tb_digital_clock;

reg clk;
reg rst;

reg alarm_enable;
reg [4:0] alarm_hour;
reg [5:0] alarm_minute;

wire [4:0] hour;
wire [5:0] minute;
wire [5:0] second;

wire alarm_out;

digital_clock_top dut(

    .clk(clk),
    .rst(rst),

    .alarm_enable(alarm_enable),
    .alarm_hour(alarm_hour),
    .alarm_minute(alarm_minute),

    .hour(hour),
    .minute(minute),
    .second(second),

    .alarm_out(alarm_out)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("waveforms/digital_clock.vcd");
    $dumpvars(0,tb_digital_clock);

    clk = 0;
    rst = 1;

    alarm_enable = 1;

    alarm_hour = 0;
    alarm_minute = 1;

    #20;
    rst = 0;

    #15000;

    $finish;

end

endmodule