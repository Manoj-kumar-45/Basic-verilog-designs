// Code your design here
module t(
  input logic t,
  input logic clk,rst,
  output logic q,qb);
  always_ff @(posedge clk)begin
    if(!rst)
      q<=1'b0;
    else if (t)
      q<=~q;
    else 
      q<=q;
  end
  assign qb=~q;
  endmodule 
    
    