// Code your testbench here
// or browse Examples
module clkdividertb();
  
  reg clk;
  wire clk_out;
  
  
  
  clock_divider #(.divider(10))  dut(.clk(clk), .clk_out(clk_out));
  
  always #5 clk = ~clk;
  
  
  initial begin
    clk = 0;
    #500 $finish;
    
  end
  
  initial begin
  $dumpfile("dump.vcd");
    $dumpvars(0, clkdividertb);
    
    $monitor("Time=%0t | clk=%b | clk_out=%b", $time, clk, clk_out);
    
    
  end
  
  
endmodule