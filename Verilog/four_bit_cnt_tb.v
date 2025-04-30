// four bit couinter test bench

module four_bit_cnt_tb(

); 

reg clk;
reg resetn;
wire[3:0] count;

// counter module instatiation
bit4counter cnt(
    .clk (clk),
    .resetn (resetn),
    .count (count)
);

// generate clock signal
// clk flips every 5 ns i.e. 200Mhz
always #5 clk = ~clk;

initial begin
    clk <= 0;
    resetn <= 1;

    #20 resetn = 1;
    #10 resetn = 0;

    //#10 $finish;
end

endmodule;


