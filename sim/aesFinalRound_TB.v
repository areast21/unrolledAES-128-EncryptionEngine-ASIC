`timescale 1ns/1ps

module aesFinalRound_TB;
	
	reg clk, rst;
	wire rdy, done;
	wire [0:3] round = 4'd10;
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
	
	/*Assigning round 9 output value as roundDataIn and prevKey based on the book example in cryptography and network security by William Stallings Pg. 153  TESTBENCH RECEIVED THE SAME OUTPUT AS BOOK ILLUSTRATION (RDY & DONE) SIGNALS FUNCTION CORRECTLY*/
	
	assign prevKey = 128'hFD0242CB0E16E01CC5D54A6EF96B4156;
	assign dataIn  = 128'hCCA104A13E678500FF59025F3BAFAA34;
	
	aesFinalRound DUT(.clk(clk),
				 .rst(rst),
				 .curRnd(round),
				 .prevRK(prevKey),
				 .rndDataIn(dataIn),
				 .rdy(rdy),
				 .done(done),
				 .curRK(curKey),
				 .rndDataOut(dataOut));
	
	initial begin
		$dumpfile("aesFinalRound.vcd");
		$dumpvars(0,aesFinalRound_TB);
		#5000 $finish;
	end

endmodule
