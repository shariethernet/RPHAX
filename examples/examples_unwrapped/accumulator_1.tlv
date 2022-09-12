\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template

   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   |default
   
      @0
         $reset = *reset;
      @1
         m4_rand($in,3,0);
         m4_rand($valid,0,0);
         ?$valid
            <<1$AccuMulator[31:0] = $reset ? 32'b0 : $AccuMulator + $in; 


   // Print
   |default
      @2
         \SV_plus
            always_ff @(posedge clk) begin 
             if($valid & !$reset) begin 
                \$display(" Input  = \%d , Accumulator = \%d",$in,<<1$AccuMulator);
             end
             else begin 
                \$display(" Invalid Transaction ");
             end
            end

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule