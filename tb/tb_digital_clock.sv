`timescale 1ns/1ps

module tb_digital_clock;

reg clk;
reg rst;

reg mode12;

reg set_hour;
reg set_minute;

reg alarm_enable;

reg [4:0] alarm_hour;
reg [5:0] alarm_minute;

wire [4:0] hour;
wire [5:0] minute;
wire [5:0] second;

wire alarm_out;
wire pm;

digital_clock_top DUT
(
    .clk(clk),
    .rst(rst),

    .mode12(mode12),

    .set_hour(set_hour),
    .set_minute(set_minute),

    .alarm_enable(alarm_enable),

    .alarm_hour(alarm_hour),
    .alarm_minute(alarm_minute),

    .hour(hour),
    .minute(minute),
    .second(second),

    .alarm_out(alarm_out),
    .pm(pm)
);

always #5 clk = ~clk;

initial
begin

    $dumpfile("waveforms/digital_clock.vcd");
    $dumpvars(0,tb_digital_clock);

    clk = 0;
    rst = 1;

    mode12 = 0;

    set_hour = 0;
    set_minute = 0;

    alarm_enable = 1;

    alarm_hour = 0;
    alarm_minute = 1;

    #20;
    rst = 0;

    #15000;

    $display("Simulation Finished");

    $finish;

end

always @(posedge clk)
begin

    if(alarm_out)
    begin
        $display("ALARM TRIGGERED");
        $display("TIME = %0d:%0d:%0d",
                  hour,
                  minute,
                  second);
    end

end

endmodule