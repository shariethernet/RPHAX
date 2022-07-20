	wire [C_S_AXI_DATA_WIDTH-1:0] c;

	always @(*)
	begin
		case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
			3'h0		:	reg_data_out <= slv_reg0;
			3'h1		:	reg_data_out <= slv_reg1;
			3'h2		:	reg_data_out <= c;
			default	: 	reg_data_out <= 0;
		endcase
	end

	harness_axi harness_axi_inst(
		.clk(S_AXI_ACLK),
		.reset(S_AXI_ARESETN),
		.a(slv_reg0),
		.b(slv_reg1),
		.c(c)
	);

endmodule

