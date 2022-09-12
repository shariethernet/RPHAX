module counter#(parameter WIDTH=16)(input wire clk, 
                                    input wire rst, 
                                    input wire [WIDTH-1:0] count_ini, 
                                    output wire [WIDTH-1:0] value);
reg [WIDTH-1:0] count;
always @(posedge clk) begin
    if(rst) begin 
        count <= count_ini;  
    end else begin 
        count <= count + 1;
    end  
end
assign value = count;
endmodule

module tb;
reg clk, rst;
reg [15:0] count_ini;
wire [15:0] value;
always #5 clk = ~clk;
counter #(.WIDTH(16)) dut (.clk(clk),
                            .rst(rst),
                            .count_ini(count_ini),
                            .value(value));
initial begin 
    clk <= 0;
    rst <= 1;
    count_ini = 2;
    #10 rst = 0;
    #80 $finish;
end

initial begin 
    $monitor("[%0t] Value = %d", $time,value);
    $dumpfile("testcount.vcd");
    $dumpvars;
end
endmodule