module mixColumn(input clk,
				 input rst,
				 input [0:127] dataIn,
		 		 output wire [0:127] resMat);

	reg [0:127] tempRes;
	wire [0:7] resMul2[0:15], resMul3[0:15];
	
	genvar i;
	generate
		for(i = 0; i < 16; i = i + 1) begin
			multiplier m2 (.sel(1'b0), .dataIn(dataIn[(i*8):((i*8)+7)]), .dataOut(resMul2[i]));
			multiplier m3 (.sel(1'b1), .dataIn(dataIn[(i*8):((i*8)+7)]), .dataOut(resMul3[i]));
		end
	endgenerate
	
	always @(posedge clk) begin
		if(rst)
			tempRes <= 128'b0;
		else if(!rst) begin
			//GF(2^8) transformation for 1st column
			tempRes[0:7]     <= resMul2[0] ^ resMul3[1] ^ dataIn[16:23] ^ dataIn[24:31];
			tempRes[8:15]    <= dataIn[0:7] ^ resMul2[1] ^ resMul3[2] ^ dataIn[24:31];
			tempRes[16:23]   <= dataIn[0:7] ^ dataIn[8:15] ^ resMul2[2] ^ resMul3[3];
			tempRes[24:31]   <= resMul3[0] ^ dataIn[8:15] ^ dataIn[16:23] ^ resMul2[3];
			
			//GF(2^8) transformation for 2nd column
			tempRes[32:39]   <= resMul2[4] ^ resMul3[5] ^ dataIn[48:55] ^ dataIn[56:63];
			tempRes[40:47]   <= dataIn[32:39] ^ resMul2[5] ^ resMul3[6] ^ dataIn[56:63];
			tempRes[48:55]   <= dataIn[32:39] ^ dataIn[40:47] ^ resMul2[6] ^ resMul3[7];
			tempRes[56:63]   <= resMul3[4] ^ dataIn[40:47] ^ dataIn[48:55] ^ resMul2[7];
			
			//GF(2^8) transformation for 3rd column
			tempRes[64:71]   <= resMul2[8] ^ resMul3[9] ^ dataIn[80:87] ^ dataIn[88:95];
			tempRes[72:79]   <= dataIn[64:71] ^ resMul2[9] ^ resMul3[10] ^ dataIn[88:95];
			tempRes[80:87]   <= dataIn[64:71] ^ dataIn[72:79] ^ resMul2[10] ^ resMul3[11];
			tempRes[88:95]   <= resMul3[8] ^ dataIn[72:79] ^ dataIn[80:87] ^ resMul2[11];
			
			//GF(2^8) transformation for 4th column
			tempRes[96:103]  <= resMul2[12] ^ resMul3[13] ^ dataIn[112:119] ^ dataIn[120:127];
			tempRes[104:111] <= dataIn[96:103] ^ resMul2[13] ^ resMul3[14] ^ dataIn[120:127];
			tempRes[112:119] <= dataIn[96:103] ^ dataIn[104:111] ^ resMul2[14] ^ resMul3[15];
			tempRes[120:127] <= resMul3[12] ^ dataIn[104:111] ^ dataIn[112:119] ^ resMul2[15];
		end
	end
	
	assign resMat = tempRes;
	
endmodule
