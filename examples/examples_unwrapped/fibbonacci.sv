module fib(
    input wire clk, 
    input wire rst,
    input wire [3:0] count,
    output wire [15:0] value
);
reg [15:0] current, previous;
reg [3:0] counter;
always@(posedge clk) begin 
    if(rst) begin 
        current <= 1'b1;
        previous <= 1'b0;
        counter <= count;
    end
    else if (counter > 0) begin 
        counter <= counter -1;
        previous <= current;
        current <= current + previous;
    end
end
assign value = current;
endmodule

module tb;
reg clk=0, rst;
reg [3:0] count;
wire [15:0] value;
always #5 clk = ~clk;
fib dut(.clk(clk), .rst(rst), .value(value),.count(count));
initial begin 
    rst = 1'b1;
    count = 10;
    #10 rst = 1'b0;
    #400 $finish;

end

initial begin 
    $monitor("[%0t] value = %d",$time,value);
    $dumpfile("test2.vcd");
    $dumpvars;
end

endmodule