module tb_johnson_counter;
    reg clk, reset;
    wire [3:0] out;

    johnson_counter uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        #10 reset = 0;
        #100 $finish;
    end

    initial begin
      $dumpfile("johnson_counter.vcd");
      $dumpvars;
        $monitor("Time = %0t | Output = %b", $time, out);
    end
endmodule