module LabL4;

reg[31:0] a0, a1, a2, a3;
reg[1:0] c;
wire[31:0] z;

yMux4to1 #(32) myMux(z, a0, a1, a2, a3, c);

initial 
begin
	repeat (10)
	begin
		a0 = $random;
		a1 = $random;
		a2 = $random;
		a3 = $random;
		c = 00;
		#1 $display("This is a test for mux 4 to 1 : a0=%b a1=%b a2=%b a3=%b c=%b z=%b", a0, a1, a2, a3, c, z);
	end
end
endmodule
