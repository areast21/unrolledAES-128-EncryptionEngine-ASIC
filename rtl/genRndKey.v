module genRndKey(input clk,
				 input rst,
				 input [0:3] curRnd,
				 input [0:127] prevRK,
				 output reg [0:127] rndKey);

  reg [0:31] gOut, rCon;
  wire [0:31] rotOut, subOut;
  
  always @(posedge clk) begin
	if(rst)
		rndKey = 128'd0;
	else begin
		case(curRnd)
			4'd1:  rCon = {8'h01, 24'b0};
			4'd2:  rCon = {8'h02, 24'b0};
			4'd3:  rCon = {8'h04, 24'b0};
			4'd4:  rCon = {8'h08, 24'b0};
			4'd5:  rCon = {8'h10, 24'b0};
			4'd6:  rCon = {8'h20, 24'b0};
			4'd7:  rCon = {8'h40, 24'b0};
			4'd8:  rCon = {8'h80, 24'b0};
			4'd9:  rCon = {8'h1B, 24'b0};
			4'd10: rCon = {8'h36, 24'b0};
			default: rCon = 32'b0;	
	    endcase
		
		gOut = subOut ^  rCon;
		
		rndKey[0:31]   = gOut ^ prevRK[0:31];
		rndKey[32:63]  = rndKey[0:31] ^ prevRK[32:63];
		rndKey[64:95]  = rndKey[32:63] ^ prevRK[64:95];
		rndKey[96:127] = rndKey[64:95] ^ prevRK[96:127];
	end
  end
  
  assign rotOut = prevRK[96:127]<<8 | prevRK[96:127]>>24; //ROTWORD() to perform left circular shift by 1 Byte
  
  aesSBox //Implementation of SUBWORD() on each byte
  			s0 (.clk(clk), .rst(rst), .dataIn(rotOut[0:7]), .dataOut(subOut[0:7])),
  			s1 (.clk(clk), .rst(rst), .dataIn(rotOut[8:15]), .dataOut(subOut[8:15])),
  			s2 (.clk(clk), .rst(rst), .dataIn(rotOut[16:23]), .dataOut(subOut[16:23])),
  			s3 (.clk(clk), .rst(rst), .dataIn(rotOut[24:31]), .dataOut(subOut[24:31]));
  
endmodule
