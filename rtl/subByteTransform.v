module subByteTransform(input clk,
					    input rst,
						input [0:127] dataIn,
						output wire [0:127] subMat);

	genvar byteNum;
	generate
		for(byteNum = 0; byteNum <= 15; byteNum = byteNum + 1) begin
			aesSBox subByte (.clk(clk),
							 .rst(rst),
							 .dataIn(dataIn[(byteNum*8):((byteNum*8)+7)]),
							 .dataOut(subMat[(byteNum*8):((byteNum*8)+7)]));
		end
	endgenerate
	
endmodule
