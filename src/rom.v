//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2024 11:31:28 AM
// Design Name: 
// Module Name: rom
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


module rom(
    input wire      ce,
    input wire[31:0] addr,
    output reg[31:0] inst
    );
    
    reg[31:0] rom[127:0];
    
    initial $readmemh ("rom2.mem", rom);
    
    always @ (*) begin
        if (ce == 1'b0) begin
            inst <= 32'h0;
        end else begin
            inst <= rom[addr];
        end
    end
endmodule
