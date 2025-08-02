module alu_tb;
reg [7:0] a, b;
reg [3:0] alu_sel;
wire[7:0] result;
wire carry_out, zero;
alu uut(.a(a), .b(b), .alu_sel(alu_sel), .result(result), .carry_out(carry_out), .zero(zero));
task run_test;
input [7:0] ta, tb;
begin
a = ta;
b = tb;
for(alu_sel = 0; alu_sel < 16; alu_sel = alu_sel + 1)begin
#10;
$display("sel = %0d, a = %0d, b = %0d : result = %0d, carry = %b, zero = %b", alu_sel, a, b, result, carry_out, zero);
end
end
endtask

initial begin 
run_test(8'd15, 8'd3);     // test case 1
run_test(8'd255, 8'd1);    // test case 2
run_test(8'd0, 8'd0);  

$finish;
end
endmodule