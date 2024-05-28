`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 05:06:03 PM
// Design Name: 
// Module Name: BranchMux2To1
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


module BranchMux2To1(
    input wire [31:0] in0, // Input 0: Next sequential instruction address (PC+4) (adder1)
    input wire [31:0] in1, // Input 1: Branch target address (Adder2 result)
    input wire sel, // Selection signal
    output reg [31:0] out // Output: Selected address
    );
    // Select the input based on the sel signal
    always @ (*) begin
        if (sel) begin
            out = in1; // Branch target address 
        end else begin
            out = in0; // Next sequential instruction address (PC+4)== BEQ
        end
    end
endmodule
