`timescale 1ns/1ps

module aesEncCore_TB;

	//input instantiation
	reg clk, rst;
	reg [0:127] PT, key;
	
	//output probes
	wire rdy, done;
	wire [127:0] CT;
	
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
	
	aesEncCore DUT (.clk(clk),
					.rst(rst),
					.plainText(PT),
					.key(key),
					.rdy(rdy),
					.done(done),
					.cipherText(CT));
					
	initial begin
		$dumpfile("aesEncCore.vcd");
		$dumpvars(0,aesEncCore_TB);
		PT  = 128'h0123456789ABCDEFFEDCBA9876543210;
		key = 128'h0F1571C947D9E8590CB7ADD6AF7F6798;
		#5000 $finish;
	end
	
endmodule
