module LabL3;

reg[31:0] a, b;
reg c;
wire[31:0] z;

//reg expect;

yMux #(32) myMux(z, a, b, c);

initial 
begin
	repeat (10)
	begin
		a = $random;
		b = $random;
		c = $random % 2;
		#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);
	end
end
endmodule
