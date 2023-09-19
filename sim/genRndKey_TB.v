`timescale 1ns/100ps

module genRndKey_TB;

	reg clk, rst;
	wire [0:3] rnd = 4'd1;
	wire [0:127] prevKey = 128'h5468617473206D79204B756E67204675;
	wire [0:127] genKey;
	
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
	
	genRndKey dut(.clk(clk),
				  .rst(rst),
				  .curRnd(rnd),
				  .prevRK(prevKey),
				  .rndKey(genKey));
				  
	initial begin
		$dumpfile("genRndKey.vcd");
		$dumpvars(0,genRndKey_TB);
		#50 $finish;
	end

endmodule

/*
Given main key  - 128'h5468617473206D79204B756E67204675

	round 1 key  - 128'hE232FCF191129188B159E4E6D679A293 - OBTAINED
	round 2 key  - 128'h56082007C71AB18F76435569A03AF7FA - OBTAINED
	round 3 key  - 128'hD2600DE7157ABC686339E901C3031EFB - OBTAINED
	round 4 key  - 128'hA11202C9B468BEA1D75157A01452495B - OBTAINED
	round 5 key  - 128'hB1293B3305418592D210D232C6429B69 - OBTAINED
	round 6 key  - 128'hBD3DC2B7B87C47156A6C9527AC2E0E4E - OBTAINED
*/
