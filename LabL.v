//yusuf Adisaputro
//213533088
// 
//first you input ctl before running. then it will generate 10 possible a and b
module ALU4(z, a, b, ctl);
input [3:0] a, b;
input [2:0] ctl;
output [3:0] z;


wire [3:0] ADDorSUB, AND, OR, XNOR;
wire cout;
 
yArithlocal arith(ADDorSUB, cout, a, b, ctl[2]); 
and myAnd[3:0](AND, a, b);
or myAnd[3:0](OR, a, b);
xnor myAnd[3:0](XNOR, a, b);


yMux4to1local #(4) myMux(z, ADDorSUB, AND, OR, XNOR, ctl[1:0]);
//yMux #(1) myMux(tmp1, ADDorSUB, AND, ctl[0]);
//yMux #(1) myMux(tmp2, XNOR, OR, ctl[0]);
//yMux #(1) final(z, tmp1, tmp2, c[1]); 
endmodule

module yMux4to1local(z, a0,a1,a2,a3, c); 

parameter SIZE = 2; 
output [SIZE-1:0] z; 
input [SIZE-1:0] a0, a1, a2, a3; 
input [1:0] c; 
wire [SIZE-1:0] zLo, zHi; 

yMux #(SIZE) lo(zLo, a0, a1, c[0]); 
yMux #(SIZE) hi(zHi, a2, a3, c[0]); 
yMux #(SIZE) final(z, zLo, zHi, c[1]); 

endmodule 

module yMux(z, a, b, c); 

parameter SIZE = 2;
output [SIZE-1:0] z; 
input [SIZE-1:0] a, b; 
input c; 

yMux1 mine[SIZE-1:0](z, a, b, c); 


endmodule 

module yMux1(z, a, b, c); 
output z; 
input a, b, c; 
wire notC, upper, lower; 

not my_not(notC, c); 
and upperAnd(upper, a, notC); 
and lowerAnd(lower, c, b); 
or my_or(z, upper, lower); 

endmodule 





module yArithlocal(z, cout, a, b, ctl); 
// add if ctrl=0, subtract if ctrl=1

output [3:0] z; 
output cout; 
input [3:0] a, b; 
input ctl; 
wire[3:0] notB, tmp; 
wire cin; 


not notting[3:0](notB, b);
yMuxlocal control(tmp, b, notB, ctl); 
yAdderlocal adder(z, cout, a, tmp, ctl); 
endmodule 

module yAdderlocal(z, cout, a, b, cin); 

output [3:0] z; 
output cout; 
input [3:0] a, b; 
input cin; 
wire[3:0] in, out; 

yAdder1local mine[3:0](z, out, a, b, in); 
assign in[0] = cin; 
assign in[3:1] = out[2:0];
assign cout = out[3]; 

endmodule

module yAdder1local(z, cout, a, b, cin); 
output z, cout; 
input a, b, cin; 

xor left_xor(tmp, a, b); 
xor right_xor(z, cin, tmp); 
and left_and(outL, a, b); 
and right_and(outR, tmp, cin); 
or my_or(cout, outR, outL); 

endmodule 

module yMuxlocal(z, a, b, c); 

output [3:0] z; 
input [3:0] a, b; 
input c; 

yMux1 mine[3:0](z, a, b, c); 
endmodule 




module t_ALU;
reg [3:0] a, b, expect;
reg [2:0] ctl;
reg flag;
wire [3:0] z;
wire cout;

ALU4 myalu4(z, a, b, ctl);
//yAdderlocal test(z, cout, a, b, ctl[2]); 

initial 
begin
		flag = $value$plusargs("ctl=%b", ctl);
		repeat(10)
		begin
		a = $random % 4;
		b = $random % 4;
		if(ctl == 000)
		expect = a + b;
		else if(ctl == 001)
		expect = a & b;
		else if(ctl == 010)
		expect = a | b;
		else if(ctl == 100)
		expect = a - b;
		else if(ctl == 111)
		expect = (a==b);


		#5 $display("a=%b b=%b ctl=%b z=%b expect=%b", a, b, ctl, z, expect);
		
		end
end
endmodule
