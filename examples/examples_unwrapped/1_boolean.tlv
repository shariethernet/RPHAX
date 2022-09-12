\m4_TLV_version 1d: tl-x.org
   //The above line indicates the syntax version and whether or not to use ,4 pre processing
\SV
   m4_makerchip_module   
	// This macro expands to the top module as required by makerchip
	// This has clk, reset, cycle counter inputs 
	//For the first 5 cycles makerchip will tie reset to high
\TLV
   $reset = *reset;
   $out_and = $aa & $bb;
   $out_or = $aa | $bb;
   $out_not = !($out_and & $out_or);
   $out_xor = $aa ^ $bb;
   

   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule