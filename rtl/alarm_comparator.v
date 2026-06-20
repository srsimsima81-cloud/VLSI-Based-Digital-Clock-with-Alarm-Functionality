module alarm_comparator(

input [4:0] hour,
input [5:0] minute,

input [4:0] alarm_hour,
input [5:0] alarm_minute,

input alarm_enable,

output alarm_out

);

assign alarm_out =
alarm_enable &&
(hour == alarm_hour) &&
(minute == alarm_minute);

endmodule