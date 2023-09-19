module aesSBox(input clk,
			   input rst,
			   input [0:7] dataIn,
       	       output wire [0:7] dataOut);
	
	reg [0:7] temp;
	
	always @(posedge clk) begin
	  if(rst)
	  	temp = 8'd0;
	  else begin
	  	case(dataIn)
	      //Row 1
		  8'h00:  temp = 8'h63;
		  8'h01:  temp = 8'h7c;
		  8'h02:  temp = 8'h77;
		  8'h03:  temp = 8'h7b;
		  8'h04:  temp = 8'hf2;
		  8'h05:  temp = 8'h6b;
		  8'h06:  temp = 8'h6f;
		  8'h07:  temp = 8'hc5;
		  8'h08:  temp = 8'h30;
		  8'h09:  temp = 8'h01;
		  8'h0a:  temp = 8'h67;
		  8'h0b:  temp = 8'h2b;
		  8'h0c:  temp = 8'hfe;
		  8'h0d:  temp = 8'hd7;
		  8'h0e:  temp = 8'hab;
		  8'h0f:  temp = 8'h76;
		  
		  //Row 2
		  8'h10:  temp = 8'hca;
		  8'h11:  temp = 8'h82;
		  8'h12:  temp = 8'hc9;
		  8'h13:  temp = 8'h7d;
		  8'h14:  temp = 8'hfa;
		  8'h15:  temp = 8'h59;
		  8'h16:  temp = 8'h47;
		  8'h17:  temp = 8'hf0;
		  8'h18:  temp = 8'had;
		  8'h19:  temp = 8'hd4;
		  8'h1a:  temp = 8'ha2;
		  8'h1b:  temp = 8'haf;
		  8'h1c:  temp = 8'h9c;
		  8'h1d:  temp = 8'ha4;
		  8'h1e:  temp = 8'h72;
		  8'h1f:  temp = 8'hc0;
		  
		  //Row 3
		  8'h20:  temp = 8'hb7;
		  8'h21:  temp = 8'hfd;
		  8'h22:  temp = 8'h93;
		  8'h23:  temp = 8'h26;
		  8'h24:  temp = 8'h36;
		  8'h25:  temp = 8'h3f;
		  8'h26:  temp = 8'hf7;
		  8'h27:  temp = 8'hcc;
		  8'h28:  temp = 8'h34;
		  8'h29:  temp = 8'ha5;
		  8'h2a:  temp = 8'he5;
		  8'h2b:  temp = 8'hf1;
		  8'h2c:  temp = 8'h71;
		  8'h2d:  temp = 8'hd8;
		  8'h2e:  temp = 8'h31;
		  8'h2f:  temp = 8'h15;
		  
		  //Row 4
		  8'h30:  temp = 8'h04;
		  8'h31:  temp = 8'hc7;
		  8'h32:  temp = 8'h23;
		  8'h33:  temp = 8'hc3;
		  8'h34:  temp = 8'h18;
		  8'h35:  temp = 8'h96;
		  8'h36:  temp = 8'h05;
		  8'h37:  temp = 8'h9a;
		  8'h38:  temp = 8'h07;
		  8'h39:  temp = 8'h12;
		  8'h3a:  temp = 8'h80;
		  8'h3b:  temp = 8'he2;
		  8'h3c:  temp = 8'heb;
		  8'h3d:  temp = 8'h27;
		  8'h3e:  temp = 8'hb2;
		  8'h3f:  temp = 8'h75;
		  
		  //Row 5
		  8'h40:  temp = 8'h09;
		  8'h41:  temp = 8'h83;
		  8'h42:  temp = 8'h2c;
		  8'h43:  temp = 8'h1a;
		  8'h44:  temp = 8'h1b;
		  8'h45:  temp = 8'h6e;
		  8'h46:  temp = 8'h5a;
		  8'h47:  temp = 8'ha0;
		  8'h48:  temp = 8'h52;
		  8'h49:  temp = 8'h3b;
		  8'h4a:  temp = 8'hd6;
		  8'h4b:  temp = 8'hb3;
		  8'h4c:  temp = 8'h29;
		  8'h4d:  temp = 8'he3;
		  8'h4e:  temp = 8'h2f;
		  8'h4f:  temp = 8'h84;
		  
		  //Row 6
		  8'h50:  temp = 8'h53;
		  8'h51:  temp = 8'hd1;
		  8'h52:  temp = 8'h00;
		  8'h53:  temp = 8'hed;
		  8'h54:  temp = 8'h20;
		  8'h55:  temp = 8'hfc;
		  8'h56:  temp = 8'hb1;
		  8'h57:  temp = 8'h5b;
		  8'h58:  temp = 8'h6a;
		  8'h59:  temp = 8'hcb;
		  8'h5a:  temp = 8'hbe;
		  8'h5b:  temp = 8'h39;
		  8'h5c:  temp = 8'h4a;
		  8'h5d:  temp = 8'h4c;
		  8'h5e:  temp = 8'h58;
		  8'h5f:  temp = 8'hcf;
		  
		  //Row 7
		  8'h60:  temp = 8'hd0;
		  8'h61:  temp = 8'hef;
		  8'h62:  temp = 8'haa;
		  8'h63:  temp = 8'hfb;
		  8'h64:  temp = 8'h43;
		  8'h65:  temp = 8'h4d;
		  8'h66:  temp = 8'h33;
		  8'h67:  temp = 8'h85;
		  8'h68:  temp = 8'h45;
		  8'h69:  temp = 8'hf9;
		  8'h6a:  temp = 8'h02;
		  8'h6b:  temp = 8'h7f;
		  8'h6c:  temp = 8'h50;
		  8'h6d:  temp = 8'h3c;
		  8'h6e:  temp = 8'h9f;
		  8'h6f:  temp = 8'ha8;
		  
		  //Row 8
		  8'h70:  temp = 8'h51;
		  8'h71:  temp = 8'ha3;
		  8'h72:  temp = 8'h40;
		  8'h73:  temp = 8'h8f;
		  8'h74:  temp = 8'h92;
		  8'h75:  temp = 8'h9d;
		  8'h76:  temp = 8'h38;
		  8'h77:  temp = 8'hf5;
		  8'h78:  temp = 8'hbc;
		  8'h79:  temp = 8'hb6;
		  8'h7a:  temp = 8'hda;
		  8'h7b:  temp = 8'h21;
		  8'h7c:  temp = 8'h10;
		  8'h7d:  temp = 8'hff;
		  8'h7e:  temp = 8'hf3;
		  8'h7f:  temp = 8'hd2;
		  
		  //Row 9
		  8'h80:  temp = 8'hcd;
		  8'h81:  temp = 8'h0c;
		  8'h82:  temp = 8'h13;
		  8'h83:  temp = 8'hec;
		  8'h84:  temp = 8'h5f;
		  8'h85:  temp = 8'h97;
		  8'h86:  temp = 8'h44;
		  8'h87:  temp = 8'h17;
		  8'h88:  temp = 8'hc4;
		  8'h89:  temp = 8'ha7;
		  8'h8a:  temp = 8'h7e;
		  8'h8b:  temp = 8'h3d;
		  8'h8c:  temp = 8'h64;
		  8'h8d:  temp = 8'h5d;
		  8'h8e:  temp = 8'h19;
		  8'h8f:  temp = 8'h73;
		  
		  //Row 10
		  8'h90:  temp = 8'h60;
		  8'h91:  temp = 8'h81;
		  8'h92:  temp = 8'h4f;
		  8'h93:  temp = 8'hdc;
		  8'h94:  temp = 8'h22;
		  8'h95:  temp = 8'h2a;
		  8'h96:  temp = 8'h90;
		  8'h97:  temp = 8'h88;
		  8'h98:  temp = 8'h46;
		  8'h99:  temp = 8'hee;
		  8'h9a:  temp = 8'hb8;
		  8'h9b:  temp = 8'h14;
		  8'h9c:  temp = 8'hde;
		  8'h9d:  temp = 8'h5e;
		  8'h9e:  temp = 8'h0b;
		  8'h9f:  temp = 8'hdb;
		  
		  //Row 11
		  8'ha0:  temp = 8'he0;
		  8'ha1:  temp = 8'h32;
		  8'ha2:  temp = 8'h3a;
		  8'ha3:  temp = 8'h0a;
		  8'ha4:  temp = 8'h49;
		  8'ha5:  temp = 8'h06;
		  8'ha6:  temp = 8'h24;
		  8'ha7:  temp = 8'h5c;
		  8'ha8:  temp = 8'hc2;
		  8'ha9:  temp = 8'hd3;
		  8'haa:  temp = 8'hac;
		  8'hab:  temp = 8'h6c;
		  8'hac:  temp = 8'h91;
		  8'had:  temp = 8'h95;
		  8'hae:  temp = 8'he4;
		  8'haf:  temp = 8'h79;
		  
		  //Row 12
		  8'hb0:  temp = 8'he7;
		  8'hb1:  temp = 8'hc8;
		  8'hb2:  temp = 8'h37;
		  8'hb3:  temp = 8'h6d;
		  8'hb4:  temp = 8'h8d;
		  8'hb5:  temp = 8'hd5;
		  8'hb6:  temp = 8'h4e;
		  8'hb7:  temp = 8'ha9;
		  8'hb8:  temp = 8'h6c;
		  8'hb9:  temp = 8'h56;
		  8'hba:  temp = 8'hf4;
		  8'hbb:  temp = 8'hea;
		  8'hbc:  temp = 8'h65;
		  8'hbd:  temp = 8'h7a;
		  8'hbe:  temp = 8'hae;
		  8'hbf:  temp = 8'h08;
		  
		  //Row 13
		  8'hc0:  temp = 8'hba;
		  8'hc1:  temp = 8'h78;
		  8'hc2:  temp = 8'h25;
		  8'hc3:  temp = 8'h2e;
		  8'hc4:  temp = 8'h1c;
		  8'hc5:  temp = 8'ha6;
		  8'hc6:  temp = 8'hb4;
		  8'hc7:  temp = 8'hc6;
		  8'hc8:  temp = 8'he8;
		  8'hc9:  temp = 8'hdd;
		  8'hca:  temp = 8'h74;
		  8'hcb:  temp = 8'h1f;
		  8'hcc:  temp = 8'h4b;
		  8'hcd:  temp = 8'hbd;
		  8'hce:  temp = 8'h8b;
		  8'hcf:  temp = 8'h8a;
		  
		  //Row 14
		  8'hd0:  temp = 8'h70;
		  8'hd1:  temp = 8'h3e;
		  8'hd2:  temp = 8'hb5;
		  8'hd3:  temp = 8'h66;
		  8'hd4:  temp = 8'h48;
		  8'hd5:  temp = 8'h03;
		  8'hd6:  temp = 8'hf6;
		  8'hd7:  temp = 8'h0e;
		  8'hd8:  temp = 8'h61;
		  8'hd9:  temp = 8'h35;
		  8'hda:  temp = 8'h57;
		  8'hdb:  temp = 8'hb9;
		  8'hdc:  temp = 8'h86;
		  8'hdd:  temp = 8'hc1;
		  8'hde:  temp = 8'h1d;
		  8'hdf:  temp = 8'h9e;
		  
		  //Row 15
		  8'he0:  temp = 8'he1;
		  8'he1:  temp = 8'hf8;
		  8'he2:  temp = 8'h98;
		  8'he3:  temp = 8'h11;
		  8'he4:  temp = 8'h69;
		  8'he5:  temp = 8'hd9;
		  8'he6:  temp = 8'h8e;
		  8'he7:  temp = 8'h94;
		  8'he8:  temp = 8'h9b;
		  8'he9:  temp = 8'h1e;
		  8'hea:  temp = 8'h87;
		  8'heb:  temp = 8'he9;
		  8'hec:  temp = 8'hce;
		  8'hed:  temp = 8'h55;
		  8'hee:  temp = 8'h28;
		  8'hef:  temp = 8'hdf;
		  
		  //Row 16
		  8'hf0:  temp = 8'h8c;
		  8'hf1:  temp = 8'ha1;
		  8'hf2:  temp = 8'h89;
		  8'hf3:  temp = 8'h0d;
		  8'hf4:  temp = 8'hbf;
		  8'hf5:  temp = 8'he6;
		  8'hf6:  temp = 8'h42;
		  8'hf7:  temp = 8'h68;
		  8'hf8:  temp = 8'h41;
		  8'hf9:  temp = 8'h99;
		  8'hfa:  temp = 8'h2d;
		  8'hfb:  temp = 8'h0f;
		  8'hfc:  temp = 8'hb0;
		  8'hfd:  temp = 8'h54;
		  8'hfe:  temp = 8'hbb;
		  8'hff:  temp = 8'h16;
	    endcase
	  end
	end
		
	assign dataOut = temp;
	
endmodule
