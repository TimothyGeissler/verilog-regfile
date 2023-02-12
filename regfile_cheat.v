`include "register.v"

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


   reg [31:0] 	 regfile [0:31];

   assign data_readRegA = regfile[ctrl_readRegA];
   assign data_readRegB = regfile[ctrl_readRegB];

   integer 	 i;
   always @(posedge clock) begin
      if (ctrl_reset) begin
	 for (i = 0; i < 32; i = i + 1) begin
	    regfile[i] <= 0;
	 end
      end else begin
	 if (ctrl_writeEnable) regfile[ctrl_writeReg] <= data_writeReg;
      end // else: !if(reset)
   end

endmodule
