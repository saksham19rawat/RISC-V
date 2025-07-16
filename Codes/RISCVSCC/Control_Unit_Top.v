/*control unit has 2 part named alu and main decoder
we can directly use both of them for our single cycle top but to reduce complexity run time and easier access we create a
different top for control unit
the code for the decoder is not ass difficult but we need to check small errors while 
declaring the ports as verilog is case sensitive and any errorr in either of decoder or the top accumulates in the final results*/

// calling the 2 modules / integrating
`include "alu_decoder.v"
`include "main_decoder.v"

// ports for the control unit
module Control_Unit_Top(Op,RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,funct3,funct7,ALUControl);

input [6:0]Op,funct7;
input [2:0]funct3;
output RegWrite,ALUSrc,MemWrite,ResultSrc,Branch;
output [1:0]ImmSrc;
output [2:0]ALUControl;

wire [1:0]ALUOp;

// calling the modules with their respective ports
main_decoder main_decoder(
                .Op(Op),
                .RegWrite(RegWrite),
                .ImmSrc(ImmSrc),
                .MemWrite(MemWrite),
                .ResultSrc(ResultSrc),
                .Branch(Branch),
                .ALUSrc(ALUSrc),
                .ALUOp(ALUOp)
);

alu_decoder alu_decoder(
                            .ALUOp(ALUOp),
                            .funct3(funct3),
                            .funct7(funct7),
                            .op(Op),
                            .ALUControl(ALUControl)
);


endmodule
