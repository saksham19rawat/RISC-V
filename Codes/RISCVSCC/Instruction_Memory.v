module Instr_Mem (rst,A,RD);
    
input [31:0] A;
input rst;
output [31:0] RD;

reg [31:0] mem [0:1023];  // 1024 words of 32 bits

assign RD = (~rst) ? {32{1'b0}} : mem[A[31:2]];

initial begin
    mem[0] = 32'hFFC4A303;
    mem[1] = 32'h00832383;
    mem[0] = 32'h0064A423;
    mem[1] = 32'h00B62423;
    mem[0] = 32'h0062E233;
    mem[1] = 32'h00B62423;

end


endmodule

