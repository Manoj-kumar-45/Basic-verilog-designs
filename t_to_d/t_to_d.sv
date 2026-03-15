
module t_d(
  input logic d,
  input logic clk,
  input logic rst,
  output logic q,qb);
  logic t;
  assign t=q^d;
  always_ff@(posedge clk)begin
    if(!rst)
      q<=1'b0;
    else begin
      case(t)
      1'b0:q<=q;
      1'b1:q<=~q;
        default:q<=q;
      endcase
    end
  end
  assign qb=~q;
endmodule 


