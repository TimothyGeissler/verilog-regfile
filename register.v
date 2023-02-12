module dffe(q, d, clk, en, clr);
   
   //Inputs
   input d, clk, en, clr;
   
   //Internal wire
   wire clr;

   //Output
   output q;
   
   //Register
   reg q;

   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk or posedge clr) begin
       //If clear is high, set q to 0
       if (clr) begin
           q <= 1'b0;
       //If enable is high, set q to the value of d
       end else if (en) begin
           q <= d;
       end
   end
endmodule

module tristate(in, oe, out);
input in, oe; //oe = output enable
output out;

assign out = oe ? in : 1'bz; //subtype of 2:1 mux

endmodule

module register(in, wEnable, rEnable, clk, reset, out);
input [31:0] in;
input wEnable, rEnable, clk, reset; //rEnable = output enable, wEnable = input enable
output [31:0] ff_out, out;

wire clk_wEnable;

//Generate 32 flipflops
genvar i;
generate
    for (i=0; i<32; i=i+1) begin: loop1
        dffe a_dff(.d(in[i]), .q(ff_out[i]), .clr(reset), .en(wEnable), .clk(clk)); //not sure about .clrn param
        tristate t(ff_out[i], rEnable, out[i]);
    end
endgenerate


endmodule