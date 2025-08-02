module alu(input [7:0] a, input [7:0] b, input [3:0] alu_sel, output reg [7:0] result, output reg carry_out, output reg zero);


always @(*) begin
case(alu_sel)
4'b0000 : {carry_out, result} = a + b;
4'b0001 : {carry_out, result} = a - b;
4'b0010 : result = (b != 0) ? a / b : 8'd0;
4'b0011 : result = a / b;
4'b0100 : result = a << 1;
4'b0101 : result = a >> 1;
4'b0110 : result = {a[6:0] , a[7]};
4'b0111 : result = {a[0] , a[7:1]};
4'b1000 : result = a & b;
4'b1001 : result = a | b;
4'b1010 : result = a ^ b;
4'b1011 : result = ~(a | b);
4'b1100 : result = ~(a & b);
4'b1101 : result = ~(a ^ b);
4'b1110 : result = (a>b)?8'd1:8'd0;
4'b1111 : result = (a==b)?8'd1:8'd0;
default : result = 8'd0;
endcase

if (alu_sel == 4'b0000 || alu_sel == 4'b0001)
carry_out = (alu_sel == 4'b0000) ? (a + b > 8'hFF) : (a < b);
else
carry_out = 1'b0;

zero = (result == 8'b00000000);
end
endmodule

