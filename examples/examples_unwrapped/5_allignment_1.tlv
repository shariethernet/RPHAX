\m4_TLV_version 1d: tl-x.org
\SV
	`include "sqrt32.v"
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV

   //Stimulus
   |calc
      @0
         $valid = $rand_valid;
         ?$valid
            $aa[31:0] = $rand_aa[4:0];
            $bb[31:0] = $rand_bb[4:0];
   //DUT
   $reset = *reset;
   |calc
      ?$valid
         @1
            $aa_sq[31:0] = $aa * $aa;
            $bb_sq[31:0] = $bb * $bb;
         @2
            $cc_sq[31:0] = $aa_sq + $bb_sq;
         @3
            $cc[31:0] = sqrt($cc_sq);
      @4
         ?$valid
            $tot_incr[31:0] = >>1$tot_dist + $cc;
            $tot_dist[31:0] = /top<<3$reset ? 32'b0 : $valid ? $tot_incr : >>1$tot_dist;
            // When reset is 1, tot_dist becomes zero, when reset is not asserted, then we check for validity
            // when the transaction is valid, tot_incr is assigned to total distance, when the transaction is
            // invalid then we retain the value of total distance
   //Output
   |calc
      @0
         $cyc_cnt[15:0] = /top>>1$reset ? 16'b0 : >>1$cyc_cnt+16'b1;
      @5
         \SV_plus
            always_ff@(posedge clk) begin 
               if($valid) begin
                  \$display("Cyc \%d:\\n  \$aa: \%d\\n  \$bb: \%d\\n  \$cc: \%d\\n  \$tot_dist: \%d\\n", $cyc_cnt,$aa, $bb, $cc, $tot_dist);
               end
            end
      @1
         // Pass the test on cycle 40.
         *passed = $cyc_cnt > 16'd40;
//   *failed = 1'b0;
\SV
   endmodule