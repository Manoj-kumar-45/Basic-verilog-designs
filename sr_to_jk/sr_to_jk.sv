// Code your design here
module sr_jk(
  input logic j,k,
  input logic clk,
  input logic rst,
  output logic q,qb);
  logic s,r;
  assign s=(~q)&j;
  assign r=q&k;
  
  always_ff @(posedge clk)begin
    if(!rst)
      q<=1'b0;
    else begin
      case({s,r})
        2'b00:q<=q;
        2'b01:q<=0;
        2'b10:q<=1;
        2'b11:q<=1'bx;
      endcase
    end
  end
  assign qb=~q;
endmodule 