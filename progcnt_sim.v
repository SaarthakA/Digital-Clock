`timescale 1ns / 1ps
module progcnt_sim();
reg clk =0;
reg rst;
reg en = 1;
wire [3:0] count;

progcnt uut(.clk(clk),.rst(rst),.en(en),.count(count));

localparam T = 10;
always begin #(T/2) clk = ~clk; end
initial begin 
rst = 1;
#(T/2) rst = 0;
end
endmodule
