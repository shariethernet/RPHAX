\m4_TLV_version 1d: tl-x.org
\SV
   // Conways Game of Life
   // It is a 0 player game, and has to be initialized with an initial seed value
   // In a grid of cells, a cell lives only if there are exactly three surrounding cells
   // among the 8 cells, if they are less than three then the cell dies of starvation 
   // and if there are more than 3 then the cell dies of overpopulation. This applies to
   // all the cells including the corner cells
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   localparam X_SIZE = 10;
	localparam Y_SIZE = 10;
\TLV
   
   // DUT
   
   |default
      @1
         $reset = *reset; // Verilog reset to TLV Reset
      /yy[Y_SIZE-1:0]
         /xx[X_SIZE-1:0]
            @1
               // Cell Logic
               // For a 3x3 cell, keep the required cell at the center, then there are 8 surrounding cells
               //  wasAliveLeft + wasAliveCurrent+ wasAliveRight 
               $row_cnt[1:0] = {1'b0,(/xx[(xx + X_SIZE - 1) % X_SIZE]>>1$alive && (xx > 0))}+ //previous cell and it musnt be the first col
                               {1'b0, >>1$alive} +
                               {1'b0,(/xx[(xx + X_SIZE + 1) % X_SIZE]>>1$alive && (xx < X_SIZE-1))}; //next cell and it musnt be the last col
               // Count alive in rows 
               // no of alive in current row + above + below
               $cnt[3:0] = {2'b00,(/yy[(yy + Y_SIZE - 1) % Y_SIZE]$row_cnt && ( yy > 0))} +
                           {2'b00, $row_cnt} +
                           {2'b00, (/yy[(yy + Y_SIZE + 1) % Y_SIZE]$row_cnt && ( yy < Y_SIZE - 1))};
               // At reset, alive gets an initial value, if the previously the cell is alive, then now if the count is exactly 3 then the 
               // cell is still alive, if the cell was not alive previously and the count becomes 3 exactly then the cell is alive
               $alive = |default$reset ? $init_alive : >>1$alive ? ( $cnt >=3 && $cnt <=4) : ($cnt == 3) ;
   
   
                  // ===========
               // Init state.
               
               //_rand($init_alive, 0, 0, (yy * xx) ^ ((3 * xx) + yy))
   
   // TB
   
   // Declare success when the total live cells are above 25% and remains below 6.23% for 20 cycles
   // Count the 
   
   |default
      /tb
         @2
            /yy[Y_SIZE-1:0]
               /xx[X_SIZE-1:0]
                  \SV_plus
                     if (xx < X_SIZE - 1)
                        assign $$right_alive_accum[10:0] = /xx[xx + 1]$horiz_alive_accum;
                     else
                        assign $right_alive_accum[10:0] = 11'b0;
                  $horiz_alive_accum[10:0] = $right_alive_accum + {10'b0, |default/yy/xx$alive};
               \SV_plus
                  if (yy < Y_SIZE -1)
                     assign $$below_alive_accum[21:0] = /yy[yy + 1]$vert_alive_accum;
                  else
                     assign $below_alive_accum[21:0] = 22'b0;
               $vert_alive_accum[21:0] = $below_alive_accum + {11'b0, /xx[0]$horiz_alive_accum};
            $alive_cnt[21:0] = /yy[0]$vert_alive_accum;
            $above_min_start = $alive_cnt > (X_SIZE * Y_SIZE) >> 2;  // 1/4
            $below_max_stop  = $alive_cnt < (X_SIZE * Y_SIZE) >> 4;  // 1/16
            $start_ok = |default$reset ? 1'b0 : (>>1$start_ok || $above_min_start);
            $stop_cnt[7:0] = |default$reset  ? 8'b0 :
                             $below_max_stop ? >>1$stop_cnt + 8'b1 :
                                               8'b0;
            *passed = >>1$start_ok && (($alive_cnt == '0) || (>>1$stop_cnt > 8'd20));

      /print
         // Print
         @2
            \SV_plus
               always_ff @(posedge clk) begin
                  \$display("---------------");
                  for (int y = 0; y < Y_SIZE; y++) begin
                     if (! |default$reset) begin
                        \$display("    \%10b", |default/yy[y]/xx[*]$alive);
                     end
                  end
               end
\SV
endmodule