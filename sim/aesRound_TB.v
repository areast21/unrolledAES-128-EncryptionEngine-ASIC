`timescale 1ns/1ps

module aesRound_TB;
	
	reg clk, rst;
	wire [0:3] round = 4'd1;
	wire [0:127] prevKey, dataIn, curKey, dataOut;
	
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
	
	assign prevKey = 128'h5468617473206D79204B756E67204675;
	assign dataIn  = 128'h001F0E543C4E08596E221B0B4774311A;
	
	aesRound DUT(.clk(clk),
				 .rst(rst),
				 .curRnd(round),
				 .prevRK(prevKey),
				 .rndDataIn(dataIn),
				 .curRK(curKey),
				 .rndDataOut(dataOut));
	
	initial begin
		$dumpfile("aesRound.vcd");
		$dumpvars(0,aesRound_TB);
		#5000 $finish;
	end

endmodule
