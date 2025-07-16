//we need to make 32 bit msb sign shows the sign
// for +ve we need 00000...
// for -VE 11111111....

module Sign_Extend (In,Imm_Ext,ImmSrc);

input [31:0]In;
input ImmSrc;
output [31:0]Imm_Ext;

assign Imm_Ext = (ImmSrc == 1'b1) ? ({{20{In[31]}},In[31:25],In[11:7]}):
                                               {{20{In[31]}},In[31:20]};
                                
endmodule
