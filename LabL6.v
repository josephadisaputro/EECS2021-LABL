module LabL6;

reg[31:0] a, b;
reg cin;
wire[31:0] z;
wire cout;

yAdder Adder(z, cout, a, b, cin); 

initial 
begin

		a = 32'b1001;
		b = 32'b1101;
		cin = 0;
		#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);

end
endmodule
