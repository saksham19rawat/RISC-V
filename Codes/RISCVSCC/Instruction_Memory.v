/*for every address we get a RD in the output
The instruction memory has a single read port. It takes a 32-bit instruction address input, A,
and reads the 32-bit data (i.e., instruction) from that address onto the read data output, RD*/

module Instr_Mem (rst,A,RD);
    
input [31:0] A;
input rst;
output [31:0] RD;

reg [31:0] mem [0:1023];  // 1024 words of 32 bits
/*If rst == 0 (reset active), RD outputs zero.
Else, it fetches instruction from mem using A[31:2] (ignores bottom 2 bits for word alignment)*/
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

