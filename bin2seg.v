`timescale 1ns / 1ps
// Lab 2, Question 3.2
// Engineer(s): Saarthak Ahlawat
// Date: 5/9/2016
// Description: binary 7 segment decoder
//
module bin2seg(
    input ca,
    input [3:0] bin,
    output reg [1:7] seg
    ); 
always @(*)
    begin
    seg = 7'b000_0000; //default all segments off  
    case(bin) //abcdefg
        0: seg = 7'b111_1110;
        1: seg = 7'b011_0000;
        2: seg = 7'b110_1101;
        3: seg = 7'b111_1001;
        4: seg = 7'b011_0011;
        5: seg = 7'b101_1011;
        6: seg = 7'b101_1111;
        7: seg = 7'b111_0010;
        8: seg = 7'b111_1111;
        9: seg = 7'b111_0011;
        10: seg = 7'b111_0111;
        11: seg = 7'b001_1111;
        12: seg = 7'b100_1110;
        13: seg = 7'b011_1101;
        14: seg = 7'b100_1111;
        15: seg = 7'b100_0111;
    endcase
        if(ca)seg=~seg; //flip polarity for common anode
        end  
endmodule
