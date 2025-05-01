module alu(
	input wire [3:0] a, //操作數a
	input wire [3:0] b, //操作數b
	input wire [1:0] sel, //控制信號,決定執行哪種運算
	output reg [3:0] result //運算結果
);

	always @(*) begin
		case(sel)
			2'b00: result = a + b; //加法
			2'b01: result = a - b; //減法
			2'b10: result = a & b; //AND
			2'b11: result = a | b; //OR
			default: result = 4'b0000;
		endcase
	end
endmodule
			