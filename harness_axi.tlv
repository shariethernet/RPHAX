\m4_TLV_version 1d -p verilog --fmtFlatSignals --bestsv --noline: tl-x.org
\SV
module harness_axi(
    input clk,
    input reset,
    input [31:0] a,
    input [31:0] b,
    output [31:0] c
    );

assign c = a + b;

endmodule
