module tristate_tb;

//input a, oe;
wire out;
reg a, oe;

integer i;

tristate t(a, oe, out);

initial begin
    $display("in:oe:out");
    $monitor(a, oe, out);
    for (i = 0; i < 4; i=i+1) begin
        oe = i[1:0];
        a = i[2:1];
        #5;
    end
end

endmodule