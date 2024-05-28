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


module FetchDecode_Reg(
    input wire clock,
    input wire[31:0] PC_IN, Mem_In,
    output reg[31:0] PC_OUT, Mem_Out
    );
    
    always@(posedge clock) begin
        //if(reset == 0) begin
            PC_OUT = PC_IN;
            Mem_Out = Mem_In;
        //end
    end
    
endmodule
