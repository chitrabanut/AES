module shift_rows(output [127:0] out, input [127:0] in);
  wire[127:0]w1;
  wire[127:0]w2;
  
  trans_pose t1(w1,in);

  assign w2[31:0]={w1[7:0],w1[31:8]};
  assign w2[63:32]={w1[47:32],w1[63:48]};
  assign w2[95:64]={w1[87:64],w1[95:88]};
  assign w2[127:96]=w1[127:96];

  trans_pose t2(out,w2);
endmodule

module trans_pose(output [127:0]out,input [127:0] in);
                 assign out[127:96]={in[127:120],in[95:88],in[63:56],in[31:24]};
         assign  out[95:64]={in[119:112],in[87:80],in[55:48],in[23:16]};
                assign out[63:32]={in[111:104],in[79:72],in[47:40],in[15:8]};
               assign  out[31:0]={in[103:96],in[71:64],in[39:32],in[7:0]};                                                                                
                 
                 
   endmodule