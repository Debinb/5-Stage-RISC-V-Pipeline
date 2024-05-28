`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 01:51:34 AM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control (
    input wire [1:0] ALUOp, // ALUOp input
    input wire [6:0] funct7, // funct7 field of the instruction
    input wire [2:0] funct3, // funct3 field of the instruction
    output reg [3:0] ALUControlOut // ALU control output
);

 localparam SUB = 4'b0110; // ALU control input for Subtract operation
 localparam ADD = 4'b0010; // ALU control input for Add operation
 localparam AND = 4'b0000; // ALU control input for AND operation
 localparam OR =  4'b0001; // ALU control input for OR operation
 
 // ALU control logic
 always @(*) begin
    case(ALUOp)
        2'b00: ALUControlOut = 4'b0010; //If ALU OP is 00, then ALU adds (for ld/sd)
        2'b01: ALUControlOut = SUB;     //If ALU OP is 01, then ALU subtracts (for beq)
        //2'b11: ALUControlOut = SUB;     //If ALU OP is 11, then ALU subtracts (for BNE)
        2'b10: begin                    //R-Type instructions ALU OP 
            case(funct7)
                7'b0100000: ALUControlOut = SUB;  //Only subtraction has a different FUNCT7 field
                7'b0000000: begin       //For the other three r-type operations
                    case (funct3)       //Same funct7 but different funct3 for these operations
                        3'b000: ALUControlOut = ADD;    //funct3 is 000 for ADD operation 
                        3'b111: ALUControlOut = AND;    //funct3 is 111 for AND operation
                        3'b110: ALUControlOut = OR;     //funct3 is 110 for OR operation
                    endcase
                end
           endcase
        end
        default: ALUControlOut = 4'b0000;
     endcase
 end
endmodule
