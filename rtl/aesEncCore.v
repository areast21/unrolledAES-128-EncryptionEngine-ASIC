module aesEncCore(input clk, 
				  input rst,
				  input [0:127] plainText,
				  input [0:127] key,
				  output rdy,
				  output done,
				  output [0:127] cipherText);
	
	wire rdy_next, done_next;
	wire [0:127] prevKey, dataIn, curKey, dataOut;
	wire [0:127] rndOutput [0:9];
	wire [0:127] rndKey [0:9];
	reg [0:127] roundOneInput;
	
	always @(posedge clk) begin
		if(!rst)
			roundOneInput = plainText ^ key;
	end
	
	genvar round;
	generate
		for(round = 1; round <= 10; round = round + 1) begin
			if(round == 1) begin
				aesRound rndOpr1 (.clk(clk),
								  .rst(rst),
								  .curRnd(4'd1),
				 			 	  .prevRK(key),
				 			 	  .rndDataIn(roundOneInput),
				 			 	  .curRK(rndKey[0]),
				 			 	  .rndDataOut(rndOutput[0]));
			end
			else if(round > 1 && round < 10) begin
				aesRound rndOpr29 (.clk(clk),
								   .rst(rst),
								   .curRnd(round),
				 			 	   .prevRK(rndKey[round-2]),
				 			 	   .rndDataIn(rndOutput[round-2]),
				 			 	   .curRK(rndKey[round-1]),
				 			 	   .rndDataOut(rndOutput[round-1]));
			end
			else begin
				aesFinalRound rndOpr10 (.clk(clk),
										.rst(rst),
									    .curRnd(4'd10),
				 			 	   		.prevRK(rndKey[8]),
				 			 	   		.rndDataIn(rndOutput[8]),
				 			 	   		.rdy(rdy),
				 			 	   		.done(done),
				 			 	   		.curRK(rndKey[9]),
				 			 	   		.rndDataOut(rndOutput[9]));
				assign cipherText = rndOutput[9];
			end
		end
	endgenerate

endmodule
