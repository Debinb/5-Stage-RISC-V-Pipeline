`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Design Name: 
// Module Name: PC_Register
// Project Name: SingleCycleRISC
// Target Devices: 
// Tool Versions: 
// Description: 
//
// Additional Comments:
// PC register keeps track of memory address for the next instruction to be executed.
//////////////////////////////////////////////////////////////////////////////////

module PC_Register(
    input wire CLK,             // Clock input
    input wire RESET,           // Reset input
    input [31:0] MUX_IN,        // MUX input for branch target address
    output reg [31:0] pc,       // Program counter output
    output reg ce               // Clock Enable signal for ROM
);

    always @(posedge CLK) begin
        if (RESET == 1'b1) begin// If Reset is HIGH
            ce <= 1'b0;         // Disable Clock Enable signal
        end else begin          // else
            ce <= 1'b1;         // Enable Clock Enable signal
        end
    end        
        
    always @(posedge CLK) begin
        if (ce == 1'b0) begin // If Clock Enable is 0
            pc <= 32'h00;     // Fill PC reg with 0s
        end else begin        // Else
            pc <= MUX_IN;     // Update PC to branch target
        end
    end
endmodule

