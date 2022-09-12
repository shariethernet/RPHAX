\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   m4_makerchip_module
\TLV
   // Stimulus
   |calc
      @0
         // Need 3 invalid cycles before skip.
         $skip_ok = ! >>1$valid && ! >>2$valid && ! >>3$valid && >>4$valid;
         // 50% valid and 50% of those are skips, but only if it's okay to skip.
         $valid = $rand_valid && (!$rand_skip || $skip_ok) && !/top>>1$reset;
         $skip_to = $valid && $rand_skip;
         ?$valid
            $aa[31:0] = $rand_aa[4:0];
            $bb[31:0] = $rand_bb[4:0];

   // ----------------------
   // DUT
   // Reset
   // Create pipesignal out of reset module input.
!  $reset = *reset;
   // Calc pipeline
   |calc
      ?$valid
         
         // Corrected $aa for skip calculation.
         @0
            $corrected_aa[31:0] = $skip_to ? ($aa + >>4$cc) : $aa;
         // Pythagorean Theorem hop distance calculation.
         @1
            $aa_sq[31:0] =  $corrected_aa * $corrected_aa;
            $bb_sq[31:0] = $bb * $bb;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $cc[31:0] = sqrt($cc_sq);
            
      // Total distance accumulator.
      @4
         ?$valid
            $tot_incr[31:0] = >>1$tot_dist + $cc;  // adder
         $tot_dist[31:0] = /top<<3$reset ? 32'b0 :   // reset
              $valid
                     && ! <<4$skip_to
                         ? $tot_incr :   // add $cc
                                 >>1$tot_dist; // retain (or use "$RETAIN")

   // Output
   |calc
      @0
         // Free-running cycle count.
         $cyc_cnt[15:0] = /top>>1$reset ? 16'b0 : >>1$cyc_cnt + 16'b1;
      @5
         \SV_plus
            always_ff @(posedge clk) begin
               if ($valid) begin
                  \$display("Cyc \%d:\\n  \$skip_to: \%d\\n  \$aa: \%d\\n  \$bb: \%d\\n  \$cc: \%d\\n  \$tot_dist: \%d\\n", $cyc_cnt, $skip_to, $corrected_aa, $bb, $cc, $tot_dist);
                  //<(2)*> [Substitute $corrected_aa for $aa above.]
               end
            end

      @1
         // Pass the test on cycle 40.
!        *passed = $cyc_cnt > 16'd40;


\SV
endmodule
