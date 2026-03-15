// Code your testbench here
// or browse Examples
module tb;
  logic d;
  logic rst,clk;
  logic q,qb;
  
  jk_d uut (.d(d),.rst(rst),.clk(clk),.q(q),.qb(qb));
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    rst=0;
    d=0;
    
    #10 rst=1;
    d=0;
    #10 d=1;
    #10 d=0;
    #20 $finish;
    
  end
  initial begin
    $dumpfile("dump.vcd");$dumpvars;
  end
endmodule