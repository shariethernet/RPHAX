\m4_TLV_version 1d: tl-x.org
// Makerchip & Sandpiper Conditional compilation TEST 

\SV
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   `include "sqrt32.v";
   m4_makerchip_module   
   '],['
   `include "sqrt32.v";
   module inverter#(parameter DATA_WIDTH = 32)(
    input clk,
    input axi_reset_n,

    //AXI-S Slave interface --incoming data

    input s_axis_valid, //from master
    input [DATA_WIDTH-1:0] s_axis_data,
    output s_axis_ready,

    //AXI-M Master interface --outgoing data

    output reg m_axis_valid,
    output reg [DATA_WIDTH-1:0] m_axis_data,
    input m_axis_ready
    );

   ']) 

\TLV
   
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   $reset = *reset;
   '],['

   // Template connections
   // $axi_reset_n = *axi_reset_n;
   $s_axis_valid = *s_axis_valid;
   $s_axis_data[31:0] = *s_axis_data; //parametize
   $m_axis_ready = *m_axis_ready;
   $s_axis_ready = $m_axis_ready;
   *s_axis_ready = $s_axis_ready;
   //---------------------------------------------------
   //User connections here
   $aa[15:0] = $s_axis_data[15:0];
   $bb[15:0] = $s_axis_data[31:16];
   $valid = 1\'b1;
   //---------------------------------------------------

   '])   
   
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   //Stimulus
   |calc
      @0
         $valid = & $rand_valid[1:0];
         // valid will be asserted with a probability of 0.25 (1/4)
   '],[''])

   
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
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   \SV_plus
            always_ff@(posedge clk) begin
               \$display("sqrt((\%2d ^ 2) + (\%2d ^ 2)) = \%2d", $aa,$bb,$cc);
         //\$display("sqrt of \%0d ^2 + \%%0d ^2 = \%0d",$aa,$bb,$cc);
         end
   *passed = *cyc_cnt > 40;
   *failed = 1\'b0;
    '],['
   \SV_plus
      always_ff @(posedge *clk) begin
         *m_axis_valid <= $s_axis_valid & $s_axis_ready;
      end

   //--------------------------------------------
   //Map TLV signals to Verilog 
   $m_axis_data[31:0] = $cc;
   //--------------------------------------------

   //AXI Stream Outputs
   //*s_axis_ready = $s_axis_ready;
   //*m_axis_valid = $m_axis_valid;
   *m_axis_data = $m_axis_data;
   '])   


\SV
   endmodule