module three2to1mux_tb;
wire [31:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, out;
wire [4:0] select;

assign a = 0;
assign b = 1;
assign c = 2;
assign d = 3;
assign e = 4;
assign f = 5;
assign g = 6;
assign h = 7;
assign i = 8;
assign j = 9;
assign k = 10;
assign l = 11;
assign m = 12;
assign n = 13;
assign o = 14;
assign p = 15;
assign q = 16;
assign r = 17;
assign s = 18;
assign t = 19;
assign u = 20;
assign v = 21;
assign w = 22;
assign x = 23;
assign y = 24;
assign z = 25;
assign aa = 26;
assign ab = 27;
assign ac = 28;
assign ad = 29;
assign ae = 30;
assign af = 31;

three2to1mux bigmux(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, select, out);

integer count;
assign {select} = count[4:0];

initial begin
    for (count = 0; count < 32; count++) begin
        #20;
        if (out[4:0] == select) begin
            $display("CORRECT OUTPUT - Select bit = %b", count[4:0]);
        end else begin
            $display("INCORRECT OUTPUT - Select bit = %b, Got: %b, Expected: %b", count[4:0], out[4:0], select);
        end
    end
end

endmodule