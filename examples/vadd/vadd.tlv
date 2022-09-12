\m4_TLV_version 1d -p verilog --fmtFlatSignals --bestsv --noline: tl-x.org
\SV
module vadd_kernel#(parameter DATA_WIDTH = 32)(
    input axi_clk,
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

//No internal buffer , so full stream mode
    integer i;
    
    assign s_axis_ready = m_axis_ready; //When the my slave is ready to accept data I am ready to accept
    


    always @(posedge axi_clk) //Valid data as input and it is already processed 1 clock after
    begin
        m_axis_valid <= s_axis_valid & s_axis_ready;  
    end   

\TLV 

\SV_plus
    always_ff @(posedge axi_clk)
    begin
        if (s_axis_valid & s_axis_ready) 
        begin 
            for(i=0;i<DATA_WIDTH/8;i=i+1)
            *m_axis_data[i * 8+:8] <= 1 + *s_axis_data[i* 8+: 8];    
        end
    end 
\SV
endmodule


