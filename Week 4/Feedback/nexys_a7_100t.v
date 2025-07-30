module nexys_a7_100t (
    clock_100,
    switches,
    leds
);

    input clock_100;
    input [15:0] switches;
    output [15:0] leds;

    wire [4:0] _8;
    wire _7;
    wire [4:0] _6;
    wire [4:0] _10;
    wire [4:0] _2;
    reg [4:0] _13;
    wire [4:0] _11;
    wire [4:0] _14;
    wire [4:0] _4;
    reg [4:0] _9;
    wire [10:0] _15;
    wire [15:0] _16;
    assign _8 = 5'b00000;
    assign _7 = switches[0:0];
    assign _6 = switches[5:1];
    assign _10 = _6 | _9;
    assign _2 = _10;
    always @(posedge clock_100) begin
        if (_7)
            _13 <= _8;
        else
            _13 <= _2;
    end
    assign _11 = switches[10:6];
    assign _14 = _11 & _13;
    assign _4 = _14;
    always @(posedge clock_100) begin
        if (_7)
            _9 <= _8;
        else
            _9 <= _4;
    end
    assign _15 = 11'b00000000000;
    assign _16 = { _15,
                   _9 };
    assign leds = _16;

endmodule
module nexys_a7_100t_top
(
  input [15:0] switches,
  input clock_100,
  input reset_n,
  output [15:0] leds
);

  nexys_a7_100t _5
  (
    .switches(switches), 
    .clock_100(clock_100), 
    .leds(leds)
  );
endmodule
