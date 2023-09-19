`timescale 1ns/100ps

module mixColumn_TB;
	
	reg clk, rst;
	wire [0:127] seed = 128'h1A5BE9A9AB30D2AA0141D3E827B4BABB;
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
     
	mixColumn dut(.clk(clk),
				  .rst(rst),
				  .dataIn(seed),
		          .resMat(disp));
	
	initial begin
		$dumpfile("mixColumn.vcd");
		$dumpvars(0,mixColumn_TB);
		#50 $finish;
	end
	
endmodule
/*Test vector based on lecture notes from: https://www.kavaliro.com/wp-content/uploads/2014/03/AES.pdf,

			  1. input - 128'h632FAFA2EB93C7209F92ABCBA0C0302B, output - 128'hBA75F47A84A48D32E88D060E1B407D5D - CORRECT
			  2. input - 128'h6A4E988B59489E3DCB1230F4BDA09B9B, output - 128'h15CE8965C94D71477F4BBE979ACB86CA - CORRECT
			  3. input - 128'h1A5BE9A9AB30D2AA0141D3E827B4BABB, output - 128'h992568D5650CC14BFA05DE5A883A2A0A - CORRECT
			  4. input - 128'hBC389AA151EB1820EE120426B338FF39, output - 128'h10D85324BC94EA40D3E09E73F3E0257B - CORRECT
			  5. input - 128'hC8B0DDB730C85055F237D1F894742066, output - 128'h2A781B5B261EA7628F0C6F00E97A0A3F - CORRECT
			  
 Test Vector from solving an AES mix column tutorial on youtube: https://www.youtube.com/watch?v=WPz4Kzz6vk4,
			  6. input - 128'h876E46A6F24CE78C4D904AD897ECC395, output - 128'h473794ED40D4E4A5A3703AA64C9F42BC - CORRECT
			  
*/
