// Code your design here
module ff(
  input logic s,r,
  input logic clk,
  input logic rst,
  input logic en,
  output logic q,qb);
  always_ff@(posedge clk) begin
    if(!rst)
     q<=1'b0;
    else if(en) begin
      case({s,r})
        2'b00:q<=q;
        2'b01:q<=1'b0;
        2'b10:q<=1'b1;
        2'b11:q<=1'bx;
      endcase
       end
    else 
        q<=q;
    
    assign qb=~q;
   
  end
endmodule 