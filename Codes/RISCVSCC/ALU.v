/* zero negative carry and overflow(sign of input output should be same)
/there are 2 alu we use the later one the one before is a simplified version of the same*/

//creating module the name should be same when we call it in the single cycle top 

module ALU(A,B,ALUControl,Result,Z,N,V,C);
// input and output ports
input[31:0] A,B;
input [2:0]ALUControl;
output [31:0]Result;
output Z,N,V,C;

wire cout;

wire [31:0] a_and_b;
wire[31:0] a_or_b;
wire [31:0] not_b;
wire[31:0] mux_1;  
wire[31:0] mux_2;
wire[31:0] sum;
wire [31:0] slt; //zero extension

// logic design
// we use bitwise operator as multiple bits are to be compared
assign a_and_b = A & B;
assign a_or_b = A | B;
assign not_b = ~B;
  
// mux or ternary operator
// mux 1 is shown in the pdf 

assign mux_1 = (ALUControl[0] == 1'b0) ? B : ~ B;   //syntax is (condition) ? first value : second value;
// sum
assign cout = A + mux_1 + ALUControl[0];
assign sum = A + mux_1 + ALUControl[0];


// final 4x1 mux 
// ternary operator (if else)
//syntax is (condition) ? first value : second value;
assign mux_2 = (ALUControl[1:0] == 2'b00) ? sum :
               (ALUControl[1:0] == 2'b01) ? sum :
               (ALUControl[1:0] == 2'b10) ? a_and_b : a_or_b ;
                  
assign Result = mux_2;
               
//flags assignment
assign z = ~(Result & {32{Result[31]}}); //zero flag

assign N = Result[31]; //negative flag

assign C = cout && (!ALUControl[1]);

assign V = (!ALUControl[1]) && (A[31] ^ sum[31]) && (!(A[31] ^ B[31] ^ ALUControl[0])); //overflow

endmodule
