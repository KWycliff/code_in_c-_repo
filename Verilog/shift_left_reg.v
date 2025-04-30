// shift register

module shift_reg_left(clk,resetn,pload,sload,din,dout,pout);
input clk;
input resetn;
input[3:0] pload;
input sload;
input din;

output dout;
output[3:0] pout;

reg[3:0] qt;

always @(posedge clk) begin
    if(resetn)
        qt <= 4'b0000;
    else if(sload==1)
        qt <= pload;
    else
        qt <= {qt[2:0], din};
end

assign pout = qt;
assign dout = qt[3];

endmodule
