`timescale 1ns/1ps
module tb_bist_alu_test;
	
	//測試用訊號
	reg clk;
	reg rst;
	wire [3:0] pattern_out;
	wire [3:0] alu_result_out;
	wire comparator_pass;
	
	//實例化待測模組
	bist_alu_test uut(
		.clk(clk),
		.rst(rst),
		.pattern_out(pattern_out),
		.alu_result_out(alu_result_out),
		.bist_pass(comparator_pass)
	);
	
	//時脈產生:每5ns切換一次-> 10ns週期 = 100MHz
	always #5 clk = ~clk;
	
	//初始流程
	initial begin
		//初始化
		clk =0;
		rst =1;
		#20;       //reset持續20ns
		rst =0;
		
		//模擬持續一段時間
		#200;
		
		//結束模擬
		$stop;
	end
endmodule