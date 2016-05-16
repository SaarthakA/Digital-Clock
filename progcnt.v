`timescale 1ns / 1ps

module progcnt #(
parameter N = 4, // default 4-bit counter
parameter MAX = 15 // max value for counter
)
(clk, rst, en, count);

input clk;              
input rst;              
input en;              
output reg [N-1:0] count;

always @(posedge clk, posedge rst)
if (rst) begin
    count <= 0;
end else begin
    if (en) begin
        if (count == MAX)
            count <= 0;
        else
            count <= count + 1; // increment by 1
        end
end
endmodule