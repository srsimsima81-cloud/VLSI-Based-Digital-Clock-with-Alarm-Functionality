module snooze_controller(

input [4:0] alarm_hour,
input [5:0] alarm_minute,

output reg [4:0] snooze_hour,
output reg [5:0] snooze_minute

);

always @(*)
begin

    snooze_hour = alarm_hour;
    snooze_minute = alarm_minute + 5;

    if(snooze_minute >= 60)
    begin

        snooze_minute = snooze_minute - 60;

        if(alarm_hour == 23)
            snooze_hour = 0;
        else
            snooze_hour = alarm_hour + 1;

    end

end

endmodule