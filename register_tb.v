module register_tb();
    reg [31:0] in;
    wire [31:0] out;
    reg wEnable, rEnable, clk, reset;

    register reg_test(in, wEnable, rEnable, clk, reset, out);

    initial begin
        assign in = 9876;
        $display("Saving: %b", in);
        assign wEnable = 0;
        assign rEnable = 0;
        assign clk = 0;
        assign reset = 0;
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
        $display("Toggling wEnable");
        assign wEnable = 1;
        $display("wEnable high");
        #20;
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
        $display("Toggling clock");
        assign clk = 1;
        $display("Clk high");
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
        #20;
        assign in = 1;
        assign wEnable = 0;
        $display("wEnable low");
        assign clk = 0;
        $display("Clk low");
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
        $display("Toggle Enable read");
        assign rEnable = 1;
        $display("rEnable high");
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
        #20;
        assign rEnable = 0;
        $display("rEnable low");
        $display("In: %b, Clk = %b, wEnable = %b, rEnable = %b, out = %b", in, clk, wEnable, rEnable, out);
    end
endmodule   