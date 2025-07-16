// is a 32 bit register file with 3 input A1 A2 A3 and 2 RD 1 RD 2 output ports
module Reg_File(A1,A2,A3,RD1,RD2,WD3,WE3,clk,rst);

// declaring ports input and output
input clk,rst;
input [4:0] A1,A2,A3;
input [31:0] WD3,WE3;
output [31:0] RD1,RD2;

//memory/temp files/register
reg [31:0] Register [31:0];

always @ (posedge clk)
begin
    if(WE3)
        Register[A3] <= WD3;
end

assign RD1 = (~rst) ? 32'd0 : Register[A1];
assign RD2 = (~rst) ? 32'd0 : Register[A2];

initial begin
    Register[5] = 32'h00000005;
    Register[6] = 32'h00000004;
        
end

endmodule