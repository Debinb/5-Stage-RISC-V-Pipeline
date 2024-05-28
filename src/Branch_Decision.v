`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 09:05:36 PM
// Design Name: 
// Module Name: Branch_Decision
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


module Branch_Decision(
    input wire Branch, Zero,
    output reg BranchTaken
    );
    
    always @* begin
        BranchTaken = Branch & Zero;
    end
    
endmodule
