// results that gets lost in case we need it further as we have only 32 register
// i.e if we need to save value of a addition value 

module Data_Memory(A,WD,RD,clk,WE,rst);

input [31:0] A,WD;
input clk,WE,rst;
output [31:0] RD;

reg [31:0] mem [1023:0];

//write
always @ (posedge clk)
    begin
        if(WE)
            mem[A] <= WD;
    end

    assign RD = (~rst) ? 32'd0 : mem[A];

    initial begin
        mem[28] = 32'h00000020;    //mem[40] = 32'h00000002;
        
    end


endmodule