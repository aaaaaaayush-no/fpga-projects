// Code your testbench here
// or browse Examples
module tb_traffic();
  reg clk;
  reg reset;
  wire [2:0] light;
  
  
  
  always #5 clk = ~clk;
  
  traffic dut(.clk(clk), .reset(reset), .light(light));
  
  initial begin
    clk = 0;
    reset = 1;
    #12 reset=0;
    #200 $finish;
    
    
  end
    
    initial begin
  		$dumpfile("dump.vcd");
      $dumpvars(0, tb_traffic);
 
  end
  
endmodule