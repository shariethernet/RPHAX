\m4_TLV_version 1d: tl-x.org
// Makerchip & Sandpiper Conditional compilation TEST 

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

   // $num_in[15:0] = $s_axis_data[15:0];
   $reset = $s_axis_data[16];
   //---------------------------------------------------

   '])   

   // >>n stages the pipesignal through 'n' flops 
   // if reset is 1, then num becomes 1. In makerchip reset is 1 for the first 5 cycles.
   // num_in will be the starting value of the fibboncci series
   // Comment the below line if you dont allocate input buffer in python
   //$num[15:0] = $num_in;

   $num[15:0] = $reset ? 1'b1 : >>1$num+ >>2$num; 
   //$num_in = $num_out;

   //...

m4_ifelse_block(M4_MAKERCHIP, 1,['
   *passed = *cyc_cnt > 40;
   *failed = 1\'b0;
    '],['
   \SV_plus
      always_ff @(posedge *clk) begin
         *m_axis_valid <= $s_axis_valid & $s_axis_ready;
      end

   //--------------------------------------------
   //Map TLV signals to Verilog 
   $m_axis_data[31:0] = $num;
   //--------------------------------------------

   //AXI Stream Outputs
   //*s_axis_ready = $s_axis_ready;
   //*m_axis_valid = $m_axis_valid;
   *m_axis_data = $m_axis_data;
   '])   


\SV
   endmodule