module basemux(a, b, select, out);
input select;
input [31:0] a, b;
output [31:0] out;

//output a if select = true, b if select = false
assign out = select ? b : a;
endmodule

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

module mux(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, select, out);
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

endmodule