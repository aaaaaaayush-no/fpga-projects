module firpipelined #(parameter WIDTH=8, parameter N=8)(
	input clk,
  input signed [WIDTH-1: 0] x,
  output reg signed [WIDTH-1:0] y
);
  
  wire signed[7:0] h[0:7];
  
  assign h[0] = 8'sd01;
  assign h[1] = 8'sd10;
  assign h[2] = 8'sd41;
  assign h[3] = 8'sd76;
  assign h[4] = 8'sd76;
  assign h[5] = 8'sd41;
  assign h[6] = 8'sd10;
  assign h[7] = 8'sd01;
  
  
  reg signed [WIDTH-1:0] shift_reg [0:7];
  
  always @(posedge clk) begin
    shift_reg[0] <= x;
    shift_reg[1] <= shift_reg[0];
    shift_reg[2] <= shift_reg[1];
    shift_reg[3] <= shift_reg[2];
    shift_reg[4] <= shift_reg[3];
    shift_reg[5] <= shift_reg[4];
    shift_reg[6] <= shift_reg[5];
    shift_reg[7] <= shift_reg[6];
    
 
  end
  
  reg signed [WIDTH+7:0] p [0:7];
 
  
   always @(posedge clk) begin
    p[0] <= shift_reg[0] * h[0];
    p[1] <= shift_reg[1] * h[1];
    p[2] <= shift_reg[2] * h[2];
    p[3] <= shift_reg[3] * h[3];
    p[4] <= shift_reg[4] * h[4];
    p[5] <= shift_reg[5] * h[5];
    p[6] <= shift_reg[6] * h[6];
    p[7] <= shift_reg[7] * h[7];
end

   
   
reg signed [16:0] s [0:3];
reg signed [17:0] t [0:1];

always @(posedge clk) begin
    s[0] <= p[0] + p[1];
    s[1] <= p[2] + p[3];
    s[2] <= p[4] + p[5];
    s[3] <= p[6] + p[7];
end

always @(posedge clk) begin
    t[0] <= s[0] + s[1];
    t[1] <= s[2] + s[3];

end
 
  always @(posedge clk) begin
    y <= (t[0] + t[1]) >>> 8;
  end
  
  
  initial begin
        shift_reg[0] = 0; shift_reg[1] = 0;
        shift_reg[2] = 0; shift_reg[3] = 0;
        shift_reg[4] = 0; shift_reg[5] = 0;
        shift_reg[6] = 0; shift_reg[7] = 0;
        y = 0;
    end
  
endmodule
  