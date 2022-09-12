\m4_TLV_version 1d: tl-x.org
// Makerchip & Sandpiper Conditional compilation TEST 
\SV
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   m4_makerchip_module   
   //logic [15:0] a,b,c;
   '],['
   module top(input clk, input reset, output reg [15:0] c, input wire [15:0]a,b);
   '])   
\TLV
   $reset = *reset;
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   '],['
   $aa = *a;
   $bb = *b;
   '])   
   $cc[31:0] = $aa[15:0] + $bb[15:0];
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   '],['
   *c = $cc;
   '])   
   

   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule