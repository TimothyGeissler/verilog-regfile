module fourto1mux_tb;
wire [31:0] a, b, c, d, out;
wire [1:0] select;
assign a = 0;
assign b = 1;
assign c = 2;
assign d = 3;

fourto1mux mux(a, b, c, d, select, out);

integer i;
assign {select} = i[1:0];

initial begin
    $dumpfile("4to1wvfrm.vcd");
    $dumpvars(0, fourto1mux_tb);
    for (i = 0; i < 4; i++) begin
        #20
        if (out[1:0] == select) begin
            $display("CORRECT OUTPUT - Select bit = %b", i[1:0]);
        end else begin
            $display("INCORRECT OUTPUT - Select bit = %b, Got: %b, Expected: %b", i[1:0], out[1:0], select);
        end
    end
    
    /*if (out == a) begin
        $display("CORRECT OUTPUT - Select bit = 1");
    end else begin
        $display("INCORRECT OUTPUT - Select bit = 1");
    end
    
    select =~ select;
    #20
    if (out == b) begin
        $display("CORRECT OUTPUT - Select bit = 0");
    end else begin
        $display("INCORRECT OUTPUT - Select bit = 0");
    end*/
end
endmodule