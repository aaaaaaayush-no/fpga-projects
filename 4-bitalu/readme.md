This is a basic 4-bit alu that can :
 -add
 -subtract-
 -logical and
 -logical or

 the selector lines from sel is used to drive the alu to required outputs:
 00: add
 01: subtract
 10: logical and
 11: logical or

The output values are result and carry;


used testcases:
        a = 4'd2; b = 4'd3; sel = 2'b00;

        a = 4'd6; b = 4'd6; sel = 2'b00;

        a = 4'd4; b = 4'd2; sel = 2'b01;

        a = 4'd2; b = 4'd6; sel = 2'b01;

        a = 4'b1111; b = 4'b1111; sel = 2'b10;

        a = 4'b1000; b = 4'b0111; sel = 2'b10;

        a = 4'b0011; b = 4'b0001; sel = 2'b10;


        a = 4'b1111; b = 4'b1111; sel = 2'b11;

        a = 4'b1000; b = 4'b0111; sel = 2'b11;

        a = 4'b0011; b = 4'b0001; sel = 2'b11;
