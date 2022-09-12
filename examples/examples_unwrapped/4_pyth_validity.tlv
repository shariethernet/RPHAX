\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;
   //Stimulus
   |calc
      @0
         $valid = & $rand_valid[1:0];
         // valid will be asserted with a probability of 0.25 (1/4)
   //DUT
   |calc
      ?$valid
         @1
            $aa_sq[31:0] = $aa[15:0] ** 2;
            $bb_sq[31:0] = $bb[15:0] ** 2;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $cc[31:0] = sqrt($cc_sq);
   //Print
   |calc
      @3
         \SV_plus
            always_ff@(posedge clk) begin
            if ($valid)
               \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2)) = \%2d", $aa,$bb,$cc);
         //\$display("sqrt of \%0d ^2 + \%%0d ^2 = \%0d",$aa,$bb,$cc);
         end
   //...

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule