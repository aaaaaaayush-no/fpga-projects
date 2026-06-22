`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2026 11:14:08 PM
// Design Name: 
// Module Name: tb_uart
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


module tb_uart();
  
  reg clk = 0;
  reg start;
  reg [7:0] data;
  wire tx;
  wire busy;
  
  
  always #5 clk = ~clk;
  
  uart dut(.clk(clk), .start(start), .data(data), .tx(tx), .busy(busy));
  
  
  initial begin
    data = 8'b10110100;
    
    // Wait a bit then trigger first transmission
    #100;
    start = 1;
    #10;
    start = 0;
    
    // Wait for first transmission to finish
    @(negedge busy);  // waits until busy goes low
    #200;
    
    // Send second byte
    data = 8'b11001100;
    start = 1;
    #10;
    start = 0;
    
    // Wait for second transmission to finish
    @(negedge busy);
    #200;
    
    $finish;
  end
  
  initial begin
  		$dumpfile("dump.vcd");
    $dumpvars(0, tb_uart);
 
  end
  
  initial begin
        $monitor("Time=%0t | tx=%b | busy=%b", $time, tx, busy);
    end
  
endmodule