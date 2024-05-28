`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 05:06:27 PM
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


module DecodeExecute_Reg(
    input wire clock,
    input wire [31:0] PC_IN, RD1_in, RD2_in, ImmGen_in, Mem_in,
    input wire [1:0] in_ALUOp,
    input wire in_ALUSrc, in_Branch, in_MemRead, in_MemWrite, in_MemToReg, in_RegWrite, FlushSignal,
    input wire IDEX_TakenBranch,
    
    output reg [31:0] PC_OUT, RD1_out, RD2_out, ImmGen_out, Mem_out,
    output reg [1:0] out_ALUOp,
    output reg out_ALUSrc, out_Branch, out_MemRead, out_MemWrite, out_MemToReg, out_RegWrite
    );
    
    always@(posedge clock) begin
        PC_OUT = PC_IN;
        RD1_out = RD1_in;
        RD2_out = RD2_in;
        ImmGen_out = ImmGen_in;          
        Mem_out = Mem_in;
        
        //out_ALUSrc = in_ALUSrc;
        //out_ALUOp = in_ALUOp;
        //out_Branch = in_Branch;
        if(FlushSignal) begin
            out_RegWrite = 0;
            out_MemToReg = 0;
            out_MemWrite = 0;
            out_MemRead = 0;
            out_Branch = 0;
            out_ALUSrc = 0;
            out_ALUOp = 0; 
        end
        else begin
        out_MemRead = in_MemRead;
        out_MemWrite = in_MemWrite;
        out_MemToReg = in_MemToReg;
        out_RegWrite = in_RegWrite;     
        out_Branch = in_Branch;   
        out_ALUSrc = in_ALUSrc;
        out_ALUOp = in_ALUOp; 
        end
    end
endmodule
