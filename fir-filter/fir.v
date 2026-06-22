`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 05:23:31 PM
// Design Name: 
// Module Name: fir
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


module fir #(parameter WIDTH=8, parameter N=4)(
	input clk,
  input signed [WIDTH-1: 0] x,
  output reg signed [WIDTH-1:0] y
);
  
  wire signed[7:0] h[0:3];
  
  assign h[0] = 8'sd10;
  assign h[1] = 8'sd118;
  assign h[2] = 8'sd118;
  assign h[3] = 8'sd10;
  
  initial begin
    shift_reg[0] = 0;
    shift_reg[1] = 0;
    shift_reg[2] = 0;
    shift_reg[3] = 0;
    y = 0;
end
  
  
  reg[WIDTH-1:0] shift_reg [0:3];
  
  always @(posedge clk) begin
    shift_reg[0] <= x;
    shift_reg[1] <= shift_reg[0];
    shift_reg[2] <= shift_reg[1];
    shift_reg[3] <= shift_reg[2];
      
  end
  
  wire signed [WIDTH+7:0] mult [0:3];
  
  
  wire signed [WIDTH+9:0] add;
  
   assign mult[0] = shift_reg[0] * h[0];
   assign mult[1] = shift_reg[1] * h[1];
   assign mult[2] = shift_reg[2] * h[2];
   assign mult[3] = shift_reg[3] * h[3];
  
  
  assign add = mult[0] + mult[1] + mult[2] + mult[3];
  
  always @(posedge clk) begin
    y <= add[WIDTH+7 : 8];
  end
  
endmodule
  
  
  
  
  
  
  
    