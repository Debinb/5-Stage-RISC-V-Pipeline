`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2024 09:12:40 PM
// Design Name: 
// Module Name: dataMem
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


module dataMem(
    input wire MemRead, MemWrite,
    input wire [6:0] DataAddress,
    input wire [31:0] DataInput,
    output reg [31:0] DataOutput
    //This is a test
    );
    
    reg [31:0] dataArray[127:0];
    initial $readmemh ("data.mem", dataArray);
    
    always @(*) begin
        if(MemRead ==1'b1) begin
            DataOutput = dataArray[DataAddress];
         end
         
         if(MemWrite == 1'b1) begin
            dataArray[DataAddress] = DataInput;
          end 
     end
endmodule
