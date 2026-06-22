`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 05:23:59 PM
// Design Name: 
// Module Name: tb_fir
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


module tb_fir();
  reg clk=0;
  
  reg signed [7:0] x;
  
  wire signed [7:0] y;
  
  always #5 clk = ~clk;
  
  fir #(.WIDTH(8), .N(4)) dut (.clk(clk), .x(x), .y(y));
  
  initial begin
  		$dumpfile("dump.vcd");
    $dumpvars(0, tb_fir);
 
  end
  
  
  
  initial begin
    x = 8'sd100;
    #200;

    repeat(20) begin
        x = 8'sd100; #10;
        x = -8'sd100; #10;
    end

    #100 $finish;

 
  
  end
  
  endmodule
  
  
  
