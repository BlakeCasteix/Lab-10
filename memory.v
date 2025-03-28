`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 08:56:50 AM
// Design Name: 
// Module Name: memory
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

module memory (
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

wire [3:0] enable;
wire [7:0] mem_out [3:0];

assign enable = (store) ? (4'b0001 << addr) : 4'b0000;

genvar i;
generate
    for (i = 0; i < 4; i = i + 1) begin: mem_block
        byte_memory mem (
            .data(data),
            .store(enable[i]),
            .memory(mem_out[i])
        );
    end
endgenerate

assign memory = mem_out[addr];

endmodule
