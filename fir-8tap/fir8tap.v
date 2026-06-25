`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 07:53:13 PM
// Design Name: 
// Module Name: fir8tap
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


module fir8tap #(parameter WIDTH=8, parameter N=8)(
	input clk,
  input signed [WIDTH-1: 0] x,
  output reg signed [WIDTH-1:0] y
);
  
  wire signed[7:0] h[0:7];
  
  assign h[0] = 8'sd01;
  assign h[1] = 8'sd10;
  assign h[2] = 8'sd41;
  assign h[3] = 8'sd76;
  assign h[4] = 8'sd76;
  assign h[5] = 8'sd41;
  assign h[6] = 8'sd10;
  assign h[7] = 8'sd01;
  
  initial begin
    shift_reg[0] = 0;
    shift_reg[1] = 0;
    shift_reg[2] = 0;
    shift_reg[3] = 0;
    shift_reg[4] = 0;
    shift_reg[5] = 0;
    shift_reg[6] = 0;
    shift_reg[7] = 0;
    
    y = 0;
end
  
  
  reg signed [WIDTH-1:0] shift_reg [0:7];
  
  always @(posedge clk) begin
    shift_reg[0] <= x;
    shift_reg[1] <= shift_reg[0];
    shift_reg[2] <= shift_reg[1];
    shift_reg[3] <= shift_reg[2];
    shift_reg[4] <= shift_reg[3];
    shift_reg[5] <= shift_reg[4];
    shift_reg[6] <= shift_reg[5];
    shift_reg[7] <= shift_reg[6];
    
    
      
  end
  
  wire signed [WIDTH+7:0] mult [0:7];
  
  
  wire signed [WIDTH+10:0] add;
  
   assign mult[0] = shift_reg[0] * h[0];
   assign mult[1] = shift_reg[1] * h[1];
   assign mult[2] = shift_reg[2] * h[2];
   assign mult[3] = shift_reg[3] * h[3];
   assign mult[4] = shift_reg[4] * h[4];
   assign mult[5] = shift_reg[5] * h[5];
   assign mult[6] = shift_reg[6] * h[6];
   assign mult[7] = shift_reg[7] * h[7];
  
  
  assign add = mult[0] + mult[1] + mult[2] + mult[3] + mult[4] + mult[5] + mult[6] + mult[7];
  
  always @(posedge clk) begin
    y <= add >>> 8;
  end
  
endmodule
  