\m4_TLV_version 1d: tl-x.org
\SV
	`include "sqrt32.v"
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   //DUT - 3D Pythagorean theorem
   |calc
      @0
         /ins[2:0]
            $val_sq[31:0] = $val[15:0] ** 2;
      @1
         $cc_sq[31:0] = /ins[0]$val_sq + /ins[1]$val_sq + /ins[2]$val_sq ;
      @2
         $cc[15:0] = sqrt($cc_sq);
   
   
   //Print
   |calc
      @2
         \SV_plus
            always_ff @(posedge clk) begin
               \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2) + (\%2d ^ 2) ) = %2d", /ins[0]$val, /ins[1]$val,/ins[2]$val_sq, $cc);
            end
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule