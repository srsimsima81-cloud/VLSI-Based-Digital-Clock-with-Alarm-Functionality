module digital_clock_top(

input clk,
input rst,

input mode12,

input set_hour,
input set_minute,

input alarm_enable,

input [4:0] alarm_hour,
input [5:0] alarm_minute,

output [4:0] hour,
output [5:0] minute,
output [5:0] second,

output alarm_out,
output pm

);

wire sec_tick;
wire refresh_tick;

wire [4:0] display_hour;

clock_enable_gen clock_gen
(
    .clk(clk),
    .rst(rst),

    .sec_tick(sec_tick),
    .refresh_tick(refresh_tick)
);

time_keeper clock_core
(
    .clk(clk),
    .rst(rst),

    .sec_tick(sec_tick),

    .set_hour(set_hour),
    .set_minute(set_minute),

    .hour(hour),
    .minute(minute),
    .second(second)
);

mode_12_24 mode_converter
(
    .hour24(hour),
    .mode12(mode12),

    .display_hour(display_hour),
    .pm(pm)
);

alarm_controller alarm_unit
(
    .hour(hour),
    .minute(minute),

    .alarm_hour(alarm_hour),
    .alarm_minute(alarm_minute),

    .alarm_enable(alarm_enable),

    .alarm_out(alarm_out)
);

endmodule