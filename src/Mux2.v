`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 09:13:26 PM
// Design Name: 
// Module Name: Mux2
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


module Mux2(
 input wire [31:0] ReadData , ALUout, 
 input wire MemToReg,
 output reg [31:0] out
    );
    
     always @ (*) begin
        if (MemToReg) begin
            out = ReadData;
        end else begin
            out = ALUout;
        end
    end
endmodule
