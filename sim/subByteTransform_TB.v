`timescale 1ns/100ps

module subByteTransform_TB;
	
	reg clk, rst;
	wire [0:127] seed = 128'h001F0E543C4E08596E221B0B4774311A;
	wire [0:127] disp;
	
	always begin
		clk = 1'b0;
		#2;
		clk = 1'b1;
		#2;
	end
	
	initial begin
		rst = 1'b1;
		#12;
		rst = 1'b0;
	end
	
	subByteTransform dut(.clk(clk),
						 .rst(rst),
						 .dataIn(seed),
		     			 .subMat(disp));
	
	initial begin
		$dumpfile("subByteTransform.vcd");
		$dumpvars(0,subByteTransform_TB);
		#500 $finish;
	end
	
endmodule

/* Test Vectors from https://www.kavaliro.com/wp-content/uploads/2014/03/AES.pdf,
	1. input - 128'h001F0E543C4E08596E221B0B4774311A, output - 128'h63C0AB20EB2F30CB9F93AF2BA092C7A2 - CORRECT
	2. input - 128'h5847088B15B61CBA59D4E2E8CD39DFCE, output - 128'h6AA0303D594E9CF4CB48989BBD129E8B - CORRECT
	3. input - 128'h43C6A9620E57C0C80908EBFE3DF87F37, output - 128'h1AB4D3AAAB5BBAE80130E9BB2741D29A - CORRECT
	4. input - 128'h7876305470767D23993C375B4B3934F1, output - 128'hBC3804205138FF26EEEB9A39B31218A1 - CORRECT
	5. input - 128'hB1CA51ED08FC54E104B1C9D3E7B26C20, output - 128'hC874D15530B020F8F2C8DD66943750B7 - CORRECT
*/
