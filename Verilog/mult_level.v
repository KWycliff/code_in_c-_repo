
module mult_level(a,b,c,f);
input a;
input b;
input c;

output f;

wire x;
wire y;

assign x = ~(b|c);
assign y = a&(~b);
assign f = x~^y;

endmodule