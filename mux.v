`timescale 1ns / 1ps

module mux(
input [3:0] mod6,
input [3:0] mod10,
input sel,
output reg [3:0] out
);

always@(*)
case(sel)
    0: out = mod10;
    1: out = mod6;
endcase
endmodule
