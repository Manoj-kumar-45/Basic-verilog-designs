module jk_d(
  input logic d,
  input logic rst,
  input logic clk,
  output logic q,qb);
  
  wire j,k;
  
  assign j=d;
  assign k=~d;
  
  always_ff @(posedge clk)begin
    if(!rst)
      q<=1'b0;
    else begin
      case({j,k})
         2'b00:q<=q;
         2'b01:q<=0;
         2'b10:q<=1;
         2'b11:q<=~q;
        default q<=q;
        endcase
    end
  end
  assign qb=~q;
endmodule 

        
  