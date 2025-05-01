module lfsr(
	input wire clk,
	input wire rst,
	output reg [3:0] pattern
);

	wire feedbeck;
	
	//多項式: x^4 + x^3 + 1 -> feedback = Q[3] ^ [2]
	assign feedback = pattern[3] ^ pattern[2];
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			pattern<= 4'b0001; //初始化不能全為0,否則會卡住
		else
			pattern <= {pattern[2:0],feedback}; //左移+回授
	end
endmodule