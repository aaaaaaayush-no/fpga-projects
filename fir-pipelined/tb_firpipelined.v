`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2026 08:42:55 PM
// Design Name: 
// Module Name: tb_firpipelined
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


module tb_firpipelined(

    );
    
    reg clk=0;
  
  reg signed [7:0] x;
  
  wire signed [7:0] y;
  
  always #10 clk = ~clk;
  
  firpipelined #(.WIDTH(8), .N(8)) dut (.clk(clk), .x(x), .y(y));
  
  initial begin
  		$dumpfile("dump.vcd");
    $dumpvars(0, tb_firpipelined);
 
  end
  
  
  
 initial begin
    x = 8'sd100;
    #400;  // wait longer for pipeline to fill and settle
    repeat(20) begin
        x = 8'sd100; #20;   // match 20ns clock period
        x = -8'sd100; #20;
    end
    #500 $finish;
    
end
  
  initial begin
    $monitor("Time=%0t | x=%d | y=%d", $time, x, y);
end
  
endmodule
