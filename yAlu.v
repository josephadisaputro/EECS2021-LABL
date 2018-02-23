module yAlu(z, ex, a, b, op);
input [31:0] a, b;
input [2:0] op;
output [31:0] z;
output ex;
wire [31:0] arith_z, and_z, or_z, slt_z;
wire [15:0] or16;
wire [7:0] or8;
wire [3:0] or4;
wire [1:0] or2;
wire cout;

//assign slt_z[31:1] = 0;
assign slt_z = (a[31] ^ b[31]) ? a[31] : arith_z[31];
and my_and[31:0] (and_z, a, b);
or my_or[31:0] (or_z, a, b);
//not my_nor[31:0] (nor_z, or_z, 32'b11111111111111111111111111111111);

or or_16[15:0]	(or16,	z[31:16],	z[15:0]);
or or_8[7:0]	(or8,	or16[15:8],	or16[7:0]);
or or_4[3:0]	(or4,	or8[7:4],	or8[3:0]);
or or_2[1:0]	(or2,	or4[3:2],	or4[1:0]);
nor nor_1		(ex,	or2[1],		or2[0]);

//assign ex = ~(|z);

yArith my_arith(arith_z, cout, a, b, op[2]);
yMux4to1 #(32) my_mux(z, and_z, or_z, arith_z, slt_z, op[1:0]);

endmodule
