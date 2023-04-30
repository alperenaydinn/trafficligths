module traffic_lights(
  input clk,
  input rst,
  output reg red,
  output reg blue,
  output reg green
);

  reg [23:0] counter;
  integer second;

  always @(posedge clk or negedge rst) begin
    if (!rst) begin
      counter <= 24'd0;
      red <= 1'b1;
      blue <= 1'b0;
      green <= 1'b0;
    end else begin
      if (second < 11) begin // Kırmızı ışık 10 saniye yanar
        red <= 1'b0;
        blue <= 1'b1;
        green <= 1'b1;
      end 

      else if (second < 14) begin // Sarı ışık 2 saniye yanar
        red <= 1'b0;
        blue <= 1'b1;
        green <= 1'b0;
      end 

      else if (second < 20) begin // Yeşil ışık 5 saniye yanar
        red <= 1'b1;
        blue <= 1'b1;
        green <= 1'b0;
      end 
      else if (second < 23) begin // Sarı ışık 2 saniye yanar
        red <= 1'b0;
        blue <= 1'b1;
        green <= 1'b0;
      end 
      counter <= counter + 1;
      if (counter == 24'd2400_0000) begin
        counter <= 24'd0;
        second <= second + 1;
        if (second > 25 )begin
        second <= 0;
        end
      end
    end
  end
endmodule