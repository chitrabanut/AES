
module roundkeyreg (dout,din,n);

output [127:0]  dout;
input[127:0] din;
  input [3:0]n;
keycal A20( dout ,din,n);

endmodule

module keycal(output [127:0] out, input [127:0] in, input[3:0] n);

wire [127:0]W1;//shift
wire [127:0]W2;//sub
wire [127:0]W4;
  wire [31:0]Rcon;
  reg [87:0]rcon_v={8'h0,8'h1,8'h2,8'h4,8'h8 ,8'h10 ,8'h20 ,8'h40 ,8'h80 ,8'h1B ,8'h36 };

integer i,k,j;

  assign Rcon={rcon_v[87-(n*8) -:8],8'h0,8'h0,8'h0};


roundshift R1( W1,in);
sub_byte S1(W2,W1);
 
 assign     W4 [127:96]=Rcon^W2[31:0]^in[127:96];
 assign     W4 [95:64]=in[95:64]^W4 [127:96];
 assign     W4 [63:32]=in[63:32]^W4 [95:64];
 assign     W4 [31:0]=in[31:0]^W4 [63:32];


assign out=W4;
endmodule

module roundshift(output [127:0] out, input [127:0] in);

  assign out[127:96]=in[127:96];
  assign out[63:32]=in[63:32];
  assign out[95:64]=in[95:64];
  assign out[31:0]={in[23:0],in[31:24]};

endmodule

