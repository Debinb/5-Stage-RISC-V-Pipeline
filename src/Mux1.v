`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 09:11:48 PM
// Design Name: 
// Module Name: Mux1
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


module Mux1(
    input wire [31:0] Read_data2, ImmGen, 
    input wire ALUSrc,
    output reg [31:0] out
    );
    
     always @ (*) begin
        if (ALUSrc) begin
            out = ImmGen; // Branch target address
        end else begin
            out = Read_data2; // Next sequential instruction address (PC+4)
        end
    end
endmodule
