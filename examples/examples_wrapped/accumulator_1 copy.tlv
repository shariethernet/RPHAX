\m4_TLV_version 1d: tl-x.org
\SV
   m4_ifelse_block(M4_MAKERCHIP, 1,['
   m4_makerchip_module   
   '],['
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
   |default
      m4_ifelse_block(M4_MAKERCHIP, 1,['
      @0
         $reset = *reset;
      @1
         m4_rand($in,3,0);
         m4_rand($valid,0,0);
   '],['

   // Template connections
   // $axi_reset_n = *axi_reset_n;
   |default
      @0
         $s_axis_valid = *s_axis_valid;
         $s_axis_data[31:0] = *s_axis_data; //parametize
         $m_axis_ready = *m_axis_ready;
         $s_axis_ready = $m_axis_ready;
         //----------- kernel connections 
         $in[3:0] = $s_axis_data[3:0];
         $valid = $s_axis_data[4];
         $reset = $s_axis_valid;
         // ----------------------------
   '])
   |default
      @1
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