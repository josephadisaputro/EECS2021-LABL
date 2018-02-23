module LabL5;

reg a, b, cin;
wire z, cout;

yAdder1 Adder1(z, cout, a, b, cin); 

initial 
begin
	repeat (10)
	begin
		a = $random%2;
		b = $random%2;
		cin = $random%2;
		#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
	end
end
endmodule
