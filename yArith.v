module yArith(z, cout, a, b, ctrl); 
// add if ctrl=0, subtract if ctrl=1
parameter SIZE = 2; 
output [SIZE-1:0] z; 
output cout; 
input [SIZE-1:0] a, b; 
input ctrl; 
wire[SIZE-1:0] notB, tmp; 
wire cin; 
// instantiate the components and connect them 
// Hint: about 4 lines of code 

not notting[SIZE-1:0](notB, b);
yMux #(SIZE-1) control(tmp, b, notB, ctrl); 
yAdder adder(z, cout, a, tmp, ctrl); 

endmodule 
