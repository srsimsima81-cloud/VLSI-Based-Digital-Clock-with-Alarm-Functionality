module time_keeper(

input clk,
input rst,
input sec_tick,

input set_hour,
input set_minute,

output reg [4:0] hour,
output reg [5:0] minute,
output reg [5:0] second

);

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        hour <= 0;
        minute <= 0;
        second <= 0;
    end

    else if(set_hour)
    begin

        if(hour == 23)
            hour <= 0;
        else
            hour <= hour + 1;

    end

    else if(set_minute)
    begin

        if(minute == 59)
            minute <= 0;
        else
            minute <= minute + 1;

    end

    else if(sec_tick)
    begin

        if(second == 59)
        begin

            second <= 0;

            if(minute == 59)
            begin

                minute <= 0;

                if(hour == 23)
                    hour <= 0;
                else
                    hour <= hour + 1;

            end

            else
                minute <= minute + 1;

        end

        else
            second <= second + 1;

    end

end

endmodule