`include "4to1mux.v"

module eightto1mux(a, b, c, d, e, f, g, h, select, out);
input [2:0] select;
input [31:0] a, b, c, d, e, f, g, h;
output [31:0] out;

wire [31:0] w1;
wire [31:0] w2;

fourto1mux mux1(a, b, c, d, select[1:0], w1);
fourto1mux mux2(e, f, g, h, select[1:0], w2);

basemux finalmux(w1, w2, select[2], out);

endmodule