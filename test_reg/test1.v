// This is a Verilog description for an 8 x 16 register file

`timescale 1ns / 1ns

module regfile8x16a
  (input clk,
   input write,
   input [2:0] wrAddr,
   input [15:0] wrData,
   input [2:0] rdAddrA,
   output [15:0] rdDataA,
   input [2:0] rdAddrB,
   output [15:0] rdDataB);

   reg [15:0] 	 regfile [0:7];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];

   always @(posedge clk) begin
      if (write) regfile[wrAddr] <= wrData;
   end
endmodule


// This is a Verilog description for an 8 x 16 register file

`timescale 1ns / 1ns

module regfile8x16b
  (input clk,
   input reset,
   input write,
   input [2:0] wrAddr,
   input [15:0] wrData,
   input [2:0] rdAddrA,
   output [15:0] rdDataA,
   input [2:0] rdAddrB,
   output [15:0] rdDataB);

   reg [15:0] 	 regfile [0:7];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];

   always @(posedge clk) begin
      if (reset) begin
	 regfile[0] <= 0;
	 regfile[1] <= 0;
	 regfile[2] <= 0;
	 regfile[3] <= 0;
	 regfile[4] <= 0;
	 regfile[5] <= 0;
	 regfile[6] <= 0;
	 regfile[7] <= 0;
      end else begin
	 if (write) regfile[wrAddr] <= wrData;
      end // else: !if(reset)
   end
endmodule


// This is a Verilog description for an 8 x 16 register file

`timescale 1ns / 1ns

module regfile8x16c
  (input clk,
   input reset,
   input write,
   input [2:0] wrAddr,
   input [15:0] wrData,
   input [2:0] rdAddrA,
   output [15:0] rdDataA,
   input [2:0] rdAddrB,
   output [15:0] rdDataB);

   reg [15:0] 	 regfile [0:7];

   assign rdDataA = regfile[rdAddrA];
   assign rdDataB = regfile[rdAddrB];

   integer 	 i;
   always @(posedge clk) begin
      if (reset) begin
	 for (i = 0; i < 8; i = i + 1) begin
	    regfile[i] <= 0;
	 end
      end else begin
	 if (write) regfile[wrAddr] <= wrData;
      end // else: !if(reset)
   end
endmodule