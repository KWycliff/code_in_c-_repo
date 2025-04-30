
module bit4counter(clk,resetn,count);
input clk;
input resetn;
output count;

reg[3:0] count;

always @(posedge clk) begin
    if(resetn == 0)
        count = 4'b0;
    else if(count == 4'b1111)
        count = 4'b0;
    else
        count = count +1;
end
endmodule