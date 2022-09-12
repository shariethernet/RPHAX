\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   // >>n stages the pipesignal through 'n' flops 
   // if reset is 1, then num becomes 1. In makerchip reset is 1 for the first 5 cycles.
   $num[15:0] = $reset ? 1'b1 : >>1$num + >>2$num; 

   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule