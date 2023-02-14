module dffe(q, d, clk, en, clr);
   input d, clk, en, clr;
   wire clr;
   output q;
   reg q;
   
   initial begin
       q = 1'b0; //Intialize q to 0
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

module register32(in, wEnable, rEnable, clk, reset, out);
input [31:0] in;
input wEnable, rEnable, clk, reset; //rEnable = output enable, wEnable = input enable
output [31:0] ff_out, out;

//Generate 32 flipflops
genvar i;
generate
    for (i=0; i<32; i=i+1) begin: loop1
        dffe a_dff(.d(in[i]), .q(out[i]), .clr(reset), .en(wEnable), .clk(clk));
    end
endgenerate
endmodule

module decoder32(out, select, enable);
    input [4:0] select;
    input enable;
    output [31:0] out;

    assign out = enable << select;
endmodule

module tristate32(in, oe, out);
input [31:0] in;
input oe; //oe = output enable
output [31:0] out;

assign out = oe ? in : 32'bz; //subtype of 2:1 mux

endmodule

module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;
	
	wire [31:0] orWire, destRegWire;
	wire [1023:0] sharedOut;

	//WriteEnable Decoder
	decoder32 d32(destRegWire, ctrl_writeReg, ctrl_writeEnable); //(out, select, enable);

	//Output decoders
	decoder32 rsDec1(rsDecOut1, ctrl_readRegA, 1'b1); //(out, select, enable);
	decoder32 rsDec2(rsDecOut2, ctrl_readRegB, 1'b1);

	// Decoded output wires
	wire [31:0] rsDecOut1, rsDecOut2;
	

	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin
			and(orWire[i], ctrl_writeEnable, destRegWire[i]); //WriteEnable and gates

			wire [31:0] outWire; //Shared output wires

			if (i == 0) begin
				register32 reg32(data_writeReg, 1'b0, 1'b1, clock, ctrl_reset, outWire); //Reg0 -> 0
			end else begin
				register32 reg32(data_writeReg, orWire[i], 1'b1, clock, ctrl_reset, outWire); // Init regs 1-31
			end
			//Init output tristates
			tristate32 triA(outWire, rsDecOut1[i], data_readRegA);
			tristate32 triB(outWire, rsDecOut2[i], data_readRegB);
		end
	endgenerate
endmodule
