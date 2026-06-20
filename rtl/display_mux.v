module display_mux(

input [4:0] hour,
input [5:0] minute,
input [5:0] second,

output [3:0] h_tens,
output [3:0] h_units,
output [3:0] m_tens,
output [3:0] m_units,
output [3:0] s_tens,
output [3:0] s_units

);

assign h_tens  = hour / 10;
assign h_units = hour % 10;

assign m_tens  = minute / 10;
assign m_units = minute % 10;

assign s_tens  = second / 10;
assign s_units = second % 10;

endmodule