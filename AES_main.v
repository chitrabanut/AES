module Main_con(output [127:0]out,input [127:0]in,input [127:0] key);
  wire [127:0]key_m;
  
  wire [127:0]W1;wire [127:0]W2;wire [127:0]W3;wire [127:0]W4;wire [127:0]W5;wire [127:0]W6;wire [127:0]W7;wire [127:0]W8;wire [127:0]W9;wire [127:0]W10;wire [127:0]W11;
  wire [127:0]S1;wire [127:0]S2;wire [127:0]S3;wire [127:0]S4;wire [127:0]S5;wire [127:0]S6;wire [127:0]S7;wire [127:0]S8;wire [127:0]S9;wire [127:0]S10;
  wire [127:0]SF1;wire [127:0]SF2;wire [127:0]SF3;wire [127:0]SF4;wire [127:0]SF5;wire [127:0]SF6;wire [127:0]SF7;wire [127:0]SF8;wire [127:0]SF9;wire [127:0]SF10;
  wire [127:0]M1;wire [127:0]M2;wire [127:0]M3;wire [127:0]M4;wire [127:0]M5;wire [127:0]M6;wire [127:0]M7;wire [127:0]M8;wire [127:0]M9;wire [127:0]M10;
  wire [127:0]k1;wire [127:0]k2;wire [127:0]k3;wire [127:0]k4;wire [127:0]k5;wire [127:0]k6;wire [127:0]k7;wire [127:0]k8;wire [127:0]k9;wire [127:0]k10;

  key_add A_0(W1,in,key);//round 0

   sub_byte S_1(S1,W1);//round 1
   shift_rows SF_1(SF1,S1);
   mixcolumn M_1(M1,SF1);
  roundkeyreg R_1(k1,key,4'd1);
   key_add A_1(W2,M1,k1);

   sub_byte S_2(S2,W2);//round 2
   shift_rows SF_2(SF2,S2);
   mixcolumn M_2(M2,SF2);
  roundkeyreg R_2(k2,k1,4'd2);
   key_add A_2(W3,M2,k2);

   sub_byte S_3(S3,W3);//round 3
   shift_rows SF_3(SF3,S3);
   mixcolumn M_3(M3,SF3);
  roundkeyreg R_3(k3,k2,4'd3);
   key_add A_3(W4,M3,k3);

   sub_byte S_4(S4,W4);//round 4
   shift_rows SF_4(SF4,S4);
   mixcolumn M_4(M4,SF4);
  roundkeyreg R_4(k4,k3,4'd4);
   key_add A_4(W5,M4,k4);

   sub_byte S_5(S5,W5);//round 5
   shift_rows SF_5(SF5,S5);
   mixcolumn M_5(M5,SF5);
  roundkeyreg R_5(k5,k4,4'd5);
   key_add A_5(W6,M5,k5);

   sub_byte S_6(S6,W6);//round 6
   shift_rows SF_6(SF6,S6);
   mixcolumn M_6(M6,SF6);
  roundkeyreg R_6(k6,k5,4'd6);
  key_add A_6(W7,M6,k6);

   sub_byte S_7(S7,W7);//round 7
   shift_rows SF_7(SF7,S7);
   mixcolumn M_7(M7,SF7);
  roundkeyreg R_7(k7,k6,4'd7);
   key_add A_7(W8,M7,k7);

   

   sub_byte S_8(S8,W8);//round 8
   shift_rows SF_8(SF8,S8);
   mixcolumn M_8(M8,SF8);
  roundkeyreg R_8(k8,k7,4'd8);
   key_add A_8(W9,M8,k8);

   sub_byte S_9(S9,W9);//round 9
   shift_rows SF_9(SF9,S9);
   mixcolumn M_9(M9,SF9);
  roundkeyreg R_9(k9,k8,4'd9);
  key_add A_9(W10,M9,k9);

  sub_byte S_10(S10,W10);//round 10
   shift_rows SF_10(SF10,S10);
  roundkeyreg R_10(k10,k9,4'd10);
  key_add A_10(W11,SF10,k10); 
   
   
 assign  out = W11;
  

endmodule

module key_add (output reg [127:0] dout,input [127:0]din,input [127:0] key);
integer i;
always@ (*)
begin
for(i=127;i>-1;i=i-8)
            
         dout[i-:8]=din[i-:8]^key[i -:8];
 end 

 endmodule 