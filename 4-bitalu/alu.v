module alu(
  input[3:0] a,
  input[3:0] b,
  input[1:0] sel,
  output reg [3:0] result,
  output reg carry 

);
  
  reg [4:0] temp;
  
  always @(*) begin
    case(sel)
      0: begin
        temp = a + b;
        result = temp[3:0];
        carry = temp[4];
        
      end
      1: begin
        temp = a - b;
        result = temp[3:0];
        carry = temp[4];
        
      end
      2: begin
        result = a & b;
        carry = 0;
        
      end
      3: begin
        result = a | b;
        carry = 0;
        
      end
      
      default: begin
        temp = 0;
        carry = 0;
      end
    endcase
    
  end
  
  
endmodule
      
  