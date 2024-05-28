`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2024 11:22:37 PM
// Design Name: 
// Module Name: Stall
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


module Stall(
    input wire[4:0] RS1, RS2, RD,
    input wire MemRead,
    output reg  StallSignal
    );
    
always @(*) begin
    if((MemRead) && ((RD == RS1) || (RD == RS2))) begin
        StallSignal = 1;
    end
    else begin
        StallSignal = 0;
    end
end
endmodule
