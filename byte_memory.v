`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2025 08:56:50 AM
// Design Name: 
// Module Name: byte_memory
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



module byte_memory(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : latch_loop
            d_latch latch (
                .D(data[i]),
                .E(store),
                .Q(memory[i]),
                .NotQ() // optional
            );
        end
    endgenerate

endmodule

