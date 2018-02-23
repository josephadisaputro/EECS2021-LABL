module LabL1;

reg a, b, c;
wire z;

yMux1 myMux(z, a, b, c);

initial 
begin
	
	a = 0;
	b = 1;
	c = 0;
	#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);

end
endmodule
