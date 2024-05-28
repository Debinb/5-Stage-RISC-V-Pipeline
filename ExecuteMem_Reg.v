`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 11:28:27 PM
// Design Name: 
// Module Name: DecodeExecute_Reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ExecuteMem_Reg(
    input wire clock,
    input wire [31:0] RD2_in, Add2_in, ALUResult_in, Mem_in,
    input wire zero_in, RegWrite_in, MemToReg_in, MemWrite_in, MemRead_in, Branch_in,
    input wire EXMEM_TakenBranch, Flush,
    output reg [31:0] RD2_out, Add2_out, ALUResult_out, Mem_out,
    output reg zero_out, RegWrite_out, MemToReg_out, MemWrite_out, MemRead_out, Branch_out
    );
    
    always@(posedge clock) begin
        Add2_out = Add2_in;
        
        zero_out = zero_in;
        ALUResult_out = ALUResult_in;
        RD2_out = RD2_in;
        Mem_out = Mem_in;
       
       if(Flush) begin
            RegWrite_out = RegWrite_in;
            MemToReg_out =  MemToReg_in;
            MemWrite_out = MemWrite_in;
            MemRead_out = MemRead_in;
            Branch_out = Branch_in;
        end 
        else begin
            RegWrite_out = RegWrite_in;
            MemToReg_out =  MemToReg_in;
            MemWrite_out = MemWrite_in;
            MemRead_out = MemRead_in;
            Branch_out = Branch_in;
        end
    end
endmodule
