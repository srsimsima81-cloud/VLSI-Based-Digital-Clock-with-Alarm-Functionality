module mode_12_24(

input [4:0] hour24,
input mode12,

output reg [4:0] display_hour,
output reg pm

);

always @(*)
begin

    if(!mode12)
    begin
        display_hour = hour24;
        pm = 0;
    end

    else
    begin

        if(hour24 == 0)
        begin
            display_hour = 12;
            pm = 0;
        end

        else if(hour24 < 12)
        begin
            display_hour = hour24;
            pm = 0;
        end

        else if(hour24 == 12)
        begin
            display_hour = 12;
            pm = 1;
        end

        else
        begin
            display_hour = hour24 - 12;
            pm = 1;
        end

    end

end

endmodule