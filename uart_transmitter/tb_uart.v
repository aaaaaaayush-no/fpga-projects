module tb_uart();
  
  reg clk = 0;
  reg start;
  reg [7:0] data;
  wire tx;
  wire busy;
  
  
  always #5 clk = ~clk;
  
  uart dut(.clk(clk), .start(start), .data(data), .tx(tx), .busy(busy));
  
  
  initial begin
    start = 0;
    data = 8'b10110100;
    
    #12 start = 1;
    #10 start = 0;
    
    #150 start=1; data = 8'b11001100;
    
    #20 start = 1;
    #10 start = 0;
    
    #300 $finish;

    
  end
  
  initial begin
  		$dumpfile("dump.vcd");
    $dumpvars(0, tb_uart);
 
  end
  
  initial begin
        $monitor("Time=%0t | tx=%b | busy=%b", $time, tx, busy);
    end
  
endmodule