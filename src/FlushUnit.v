`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2024 11:53:58 PM
// Design Name: 
// Module Name: FlushUnit
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


module FlushUnit(
    input wire TakenBranch,
    output reg Flush
    );
    
    always @(*) begin
        if(TakenBranch) begin
            Flush = 1;
        end
        else begin
            Flush = 0;
        end
    end  
endmodule
