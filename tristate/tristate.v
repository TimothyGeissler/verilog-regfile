module tristate(in, oe, out);
input [31:0] in;
input oe; //oe = output enable
output [31:0] out;

assign out = oe ? in : 32'bz; //subtype of 2:1 mux

endmodule