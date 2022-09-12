\m4_TLV_version 1d: tl-x.org
\SV
   m4_include_lib(['https://raw.githubusercontent.com/TL-X-org/tlv_lib/master/fundamentals_lib.tlv'])
   m4_def(rphax_module,['
   m4_ifelse(M4_MAKERCHIP, 1,['
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

   ']
      )
      ']) 
\TLV display($enable_log, disp_data)
   \SV_plus
      always_ff@(posedge clk) begin 
         if($enable_log) \$display(disp_data);
      end
// Usage m4+display(1," "str %0d",$signal ")

// To connect TLV Signals to AXI Stream signals
/*
\TLV connect_axistream()

*/