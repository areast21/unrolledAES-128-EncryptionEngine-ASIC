module shiftRow(input clk,
				input rst,
				input [0:127] dataIn,
				output [0:127] dataOut);
	
	reg [0:127] shiftedMat;
	
	always @(posedge clk) begin
		if(rst)
			shiftedMat <= 128'd0;
		else begin
			//Row 1 - Not shifted
			shiftedMat[0:7]    <= dataIn[0:7];
			shiftedMat[32:39]  <= dataIn[32:39];
			shiftedMat[64:71]  <= dataIn[64:71];
			shiftedMat[96:103] <= dataIn[96:103];
			
			//Row 2 - Circular left shift by 1 byte
			shiftedMat[8:15]    <= dataIn[40:47];
			shiftedMat[40:47]   <= dataIn[72:79];
			shiftedMat[72:79]   <= dataIn[104:111];
			shiftedMat[104:111] <= dataIn[8:15];
			
			//Row 3 - Circular left shift by 2 byte
			shiftedMat[16:23]   <= dataIn[80:87];
			shiftedMat[48:55]   <= dataIn[112:119];
			shiftedMat[80:87]   <= dataIn[16:23];
			shiftedMat[112:119] <= dataIn[48:55];
			
			//Row 4 - Circular left shift by 3 byte
			shiftedMat[24:31]   <= dataIn[120:127];
			shiftedMat[56:63]   <= dataIn[24:31];
			shiftedMat[88:95]   <= dataIn[56:63];
			shiftedMat[120:127] <= dataIn[88:95];
		end
	end
	
	assign dataOut = shiftedMat;
	
endmodule
