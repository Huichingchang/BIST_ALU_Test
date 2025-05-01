module bist_alu_test(
	input wire clk,
	input wire rst,
	output wire [3:0] pattern_out,
	output wire [3:0] alu_result_out,
	output wire bist_pass
);

//===宣告內部訊號===
wire [3:0] pattern;
wire [3:0] alu_result;
wire [3:0] expected_result;
wire comparator_pass;

//===LFSR pattern generator===
lfsr u_lfsr(
	.clk(clk),
	.rst(rst),
	.pattern(pattern)
);

//===ALU 被測試模組===
alu u_alu(
	.a(pattern), //測試輸入A
	.b(4'b0011), //固定B(也可換成另一個LFSR)
	.sel(2'b00),  //固定操作(例如加法),之後可加FSM控制
	.result(alu_result)
);

//===Gold Reference(或硬編的期望結果)===
assign expected_result = pattern + 4'b0011; //假設是加法操作

//===Output Comparator===
comparator u_comp(
	.a(expected_result),
	.b(alu_result),
	.pass(comparator_pass)
);

//===Output mapping===
assign bist_pass = comparator_pass;
assign pattern_out = pattern;
assign alu_result_out = alu_result;

endmodule