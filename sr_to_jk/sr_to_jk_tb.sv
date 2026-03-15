// Code your testbench here
// or browse Examples
module tb;
  logic j,k;
  logic clk;
  logic rst;
  logic q,qb;
  sr_jk uut (.j(j),.k(k),.clk(clk),.rst(rst),.q(q),.qb(qb));
  initial clk=0;
  always #5 clk=~clk;
  initial begin 
    rst=0;
    j=0;k=0;
    #10 rst=1;
         j=0;k=0;
     #10 j=0;k=1;
     #10 j=1;k=0;
     #10 j=1;k=1;
    #20 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");$dumpvars;
  end
endmodule 
    
   