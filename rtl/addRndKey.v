module addRndKey(input clk,
				 input rst,
				 input [0:3] curRnd,
				 input [0:127] prevRK,
				 input [0:127] dataIn,
				 output reg [0:127] curRK,
				 output reg [0:127] dataOut);

  wire [0:127] getRK;
  
  genRndKey genrk (clk, rst, curRnd, prevRK, getRK);
  
  always @ (posedge clk) begin
 	if(dataIn != 128'd0) begin
  		curRK <= getRK;
		dataOut <= dataIn ^ getRK;
	end
  end

endmodule  
