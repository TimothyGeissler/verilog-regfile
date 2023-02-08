module tristate(in, oe, out);
input in, oe; //oe = output enable
output out;

assign out = oe ? in : 1'bz; //subtype of 2:1 mux

endmodule