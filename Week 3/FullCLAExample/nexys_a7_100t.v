module nexys_a7_100t (
    switches,
    leds
);

    input [15:0] switches;
    output [15:0] leds;

    wire _56;
    wire _53;
    wire _54;
    wire _55;
    wire _49;
    wire _50;
    wire _47;
    wire _48;
    wire _51;
    wire _52;
    wire _42;
    wire _43;
    wire _44;
    wire _39;
    wire _40;
    wire _37;
    wire _38;
    wire _41;
    wire _45;
    wire _46;
    wire [3:0] _57;
    wire _34;
    wire _32;
    wire _30;
    wire _31;
    wire _33;
    wire _35;
    wire _26;
    wire _25;
    wire _27;
    wire _23;
    wire _22;
    wire _24;
    wire _28;
    wire _18;
    wire _17;
    wire _19;
    wire _15;
    wire _16;
    wire _20;
    wire _11;
    wire _10;
    wire _12;
    wire _9;
    wire _13;
    wire [3:0] _6;
    wire _7;
    wire [4:0] _4;
    wire _5;
    wire _8;
    wire _14;
    wire _21;
    wire _29;
    wire _36;
    wire [4:0] _58;
    wire [10:0] _3;
    wire [15:0] _59;
    assign _56 = _32 ^ _34;
    assign _53 = _32 & _34;
    assign _54 = _27 | _53;
    assign _55 = _23 ^ _54;
    assign _49 = _23 & _32;
    assign _50 = _49 & _34;
    assign _47 = _23 & _27;
    assign _48 = _19 | _47;
    assign _51 = _48 | _50;
    assign _52 = _15 ^ _51;
    assign _42 = _15 & _23;
    assign _43 = _42 & _32;
    assign _44 = _43 & _34;
    assign _39 = _15 & _23;
    assign _40 = _39 & _27;
    assign _37 = _15 & _19;
    assign _38 = _12 | _37;
    assign _41 = _38 | _40;
    assign _45 = _41 | _44;
    assign _46 = _9 ^ _45;
    assign _57 = { _46,
                   _52,
                   _55,
                   _56 };
    assign _34 = switches[0:0];
    assign _32 = _25 ^ _26;
    assign _30 = _9 & _15;
    assign _31 = _30 & _23;
    assign _33 = _31 & _32;
    assign _35 = _33 & _34;
    assign _26 = _6[0:0];
    assign _25 = _4[0:0];
    assign _27 = _25 & _26;
    assign _23 = _17 ^ _18;
    assign _22 = _9 & _15;
    assign _24 = _22 & _23;
    assign _28 = _24 & _27;
    assign _18 = _6[1:1];
    assign _17 = _4[1:1];
    assign _19 = _17 & _18;
    assign _15 = _10 ^ _11;
    assign _16 = _9 & _15;
    assign _20 = _16 & _19;
    assign _11 = _6[2:2];
    assign _10 = _4[2:2];
    assign _12 = _10 & _11;
    assign _9 = _5 ^ _7;
    assign _13 = _9 & _12;
    assign _6 = switches[4:1];
    assign _7 = _6[3:3];
    assign _4 = switches[9:5];
    assign _5 = _4[3:3];
    assign _8 = _5 & _7;
    assign _14 = _8 | _13;
    assign _21 = _14 | _20;
    assign _29 = _21 | _28;
    assign _36 = _29 | _35;
    assign _58 = { _36,
                   _57 };
    assign _3 = 11'b00000000000;
    assign _59 = { _3,
                   _58 };
    assign leds = _59;

endmodule
module nexys_a7_100t_top
(
  input [15:0] switches,
  output [15:0] leds
);

  nexys_a7_100t _3
  (
    .switches(switches), 
    .leds(leds)
  );
endmodule
