	`timescale 1ns/100ps

module shiftRow_TB;
	
	reg clk, rst;
	wire [0:127] seed = 128'h63C0AB20EB2F30CB9F93AF2BA092C7A2;
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
	
	shiftRow dut(.clk(clk),
				 .rst(rst),
				 .dataIn(seed),
		    	 .dataOut(disp));
	
	initial begin
		$dumpfile("shiftRow.vcd");
		$dumpvars(0,shiftRow_TB);
		#500 $finish;
	end
	
endmodule

/* Test vector based on lecture notes from: https://www.kavaliro.com/wp-content/uploads/2014/03/AES.pdf,
		1. input - 128'h63C0AB20EB2F30CB9F93AF2BA092C7A2, output - 128'h632FAFA2EB93C7209F92ABCBA0C0302B - CORRECT
		2. input - 128'h6AA0303D594E9CF4CB48989BBD129E8B, output - 128'h6A4E988B59489E3DCB1230F4BDA09C9B - CORRECT
		3. input - 128'h1AB4D3AAAB5BBAE80130E9BB2741D29A, output - 128'h1A5BE99AAB30D2AA0141D3E827B4BABB - CORRECT
		4, input - 128'hBC3804205138FF26EEEB9A39B31218A1, output - 128'hBC389AA151EB1820EE120426B338FF39 - CORRECT
		5. input - 128'hC874D15530B020F8F2C8DD66943750B7, output - 128'hC8B0DDB730C85055F237D1F894742066 - CORRECT
*/
