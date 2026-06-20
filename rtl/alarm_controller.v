module alarm_controller(

input [4:0] hour,
input [5:0] minute,

input [4:0] alarm_hour,
input [5:0] alarm_minute,

input alarm_enable,

output reg alarm_out

);

always @(*)
begin

    if(alarm_enable &&
       hour == alarm_hour &&
       minute == alarm_minute)
        alarm_out = 1;

    else
        alarm_out = 0;

end

endmodule