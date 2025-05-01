// comparator.v
module comparator(
	input wire [3:0] a, //輸入數a
	input wire [3:0] b, //輸入數b
	output wire pass //相等就pass
);

assign pass = (a == b); //只要相等就輸出 pass=1
endmodule