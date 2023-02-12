module decoder_tb();

/*wire [31:0] out;
wire [4:0] select;

decoder32 dc(out, select, 1'b1);

integer i;
assign {select} = i[4:0];

initial begin
    for (i = 0; i < 8; i++) begin
        $display("%b", select);
    end
end*/

  // input port are declared in reg(register)
  reg a,b,en;

  // output port are declared in wire(net)
  wire [3:0]y;

  // instantiate design block
  decoder32 dut(out, select, 1'b1);

  initial
    begin
      $monitor("en=%b a=%b b=%b y=%b",en,a,b,y);
      // with reference to truth table provide input values
      en=1;a=1'bx;b=1'bx;#5
      en=0;a=0;b=0;#5
      en=0;a=0;b=1;#5
      en=0;a=1;b=0;#5
      en=0;a=1;b=1;#5

      // terminate simulation using $finish system task
      $finish;
    end

endmodule


