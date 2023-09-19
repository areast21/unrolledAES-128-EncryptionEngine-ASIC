module multiplier(input sel,
				  input [0:7] dataIn,
				  output [0:7] dataOut);
				  
	assign dataOut = sel ? (dataIn[0] ? (dataIn<<1) ^ 8'h1b ^ dataIn: (dataIn<<1) ^ dataIn) : 
						   (dataIn[0] ? (dataIn<<1) ^ 8'h1b : (dataIn<<1));

endmodule
