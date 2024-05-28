`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 11:44:59 AM
// Design Name: 
// Module Name: Main_Control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Generates the 2-bit ALU Op
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module Main_Control(
    input wire [6:0] opcode,
    output reg Branch,
    output reg MemRead, 
    output reg MemWrite, 
    output reg MemToReg, 
    output reg RegWrite, 
    output reg ALUSrc,
    output reg [1:0] ALUOp
    );
 
    // Define opcodes for different instructions
    localparam Rformat_OPCODE = 7'b0110011; //Opcode for R-Format instructions
    localparam BEQ_OPCODE = 7'b1100011;     //Opcode for Branch instructions
    localparam LD_OPCODE = 7'b0000011;      //Opcode for Load instructions
    localparam SD_OPCODE = 7'b0100011;      //Opcode for Store instructions
    localparam IType_OPCODE = 7'b0010011;   //Opcode for I Type

    // Define ALUOp (ALU Operation) codes
    localparam ALUOP_LDSD = 2'b00;  //Both LD and SD has the same ALU Operation bits
     localparam ALUOP_BEQ = 2'b01;  //beq ALU operation bits
     localparam ALUOP_R = 2'b10;    //R-format ALU operation bits
     
     // Control signal logic based on opcode
    always @(*) begin
        // Reset signals or default values 
        Branch = 1'b0;  
        ALUOp = 2'b11;

        // Set control signals based on opcode (Refer to Control Signal setting table)
        case (opcode)
            BEQ_OPCODE: begin   
                Branch = 1'b1; // Set Branch signal for 'beq' instruction
                ALUOp = ALUOP_BEQ; // Set ALUOp to indicate a subtract operation for 'beq'
            end
            
            LD_OPCODE: begin    //Control Signals for LD instruction
                MemRead = 1'b1; 
                MemToReg = 1'b1;
                RegWrite = 1'b1;
                ALUSrc = 1'b1;
                ALUOp = ALUOP_LDSD;
            end
            
            SD_OPCODE: begin    //Control signal for SD instructions
                ALUSrc = 1'b1;
                RegWrite = 1'b0;
                MemRead = 1'b0;
                MemWrite = 1'b1;
                ALUOp = ALUOP_LDSD;
            end
            
            Rformat_OPCODE: begin //Control signal for R format instructions
                ALUSrc = 1'b0;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = ALUOP_R;
            end
            
            IType_OPCODE: begin //Control signal for I type 
                ALUSrc = 1'b1;
                MemToReg = 1'b0;
                RegWrite = 1'b1;
                MemRead = 1'b0;
                MemWrite = 1'b0;
                ALUOp = ALUOP_R;
            end
        endcase
     end
endmodule
