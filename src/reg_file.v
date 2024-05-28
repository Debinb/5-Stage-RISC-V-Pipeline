`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 03:54:04 AM
// Design Name: 
// Module Name: reg_file
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
//  if(RegWrite) begin
//        regs[write_reg] = write_data;
//    end
// This line of code was implemented using ChatGPT
//////////////////////////////////////////////////////////////////////////////////

module reg_file(
    input wire [4:0] read_addr1, read_addr2, write_reg,
    input wire [31:0] write_data, 
    input wire RegWrite,
    output reg [31:0] read_data1, read_data2, 
    output wire [31:0] x9, x10, x11, x12
 );
 // Register array
 reg [31:0] regs[31:0];
   
assign x9 = regs[9]; 
assign x10 = regs[10];
assign x11 = regs[11];
assign x12 = regs[12];

 // Read operation (combinational)
 always @(*) begin
    read_data1 = (read_addr1 != 0) ? regs[read_addr1] : 0;
    read_data2 = (read_addr2 != 0) ? regs[read_addr2] : 0;
    
    if(RegWrite) begin
        regs[write_reg] = write_data;
    end
 end 
 

endmodule
