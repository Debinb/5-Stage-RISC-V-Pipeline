`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 11:52:41 AM
// Design Name: 
// Module Name: ALU_Module
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

module ALU_Module(
    input wire [31:0] data1, data2,
    input wire [3:0] control,
    output reg [31:0] result,
    output wire zero
);
 // Define operations
 localparam ADD = 4'b0010;
 localparam SUB = 4'b0110;
 localparam AND = 4'b0000;
 localparam OR =  4'b0001;
 
 // Perform the operation based on the control signal
 always @(*) begin
    case (control)
        ADD: result = data1 + data2;
        SUB: result = data1 - data2;
        AND: result = data1 & data2;
        OR: result =  data1 | data2;
        default: result = 32'hffffffff; // Default case
    endcase
 end
 
 // Set the zero flag if the result is 0
 assign zero = (result != 0);
 
endmodule
