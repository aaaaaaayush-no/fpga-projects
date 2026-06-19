module testbench_alu();
  
  reg [3:0] a;
  reg [3:0] b;
  reg [1:0] sel;
  wire [3:0] result;
  wire carry;
  
  
  initial begin
  $dumpfile("dump.vcd");
    $dumpvars(0, testbench_alu);
    
    $monitor("t=%0t a=%b b=%b sel=%b result=%b carry=%b",
                 $time, a, b, sel, result, carry);
    
    
  end
  
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  alu dut(.a(a), .b(b), .sel(sel), .result(result), .carry(carry));
  
  
  task check;
        input [3:0] exp_result;
        input exp_carry;
        input [15:0] test_num;
        begin
            if (result === exp_result && carry === exp_carry)
                $display("TEST %0d PASS", test_num);
            else
                $display("TEST %0d FAIL | got result=%b carry=%b | expected result=%b carry=%b",
                         test_num, result, carry, exp_result, exp_carry);
        end
    endtask
  
  
  
  
    
    initial begin
     a = 4'd2; b = 4'd3; sel = 2'b00;
        #1 check(4'd5, 1'b0, 1);

        #10 a = 4'd6; b = 4'd6; sel = 2'b00;
        #1 check(4'd12, 1'b0, 2);

        #10 a = 4'd4; b = 4'd2; sel = 2'b01;
        #1 check(4'd2, 1'b0, 3);

        #10 a = 4'd2; b = 4'd6; sel = 2'b01;
        #1 check(4'd12, 1'b1, 4);

        #10 a = 4'b1111; b = 4'b1111; sel = 2'b10;
        #1 check(4'b1111, 1'b0, 5);

        #10 a = 4'b1000; b = 4'b0111; sel = 2'b10;
        #1 check(4'b0000, 1'b0, 6);

        #10 a = 4'b0011; b = 4'b0001; sel = 2'b10;
        #1 check(4'b0001, 1'b0, 7);

        #10 a = 4'b1111; b = 4'b1111; sel = 2'b11;
        #1 check(4'b1111, 1'b0, 8);

        #10 a = 4'b1000; b = 4'b0111; sel = 2'b11;
        #1 check(4'b1111, 1'b0, 9);

        #10 a = 4'b0011; b = 4'b0001; sel = 2'b11;
        #1 check(4'b0011, 1'b0, 10);

        $display("===== Testbench Complete =====");
        $finish;
    end
    
  
endmodule
  
  
  