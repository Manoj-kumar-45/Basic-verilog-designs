module tb;
  logic d;
  logic clk;
  logic rst;
  logic q,qb;
  t_d uut (.d(d),.clk(clk),.rst(rst),.q(q),.qb(qb));
  initial clk=0;
  always #5 clk=~clk;
  initial begin
    $monitor("d=%b;q=%b;t=%b",d,q,d^q);
    rst=0;
    d=0;
    #10 rst=1;
    d=0;
    #10d=1;
    #10d=0;
    #10d=1;
    #20 $finish;
  end
  initial begin
    $dumpfile("dump.vcd");$dumpvars;
  end
endmodule