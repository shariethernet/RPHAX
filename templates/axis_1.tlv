\m4_TLV_version 1d: tl-x.org

\SV

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

\TLV

   //inputs
   //$axi_clk = *axi_clk;
   $axi_reset_n = *axi_reset_n;
   $s_axis_valid = *s_axis_valid;
   $s_axis_data[DATA_WIDTH:0] = *s_axis_data; //parametize
   $m_axis_ready = *m_axis_ready;
   



   $s_axis_ready = $m_axis_ready; //When the my slave is ready to accept data I am ready to accept
   

   //--------- USER LOGIC SPACE BEGIN --------------  
   //            --- Sample ---
   // /datas[(DATA_WIDTH / 8)-1:0]
   //   $m_axis_data[7:0] = ($s_axis_valid & $s_axis_ready) ? 255 - $s_axis_data[#datas * 8+:8]) : $RETAIN;
   //   $m_axis_valid = $s_axis_valid & $s_axis_ready;
   //-------- USER LOGIC SPACE END --------------

   \SV_plus
      always_ff @(posedge *clk) begin
         m_axis_valid <= s_axis_valid & s_axis_ready;
      end

   //outputs
   *s_axis_ready = $s_axis_ready;
   *m_axis_valid = $m_axis_valid;
   *m_axis_data = $m_axis_data;
\SV
   endmodule
