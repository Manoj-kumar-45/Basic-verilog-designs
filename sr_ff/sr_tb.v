module tb_sr_ff;

  logic clk;
  logic rst;
  logic en;
  logic s, r;
  logic q, qb;

  // DUT instantiation
  ff dut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .s(s),
    .r(r),
    .q(q),
    .qb(qb)
  );

  // Clock generation (10 time unit period)
  initial clk = 0;
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Initialize signals
    rst = 0;
    en  = 0;
    s   = 0;
    r   = 0;

    // Apply reset
    #2;
    rst = 0;
    #8;
    rst = 1;        // release reset

    // Enable flip-flop
    #10;
    en = 1;

    // SET operation (Q = 1)
    #10;
    s = 1; r = 0;

    // HOLD
    #10;
    s = 0; r = 0;

    // RESET operation (Q = 0)
    #10;
    s = 0; r = 1;

    // HOLD
    #10;
    s = 0; r = 0;

    // INVALID case (S=1, R=1)
    #10;
    s = 1; r = 1;

    // Disable
    #10;
    en = 0;
    s  = 0;
    r  = 0;

    #20;
    $finish;
  end

  // Monitor
  initial begin
    $monitor("time=%0t clk=%b rst=%b en=%b S=%b R=%b Q=%b QB=%b",
              $time, clk, rst, en, s, r, q, qb);
  end
  initial begin
    $dumpfile("dump.vcd");$dumpvars;
  end

endmodule
