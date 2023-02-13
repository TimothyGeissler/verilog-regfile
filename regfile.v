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

module register32(in, wEnable, rEnable, clk, reset, out);
input [31:0] in;
input wEnable, rEnable, clk, reset; //rEnable = output enable, wEnable = input enable
output [31:0] ff_out, out;

//Generate 32 flipflops
genvar i;
generate
    for (i=0; i<32; i=i+1) begin: loop1
        dffe a_dff(.d(in[i]), .q(out[i]), .clr(reset), .en(wEnable), .clk(clk)); //not sure about .clrn param
        //tristate t(ff_out[i], rEnable, out[i]);
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

	genvar i;
	generate
		for (i = 0; i < 32; i = i + 1) begin
			and(orWire[i], ctrl_writeEnable, destRegWire[i]);
			//register32 reg(data_writeReg, orWire[i], 1'b1, clock, ctrl_reset, sharedOut[((i * 32) + 31):(i * 32)]) //(in, wEnable, rEnable, clk, reset, out);
		end
	endgenerate
	
	//32x32-bit registers
	register32 reg0(data_writeReg, 1'b0, 1'b1, clock, ctrl_reset, sharedOut[31:0]);
	register32 reg1(data_writeReg, orWire[1], 1'b1, clock, ctrl_reset, sharedOut[63:32]);
	register32 reg2(data_writeReg, orWire[2], 1'b1, clock, ctrl_reset, sharedOut[95:64]);
	register32 reg3(data_writeReg, orWire[3], 1'b1, clock, ctrl_reset, sharedOut[127:96]);
	register32 reg4(data_writeReg, orWire[4], 1'b1, clock, ctrl_reset, sharedOut[159:128]);
	register32 reg5(data_writeReg, orWire[5], 1'b1, clock, ctrl_reset, sharedOut[191:160]);
	register32 reg6(data_writeReg, orWire[6], 1'b1, clock, ctrl_reset, sharedOut[223:192]);
	register32 reg7(data_writeReg, orWire[7], 1'b1, clock, ctrl_reset, sharedOut[255:224]);
	register32 reg8(data_writeReg, orWire[8], 1'b1, clock, ctrl_reset, sharedOut[287:256]);
	register32 reg9(data_writeReg, orWire[9], 1'b1, clock, ctrl_reset, sharedOut[319:288]);
	register32 reg10(data_writeReg, orWire[10], 1'b1, clock, ctrl_reset, sharedOut[351:320]);
	register32 reg11(data_writeReg, orWire[11], 1'b1, clock, ctrl_reset, sharedOut[383:352]);
	register32 reg12(data_writeReg, orWire[12], 1'b1, clock, ctrl_reset, sharedOut[415:384]);
	register32 reg13(data_writeReg, orWire[13], 1'b1, clock, ctrl_reset, sharedOut[447:416]);
	register32 reg14(data_writeReg, orWire[14], 1'b1, clock, ctrl_reset, sharedOut[479:448]);
	register32 reg15(data_writeReg, orWire[15], 1'b1, clock, ctrl_reset, sharedOut[511:480]);
	register32 reg16(data_writeReg, orWire[16], 1'b1, clock, ctrl_reset, sharedOut[543:512]);
	register32 reg17(data_writeReg, orWire[17], 1'b1, clock, ctrl_reset, sharedOut[575:544]);
	register32 reg18(data_writeReg, orWire[18], 1'b1, clock, ctrl_reset, sharedOut[607:576]);
	register32 reg19(data_writeReg, orWire[19], 1'b1, clock, ctrl_reset, sharedOut[639:608]);
	register32 reg20(data_writeReg, orWire[20], 1'b1, clock, ctrl_reset, sharedOut[671:640]);
	register32 reg21(data_writeReg, orWire[21], 1'b1, clock, ctrl_reset, sharedOut[703:672]);
	register32 reg22(data_writeReg, orWire[22], 1'b1, clock, ctrl_reset, sharedOut[735:704]);
	register32 reg23(data_writeReg, orWire[23], 1'b1, clock, ctrl_reset, sharedOut[767:736]);
	register32 reg24(data_writeReg, orWire[24], 1'b1, clock, ctrl_reset, sharedOut[799:768]);
	register32 reg25(data_writeReg, orWire[25], 1'b1, clock, ctrl_reset, sharedOut[831:800]);
	register32 reg26(data_writeReg, orWire[26], 1'b1, clock, ctrl_reset, sharedOut[863:832]);
	register32 reg27(data_writeReg, orWire[27], 1'b1, clock, ctrl_reset, sharedOut[895:864]);
	register32 reg28(data_writeReg, orWire[28], 1'b1, clock, ctrl_reset, sharedOut[927:896]);
	register32 reg29(data_writeReg, orWire[29], 1'b1, clock, ctrl_reset, sharedOut[959:928]);
	register32 reg30(data_writeReg, orWire[30], 1'b1, clock, ctrl_reset, sharedOut[991:960]);
	register32 reg31(data_writeReg, orWire[31], 1'b1, clock, ctrl_reset, sharedOut[1023:992]);

	//Output decoders
	decoder32 rsDec1(rsDecOut1, ctrl_readRegA, 1'b1); //(out, select, enable);
	decoder32 rsDec2(rsDecOut2, ctrl_readRegB, 1'b1);

	//tristates
	wire [31:0] rsDecOut1, rsDecOut2;

	//Output A
tristate32 triA0(sharedOut[31:0], rsDecOut1[0], data_readRegA);
tristate32 triA1(sharedOut[63:32], rsDecOut1[1], data_readRegA);
tristate32 triA2(sharedOut[95:64], rsDecOut1[2], data_readRegA);
tristate32 triA3(sharedOut[127:96], rsDecOut1[3], data_readRegA);
tristate32 triA4(sharedOut[159:128], rsDecOut1[4], data_readRegA);
tristate32 triA5(sharedOut[191:160], rsDecOut1[5], data_readRegA);
tristate32 triA6(sharedOut[223:192], rsDecOut1[6], data_readRegA);
tristate32 triA7(sharedOut[255:224], rsDecOut1[7], data_readRegA);
tristate32 triA8(sharedOut[287:256], rsDecOut1[8], data_readRegA);
tristate32 triA9(sharedOut[319:288], rsDecOut1[9], data_readRegA);
tristate32 triA10(sharedOut[351:320], rsDecOut1[10], data_readRegA);
tristate32 triA11(sharedOut[383:352], rsDecOut1[11], data_readRegA);
tristate32 triA12(sharedOut[415:384], rsDecOut1[12], data_readRegA);
tristate32 triA13(sharedOut[447:416], rsDecOut1[13], data_readRegA);
tristate32 triA14(sharedOut[479:448], rsDecOut1[14], data_readRegA);
tristate32 triA15(sharedOut[511:480], rsDecOut1[15], data_readRegA);
tristate32 triA16(sharedOut[543:512], rsDecOut1[16], data_readRegA);
tristate32 triA17(sharedOut[575:544], rsDecOut1[17], data_readRegA);
tristate32 triA18(sharedOut[607:576], rsDecOut1[18], data_readRegA);
tristate32 triA19(sharedOut[639:608], rsDecOut1[19], data_readRegA);
tristate32 triA20(sharedOut[671:640], rsDecOut1[20], data_readRegA);
tristate32 triA21(sharedOut[703:672], rsDecOut1[21], data_readRegA);
tristate32 triA22(sharedOut[735:704], rsDecOut1[22], data_readRegA);
tristate32 triA23(sharedOut[767:736], rsDecOut1[23], data_readRegA);
tristate32 triA24(sharedOut[799:768], rsDecOut1[24], data_readRegA);
tristate32 triA25(sharedOut[831:800], rsDecOut1[25], data_readRegA);
tristate32 triA26(sharedOut[863:832], rsDecOut1[26], data_readRegA);
tristate32 triA27(sharedOut[895:864], rsDecOut1[27], data_readRegA);
tristate32 triA28(sharedOut[927:896], rsDecOut1[28], data_readRegA);
tristate32 triA29(sharedOut[959:928], rsDecOut1[29], data_readRegA);
tristate32 triA30(sharedOut[991:960], rsDecOut1[30], data_readRegA);
tristate32 triA31(sharedOut[1023:992], rsDecOut1[31], data_readRegA);

	//Output B
tristate32 triB0(sharedOut[31:0], rsDecOut2[0], data_readRegB);
tristate32 triB1(sharedOut[63:32], rsDecOut2[1], data_readRegB);
tristate32 triB2(sharedOut[95:64], rsDecOut2[2], data_readRegB);
tristate32 triB3(sharedOut[127:96], rsDecOut2[3], data_readRegB);
tristate32 triB4(sharedOut[159:128], rsDecOut2[4], data_readRegB);
tristate32 triB5(sharedOut[191:160], rsDecOut2[5], data_readRegB);
tristate32 triB6(sharedOut[223:192], rsDecOut2[6], data_readRegB);
tristate32 triB7(sharedOut[255:224], rsDecOut2[7], data_readRegB);
tristate32 triB8(sharedOut[287:256], rsDecOut2[8], data_readRegB);
tristate32 triB9(sharedOut[319:288], rsDecOut2[9], data_readRegB);
tristate32 triB10(sharedOut[351:320], rsDecOut2[10], data_readRegB);
tristate32 triB11(sharedOut[383:352], rsDecOut2[11], data_readRegB);
tristate32 triB12(sharedOut[415:384], rsDecOut2[12], data_readRegB);
tristate32 triB13(sharedOut[447:416], rsDecOut2[13], data_readRegB);
tristate32 triB14(sharedOut[479:448], rsDecOut2[14], data_readRegB);
tristate32 triB15(sharedOut[511:480], rsDecOut2[15], data_readRegB);
tristate32 triB16(sharedOut[543:512], rsDecOut2[16], data_readRegB);
tristate32 triB17(sharedOut[575:544], rsDecOut2[17], data_readRegB);
tristate32 triB18(sharedOut[607:576], rsDecOut2[18], data_readRegB);
tristate32 triB19(sharedOut[639:608], rsDecOut2[19], data_readRegB);
tristate32 triB20(sharedOut[671:640], rsDecOut2[20], data_readRegB);
tristate32 triB21(sharedOut[703:672], rsDecOut2[21], data_readRegB);
tristate32 triB22(sharedOut[735:704], rsDecOut2[22], data_readRegB);
tristate32 triB23(sharedOut[767:736], rsDecOut2[23], data_readRegB);
tristate32 triB24(sharedOut[799:768], rsDecOut2[24], data_readRegB);
tristate32 triB25(sharedOut[831:800], rsDecOut2[25], data_readRegB);
tristate32 triB26(sharedOut[863:832], rsDecOut2[26], data_readRegB);
tristate32 triB27(sharedOut[895:864], rsDecOut2[27], data_readRegB);
tristate32 triB28(sharedOut[927:896], rsDecOut2[28], data_readRegB);
tristate32 triB29(sharedOut[959:928], rsDecOut2[29], data_readRegB);
tristate32 triB30(sharedOut[991:960], rsDecOut2[30], data_readRegB);
tristate32 triB31(sharedOut[1023:992], rsDecOut2[31], data_readRegB);
	/*genvar j;
	generate
		for (j = 0; j < 32; j = j + 1) begin
			tristate triAi(sharedOut[((i * 32) + 31):(i * 32)], rsDecOut1[i], data_readRegA); //(in, oe, out);
		end
	endgenerate*/
endmodule
