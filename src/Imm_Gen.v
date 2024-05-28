`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 11:35:08 AM
// Design Name: 
// Module Name: Imm_Gen
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


module Imm_Gen(
     input wire [31:0] instruction, // Full instruction
     output reg [31:0] imm // Sign-extended immediate value
);
    wire [6:0] opcode = instruction[6:0];
    
    localparam LD_OPCODE = 7'b0000011;
    localparam ITYPE_OPCODE = 7'b0010011;  
    localparam SD_OPCODE = 7'b0100011;
    localparam SBTYPE_OPCODE = 7'b1100011;
    
 always @(*) begin
 // Extracting bits and placing them in the correct position
    case(opcode)
        SBTYPE_OPCODE: begin
            imm[12] = instruction[31];
            imm[10:5] = instruction[30:25];
            imm[4:1] = instruction[11:8];
            imm[11] = instruction[7];
            imm[0] = 1'b0;
            // Sign-extend the immediate value to 32 bits
            imm[31:13] = {19{imm[12]}};
        end
        
        LD_OPCODE, ITYPE_OPCODE: begin
            imm[11:0] = instruction[31:20];
            imm[31:12] = {20{imm[11]}}; //Replicate the sign bit (bit 12) across the upper bits
        end
        
        SD_OPCODE: begin
            imm[11:5] = instruction[31:25];
            imm[4:0] = instruction[11:7];
            imm[31:12] = {20{imm[11]}};
        end
    endcase 
 end

endmodule
