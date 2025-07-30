module nexys_a7_100t (
    clock_100,
    switches,
    leds
);

    input clock_100;
    input [15:0] switches;
    output [15:0] leds;

    wire _10;
    wire [12:0] _9;
    wire _8;
    wire _6;
    wire [12:0] _5;
    reg [12:0] _11;
    wire [2:0] _4;
    wire [15:0] _12;
    assign _10 = switches[2:2];
    assign _9 = 13'b0000000000000;
    assign _8 = switches[1:1];
    assign _6 = switches[0:0];
    assign _5 = switches[15:3];
    always @(posedge clock_100 or posedge _6) begin
        if (_6)
            _11 <= _9;
        else
            if (_8)
                _11 <= _9;
            else
                if (_10)
                    _11 <= _5;
    end
    assign _4 = 3'b000;
    assign _12 = { _4,
                   _11 };
    assign leds = _12;

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
