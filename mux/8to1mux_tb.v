module eightto1mux_tb;

wire [31:0] a, b, c, d, e, f, g, h, out;
wire [2:0] select;
assign a = 0;
assign b = 1;
assign c = 2;
assign d = 3;
assign e = 4;
assign f = 5;
assign g = 6;
assign h = 7;

eightto1mux eightmux(a, b, c, d, e, f, g, h, select, out);

integer i;
assign {select} = i[2:0];

initial begin
    for (i = 0; i < 8; i++) begin
        #20;
        if (out[2:0] == select) begin
            $display("CORRECT OUTPUT - Select bit = %b", i[2:0]);
        end else begin
            $display("INCORRECT OUTPUT - Select bit = %b, Got: %b, Expected: %b", i[2:0], out[2:0], select);
        end
    end
end

endmodule