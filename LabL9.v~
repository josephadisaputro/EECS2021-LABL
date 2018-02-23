module labL9;
reg signed [31:0] a, b, expect;
reg [2:0] op;
reg flag;
wire [31:0] z;
wire ex;


yAlu mine(z, ex, a, b, op);

initial
begin
	repeat (10)
	begin
		a = $random;
		b = $random;
		flag = $value$plusargs("op=%d", op);
	
		if (op === 0)
			expect = a & b;
		else if (op === 1)
			expect = a | b;
		else if (op === 2)
			expect = a + b;
		else if (op === 6)
			expect = a - b;

		#1;

		if (expect != z)
			$display ("FAIL: a=%d b=%d op=%d z=%d expect=%d", a, b, op, z, expect);
		else
			$display ("PASS: a=%d b=%d op=%d z=%d expect=%d", a, b, op, z, expect);
	end
end

endmodule
