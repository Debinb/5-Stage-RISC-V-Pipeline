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


module MemWB_Reg(
    input wire clock,
    input wire[31:0] ReadData_in, ALUresult_in, Mem_in,
    input wire RegWrite_in, MemToReg_in,
    output reg [31:0] ReadData_out, ALUresult_out, Mem_out,
    output reg RegWrite_out, MemToReg_out
    );
    
    always@(posedge clock) begin
        ReadData_out = ReadData_in;
        ALUresult_out = ALUresult_in;
        Mem_out = Mem_in;
        
        RegWrite_out = RegWrite_in;
        MemToReg_out = MemToReg_in;
    end
endmodule
