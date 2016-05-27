module TestIntitializer(
    output reg                        clk,
    output reg                        rst,
    output reg                       start,
    input                                done
);

   initial begin
      clk = 1'b0;
      rst = 1'b0; // activate reset
      repeat(4) #10 clk = ~clk;
      rst = 1'b1; // deactivate reset
      forever #10 clk = ~clk; // generate a clock
   end

   initial begin
      start = 0;
      @(posedge rst); // wait for reset
      start = 1;
      @(posedge clk);
      start =0;
      #2100
      if ( done == 1'b0 )
        $display("not done!");
      else
        $display("done high");
      $stop;
   end

endmodule
