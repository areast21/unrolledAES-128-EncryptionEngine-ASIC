module aesRound(input 			clk,
				input 			rst,
				input  [0:3]    curRnd,
		        input  [0:127]  prevRK,
			 	input  [0:127] 	rndDataIn,
			 	output [0:127] 	curRK,
			 	output [0:127] 	rndDataOut);

	wire [0:127] sbtDataOut, srDataOut, mcDataOut;
	 
	subByteTransform sbt (clk, rst, rndDataIn, sbtDataOut);
	shiftRow sr (clk, rst, sbtDataOut, srDataOut);
	mixColumn mc (clk, rst, srDataOut, mcDataOut);
	addRndKey ark (clk, rst, curRnd, prevRK, mcDataOut, curRK, rndDataOut);

endmodule
