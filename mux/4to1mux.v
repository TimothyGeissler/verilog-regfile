`include "basemux.v"

module fourto1mux(a, b, c, d, select, out);
input [1:0] select;
input [31:0] a, b, c, d;
output [31:0] out;

wire [31:0] w1;
wire [31:0] w2;

basemux in1(a, b, select[0], w1);
basemux in2(c, d, select[0], w2);

basemux outmux(w1, w2, select[1], out);

endmodule