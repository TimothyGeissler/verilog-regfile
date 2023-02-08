module basemux_tb;
wire [31:0] a, b, out;
reg select;
assign a = 1;
assign b = 0;


basemux mux(a, b, select, out);

initial begin
    select = 1;
    #20
    if (out == b) begin
        $display("CORRECT OUTPUT - Select bit = 1");
    end else begin
        $display("INCORRECT OUTPUT - Select bit = 1");
    end
    
    select =~ select;
    #20
    if (out == a) begin
        $display("CORRECT OUTPUT - Select bit = 0");
    end else begin
        $display("INCORRECT OUTPUT - Select bit = 0");
    end
end
endmodule