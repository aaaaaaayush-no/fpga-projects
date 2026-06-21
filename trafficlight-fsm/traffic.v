// Code your design here
module traffic(
	input clk, 
  	input reset,
  output reg [2:0] light
);
  parameter red=2'b00, green=2'b01, yellow=2'b10;
  parameter red_time=5, green_time = 3, yellow_time = 1;
  reg [1:0] state, next;
  
  
  reg [3:0] clkcnt = 0;
  reg [3:0] duration;
  
  
  
  always @(*) begin
    case(state)
      red: begin next = green; duration = red_time; end
      green: begin next = yellow; duration = green_time; end
      yellow: begin next = red; duration = yellow_time; end
      
      default: begin next = red; duration = red_time; end 
    endcase
    
  end
  
  always @(posedge clk) begin
    if(reset) begin
      state <= red;
    	clkcnt <= 0;
    end
    else begin
      if(clkcnt==duration) begin
        state <= next;
        clkcnt <= 0;
      end
      else
        clkcnt <= clkcnt+1;
      
    end
     
    
  end
  
  always @(*) begin
    case(state)
      red:    light = 3'b100;
      green:  light = 3'b001;
      yellow: light = 3'b010;
      default: light = 3'b100;
    endcase
  end
  
endmodule
  
  
  
  
  