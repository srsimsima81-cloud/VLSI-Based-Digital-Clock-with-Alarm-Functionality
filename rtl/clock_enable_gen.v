module clock_enable_gen
#(
    parameter ONE_SEC_DIV = 10,
    parameter REFRESH_DIV = 5
)
(
    input clk,
    input rst,

    output reg sec_tick,
    output reg refresh_tick
);

reg [31:0] sec_count;
reg [31:0] refresh_count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        sec_count <= 0;
        refresh_count <= 0;

        sec_tick <= 0;
        refresh_tick <= 0;
    end

    else
    begin

        sec_tick <= 0;
        refresh_tick <= 0;

        if(sec_count == ONE_SEC_DIV-1)
        begin
            sec_count <= 0;
            sec_tick <= 1;
        end
        else
            sec_count <= sec_count + 1;

        if(refresh_count == REFRESH_DIV-1)
        begin
            refresh_count <= 0;
            refresh_tick <= 1;
        end
        else
            refresh_count <= refresh_count + 1;

    end

end

endmodule