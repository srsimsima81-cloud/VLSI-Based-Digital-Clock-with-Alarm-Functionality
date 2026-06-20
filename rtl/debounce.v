module debounce
#(
    parameter COUNT_MAX = 100000
)
(
    input clk,
    input rst,
    input noisy_in,
    output reg clean_out
);

reg [31:0] count;
reg state;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        count <= 0;
        state <= 0;
        clean_out <= 0;
    end

    else
    begin

        if(noisy_in != state)
        begin
            count <= count + 1;

            if(count >= COUNT_MAX)
            begin
                state <= noisy_in;
                clean_out <= noisy_in;
                count <= 0;
            end
        end

        else
            count <= 0;

    end

end

endmodule