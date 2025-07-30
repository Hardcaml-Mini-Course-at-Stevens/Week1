module nexys_a7_100t (
    clock_100,
    switches,
    leds
);

    input clock_100;
    input [15:0] switches;
    output [15:0] leds;

    wire _18;
    wire [4:0] _17;
    wire _16;
    wire _14;
    wire [4:0] _12;
    wire _10;
    wire _8;
    wire _6;
    wire [4:0] _5;
    reg [4:0] _11;
    wire [4:0] _13;
    reg [4:0] _19;
    wire [14:0] _20;
    wire gnd;
    wire [15:0] _21;
    assign _18 = switches[2:2];
    assign _17 = 5'b00000;
    assign _16 = switches[1:1];
    assign _14 = switches[0:0];
    assign _12 = switches[12:8];
    assign _10 = switches[2:2];
    assign _8 = switches[1:1];
    assign _6 = switches[0:0];
    assign _5 = switches[7:3];
    always @(posedge clock_100 or posedge _6) begin
        if (_6)
            _11 <= _17;
        else
            if (_8)
                _11 <= _17;
            else
                if (_10)
                    _11 <= _5;
    end
    assign _13 = _11 & _12;
    always @(posedge clock_100 or posedge _14) begin
        if (_14)
            _19 <= _17;
        else
            if (_16)
                _19 <= _17;
            else
                if (_18)
                    _19 <= _13;
    end
    assign _20 = { _19,
                   _13,
                   _11 };
    assign gnd = 1'b0;
    assign _21 = { gnd,
                   _20 };
    assign leds = _21;

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
