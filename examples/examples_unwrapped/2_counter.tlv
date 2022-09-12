\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   // >>n stages the pipesignal through 'n' flops 
   // At reset, the counter is initialized to 0, after that the counter starts counting from 0 in steps of 1
   $count[15:0] = $reset ? 1'b0 : >>1$count + 1'b1; 
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule