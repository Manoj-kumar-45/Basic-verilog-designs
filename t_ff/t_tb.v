module tb;
  logic t,clk,rst;
  logic q,qb;
  t uut (.t(t),.clk(clk),.rst(rst),.q(q),.qb(qb));
  initial clk=0;
  always #5 clk=~clk;
  initial begin
  rst=0;
  t=0;
  end
  initial begin
    #10 rst=1;
    t=1;
    #10t=0;
    
    #10 t=1;
    #10 t=0;
    #20 $finish;
  end
  initial begin
    $dumpfile("dum.vcd");$dumpvars;
  end
endmodule 