/*
Basic 2:1 32-bit multiplexer unit
*/
module basemux(a, b, select, out);
input select;
input [31:0] a, b;
output [31:0] out;

//output a if select = true, b if select = false
assign out = select ? b : a;
endmodule