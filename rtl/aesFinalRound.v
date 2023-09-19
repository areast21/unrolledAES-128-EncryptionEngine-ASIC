module aesFinalRound(input clk,
					 input rst, 
					 input [0:3] curRnd,
			 		 input [0:127] prevRK,
			 		 input [0:127] rndDataIn,
			 		 output reg rdy,
			 		 output reg done,
			 		 output [0:127] curRK,
			 		 output [0:127] rndDataOut);

	wire [0:127] sbtDataOut, srDataOut, mcDataOut;
	
	always @(posedge clk) begin
		if(rst) begin
			rdy <= 1'b1;
			done <= 1'b0;
		end
		else if(!rst && rndDataOut !== 128'bx) begin
			rdy <= 1'b1;
			done <= 1'b1;
		end
		else begin
			rdy <= 1'b0;
			done <= 1'b0;
		end
	end
	
	subByteTransform sbt (clk, rst, rndDataIn, sbtDataOut);
	shiftRow sr (clk, rst, sbtDataOut, srDataOut);
	addRndKey ark (clk, rst, curRnd, prevRK, srDataOut, curRK, rndDataOut);

endmodule
