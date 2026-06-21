module uart(
	input clk,
  	input start,
  	input [7:0] data,   // byte to send
    output reg tx,      // serial output line
    output reg busy
);
  
  reg [7:0] data_buff;
  parameter idle = 0, START = 1, DATA = 2, STOP = 3;
  
  
  
  reg [1:0] state, next;
  
  always @(*) begin
    case(state)
      idle: next = start? START: idle;
      START: next = DATA;
      DATA: next = (clkcnt == 7)? STOP: DATA;
      STOP: next = idle;
      
      default: next = idle;
    
    endcase
  end
  
  reg[2:0] clkcnt;
  
  initial begin
        state     = idle;
        clkcnt = 0;
        data_buff  = 0;
    end
  
  always @(posedge clk) begin
    case(state)
      idle: begin
        if(start)
          data_buff <= data;
      end
      START: clkcnt <= 0;
      
      DATA: begin
        data_buff <= data_buff>>1; //right shift to send lsb first
        clkcnt <= clkcnt + 1;
        
      end
      
    endcase
      
    
  end
  
  
  always @(posedge clk) begin
    state <= next;
end
  
  always @(*) begin
    case(state)
      idle: begin tx = 1; busy = 0; end
      START: begin tx=0; busy = 1; end
      DATA: begin
        tx = data_buff[0]; busy = 1;
      end
      STOP: begin tx = 1; busy =1;end
      
      default: begin tx = 1; busy = 0; end
    
    endcase
  end
  
  
endmodule