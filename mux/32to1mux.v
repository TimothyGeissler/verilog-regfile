`include "8to1mux.v"

module three2to1mux(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, select, out);
input [4:0] select;
input [31:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af;
output [31:0] out;

wire [31:0] w1;
wire [31:0] w2;
wire [31:0] w3;
wire [31:0] w4;

eightto1mux mux1(a, b, c, d, e, f, g, h, select[2:0], w1);
eightto1mux mux2(i, j, k, l, m, n, o, p, select[2:0], w2);
eightto1mux mux3(q, r, s, t, u, v, w, x, select[2:0], w3);
eightto1mux mux4(y, z, aa, ab, ac, ad, ae, af, select[2:0], w4);

fourto1mux comb(w1, w2, w3, w4, select[4:3], out);

endmodule;