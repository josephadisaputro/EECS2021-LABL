module LabL2;

reg[1:0] a, b;
reg c;
wire[1:0] z;

yMux2 myMux(z, a, b, c);

initial 
begin
	
	a = 01;
	b = 10;
	c = 0;
	#1 $display("a=%b b=%b c=%b z=%b", a, b, c, z);

end
endmodule
