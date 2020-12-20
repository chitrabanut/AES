module mixcolumn(output  [127:0] out, input [127:0] in);
  reg [31:0] A1 ={2'd2,2'd3,2'd1,2'd1,2'd1,2'd2,2'd3,2'd1,2'd1,2'd1,2'd2,2'd3,2'd3,2'd1,2'd1,2'd2};
  reg [7:0]sum;
    reg [7:0]W1;
  reg [7:0]W3;
  wire[127:0] W2;
  reg[127:0]  W4;
  trans_pose t3(W2,in);
    integer i=0,j=0,k=0;
  always@ (W2)
    begin
        i = 0;
        j = 0;
        k = 0;
        //Matrix multiplication   
      for ( i=3; i>-1; i=i-1) 
          begin
          for ( j = 0; j <4; j=j+1)
            begin
              sum=8'b0;
            for (k = 3; k >-1; k=k-1)
                begin
                  if(A1[(i * 8)+1 +(k*2) -:2]==2'b01)
                  begin sum = sum^W2[((k+1)*32)-1-(j*8)-:8]; end
                  if(A1[(i * 8)+1 +(k*2) -:2]==2'b10)
                 begin W1=W2[((k+1)*32)-1-(j*8)-:8]<<1; 
                       sum=sum^W1;
                   if(W2[((k+1)*32)-1-(j*8)]==1'b1) begin sum=sum^8'b00011011;end
                      end
                  else if(A1[(i * 8)+1 +(k*2) -:2]==2'b11)
                 begin W3=W2[((k+1)*32)-1-(j*8)-:8]<<1;
                 sum=sum^W3^W2[((k+1)*32)-1-(j*8)-:8];
                   if(W2[((k+1)*32)-1-(j*8)]==1'b1) begin sum=sum^8'b00011011;end 
                 end
                  W4[(i* 32)+7+((3-j)*8) -: 8] = sum;

                end
            end
          end
        end
  trans_pose T4(out ,W4 );      
endmodule

    

    
