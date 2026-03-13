// Code your design here
module d(
  input logic d,
  input logic clk,
  input logic rst,
  output logic q,qb);
  always_ff @(posedge clk)begin
    if(!rst)
      q<=1'b0;
    else 
      q<=d;
  end
  assign qb=~q;
endmodule 