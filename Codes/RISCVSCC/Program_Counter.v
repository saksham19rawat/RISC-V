/*Program Counter : is a 32 bit register ye A ko change karta hai 
A is the address output 
PC is RD and pcnext is input or A*/

module P_C(PC_Next,PC,rst,clk);

input clk,rst;
input [31:0] PC_Next;
output [31:0]PC;
reg [31:0]PC;

always @(posedge clk)
begin
    if(~rst)
        PC <= {32{1'b0}};
    else
        PC <= PC_Next;
end

endmodule