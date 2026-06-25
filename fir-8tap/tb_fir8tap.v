`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2026 08:04:13 PM
// Design Name: 
// Module Name: tb_fir8tap
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


module tb_fir8tap(

    );
    reg clk=0;
  
  reg signed [7:0] x;
  
  wire signed [7:0] y;
  
  always #10 clk = ~clk;
  
  fir8tap #(.WIDTH(8), .N(8)) dut (.clk(clk), .x(x), .y(y));
  
  initial begin
  		$dumpfile("dump.vcd");
    $dumpvars(0, tb_fir8tap);
 
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
  
  initial begin
    $monitor("Time=%0t | x=%d | y=%d", $time, x, y);
end
  
endmodule
