`timescale 1ns / 1ps

module Toplv(
input en,
input clk,
input rst,
output [7:0] AN,
output [1:7] seg
);
wire [25:0] dispSel;
wire [3:0] wmod6;
wire [3:0] wmod10;
wire [3:0] wmux;
progcnt #(.N(26),.MAX(67108863)) main(.clk(clk),.rst(rst),.en(1),.count(dispSel));
progcnt #(.N(4),.MAX(9)) mod10(.clk(dispSel[25]),.rst(rst),.en(en),.count(wmod10));
progcnt #(.N(4),.MAX(5)) mod6(.clk(dispSel[25]),.rst(rst),.en(en && wmod10==9),.count(wmod6));
mux mux(.mod6(wmod6),.mod10(wmod10),.sel(dispSel[16]),.out(wmux));
bin2seg seg7(.ca(1),.bin(wmux),.seg(seg));
assign AN[7] = 1;
assign AN[6] = 1;
assign AN[5] = 1;
assign AN[4] = 1;
assign AN[3] = 1;
assign AN[2] = 1;
assign AN[1] = ~dispSel[16];
assign AN[0] = dispSel[16];

endmodule
