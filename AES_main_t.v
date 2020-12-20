module Main_test;
 
 reg [127:0] data_in;
 reg [127:0] key;
wire [127:0] out;
 
 Main_con MC_1 (out,data_in,key);
initial  #500 $finish;



initial begin 

  #10 key="Thats my Kung Fu"; data_in="Two One Nine Two";  
end
  
  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
end


endmodule
