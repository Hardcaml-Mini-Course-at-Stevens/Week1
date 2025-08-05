module nexys_a7_100t (
    reset_n,
    clock_100,
    switches,
    leds,
    seven_seg_set,
    seven_seg_sel_n
);

    input reset_n;
    input clock_100;
    input [15:0] switches;
    output [15:0] leds;
    output [7:0] seven_seg_set;
    output [7:0] seven_seg_sel_n;

    wire [7:0] _30;
    wire _51;
    wire _50;
    wire _49;
    wire _47;
    wire _48;
    wire _45;
    wire _46;
    wire _42;
    wire _43;
    wire _44;
    wire _39;
    wire _40;
    wire _41;
    wire _36;
    wire _35;
    wire _37;
    wire _34;
    wire _38;
    wire [7:0] _52;
    wire [7:0] _53;
    wire [7:0] _54;
    wire [7:0] _1;
    reg [7:0] _31;
    wire [7:0] _195;
    wire [7:0] _194;
    wire [7:0] _193;
    wire [7:0] _192;
    wire [7:0] _191;
    wire [7:0] _190;
    wire [7:0] _189;
    wire [7:0] _188;
    wire [7:0] _187;
    wire [7:0] _186;
    wire [3:0] _93;
    wire [3:0] _101;
    wire [3:0] _102;
    wire _91;
    wire [3:0] _104;
    wire _67;
    wire [2:0] _64;
    wire [3:0] _68;
    wire [3:0] _62;
    reg [3:0] _106;
    wire [3:0] _3;
    reg [3:0] _60;
    wire _112;
    wire [3:0] _113;
    wire _110;
    wire [2:0] _109;
    wire [3:0] _111;
    wire [3:0] _108;
    reg [3:0] _114;
    wire [3:0] _4;
    reg [3:0] _66;
    wire _120;
    wire [3:0] _121;
    wire _118;
    wire [2:0] _117;
    wire [3:0] _119;
    wire [3:0] _116;
    reg [3:0] _122;
    wire [3:0] _5;
    reg [3:0] _98;
    wire _128;
    wire [3:0] _129;
    wire _126;
    wire [2:0] _125;
    wire [3:0] _127;
    wire [3:0] _124;
    reg [3:0] _130;
    wire [3:0] _6;
    reg [3:0] _96;
    reg [3:0] _99;
    wire [3:0] _92;
    wire _100;
    wire [3:0] _103;
    wire _89;
    wire _88;
    wire _87;
    wire _85;
    wire _86;
    wire _83;
    wire _84;
    wire _80;
    wire _81;
    wire _82;
    wire _77;
    wire _78;
    wire _79;
    wire _74;
    wire _73;
    wire _75;
    wire _72;
    wire _76;
    wire [7:0] _90;
    wire _166;
    wire [3:0] _167;
    wire [16:0] _133;
    wire _136;
    wire [15:0] _135;
    wire [16:0] _137;
    wire [16:0] _132;
    reg [16:0] _138;
    wire [16:0] _7;
    reg [16:0] _134;
    wire _164;
    wire [2:0] _163;
    wire [3:0] _165;
    wire [3:0] _162;
    wire [1:0] _55;
    wire [2:0] _157;
    wire [2:0] _70;
    wire [2:0] _140;
    wire [2:0] _141;
    reg [2:0] _142;
    wire [2:0] _8;
    reg [2:0] _71;
    wire _158;
    wire [1:0] _159;
    wire [1:0] _105;
    wire [4:0] _154;
    wire [4:0] _144;
    wire [4:0] _146;
    wire [4:0] _147;
    reg [4:0] _148;
    wire [4:0] _9;
    reg [4:0] _145;
    wire _155;
    wire [1:0] _156;
    wire [1:0] _69;
    wire vdd;
    wire gnd;
    wire [16:0] _149;
    wire _150;
    wire _152;
    wire _10;
    reg _58;
    wire [1:0] _153;
    reg [1:0] _160;
    wire [1:0] _11;
    (* fsm_encoding="one_hot" *)
    reg [1:0] _56;
    reg [3:0] _168;
    wire [3:0] _12;
    reg [3:0] _94;
    wire [2:0] _172;
    wire _170;
    wire [2:0] _174;
    wire [2:0] _175;
    wire [2:0] _13;
    reg [2:0] _33;
    reg [3:0] _185;
    reg [7:0] _196;
    wire [7:0] _197;
    wire [16:0] _28;
    wire [15:0] _22;
    wire [14:0] _176;
    wire [15:0] _178;
    wire [15:0] _15;
    reg [15:0] _23;
    wire _24;
    reg _25;
    wire [16:0] _179;
    wire [16:0] _180;
    wire [16:0] _182;
    wire [16:0] _17;
    reg [16:0] _27;
    wire _29;
    wire [7:0] _198;
    wire [7:0] _18;
    reg [7:0] _184;
    assign _30 = 8'b11111111;
    assign _51 = _47 & _45;
    assign _50 = _47 & _43;
    assign _49 = _47 & _40;
    assign _47 = ~ _34;
    assign _48 = _47 & _37;
    assign _45 = _42 & _39;
    assign _46 = _34 & _45;
    assign _42 = ~ _35;
    assign _43 = _42 & _36;
    assign _44 = _34 & _43;
    assign _39 = ~ _36;
    assign _40 = _35 & _39;
    assign _41 = _34 & _40;
    assign _36 = _33[0:0];
    assign _35 = _33[1:1];
    assign _37 = _35 & _36;
    assign _34 = _33[2:2];
    assign _38 = _34 & _37;
    assign _52 = { _38,
                   _41,
                   _44,
                   _46,
                   _48,
                   _49,
                   _50,
                   _51 };
    assign _53 = ~ _52;
    assign _54 = _29 ? _53 : _31;
    assign _1 = _54;
    always @(posedge clock_100) begin
        if (_25)
            _31 <= _30;
        else
            _31 <= _1;
    end
    assign _195 = 8'b01100111;
    assign _194 = 8'b01111111;
    assign _193 = 8'b00000111;
    assign _192 = 8'b01111101;
    assign _191 = 8'b01101101;
    assign _190 = 8'b01100110;
    assign _189 = 8'b01001111;
    assign _188 = 8'b01011011;
    assign _187 = 8'b00000110;
    assign _186 = 8'b00111111;
    assign _93 = 4'b0000;
    assign _101 = 4'b0011;
    assign _102 = _99 + _101;
    assign _91 = _90[4:4];
    assign _104 = _91 ? _103 : _60;
    assign _67 = _66[3:3];
    assign _64 = _60[2:0];
    assign _68 = { _64,
                   _67 };
    assign _62 = _58 ? _93 : _60;
    always @* begin
        case (_56)
        2'b00:
            _106 <= _62;
        2'b01:
            _106 <= _68;
        2'b10:
            _106 <= _104;
        default:
            _106 <= _60;
        endcase
    end
    assign _3 = _106;
    always @(posedge clock_100) begin
        if (_25)
            _60 <= _93;
        else
            _60 <= _3;
    end
    assign _112 = _90[3:3];
    assign _113 = _112 ? _103 : _66;
    assign _110 = _98[3:3];
    assign _109 = _66[2:0];
    assign _111 = { _109,
                    _110 };
    assign _108 = _58 ? _93 : _66;
    always @* begin
        case (_56)
        2'b00:
            _114 <= _108;
        2'b01:
            _114 <= _111;
        2'b10:
            _114 <= _113;
        default:
            _114 <= _66;
        endcase
    end
    assign _4 = _114;
    always @(posedge clock_100) begin
        if (_25)
            _66 <= _93;
        else
            _66 <= _4;
    end
    assign _120 = _90[2:2];
    assign _121 = _120 ? _103 : _98;
    assign _118 = _96[3:3];
    assign _117 = _98[2:0];
    assign _119 = { _117,
                    _118 };
    assign _116 = _58 ? _93 : _98;
    always @* begin
        case (_56)
        2'b00:
            _122 <= _116;
        2'b01:
            _122 <= _119;
        2'b10:
            _122 <= _121;
        default:
            _122 <= _98;
        endcase
    end
    assign _5 = _122;
    always @(posedge clock_100) begin
        if (_25)
            _98 <= _93;
        else
            _98 <= _5;
    end
    assign _128 = _90[1:1];
    assign _129 = _128 ? _103 : _96;
    assign _126 = _94[3:3];
    assign _125 = _96[2:0];
    assign _127 = { _125,
                    _126 };
    assign _124 = _58 ? _93 : _96;
    always @* begin
        case (_56)
        2'b00:
            _130 <= _124;
        2'b01:
            _130 <= _127;
        2'b10:
            _130 <= _129;
        default:
            _130 <= _96;
        endcase
    end
    assign _6 = _130;
    always @(posedge clock_100) begin
        if (_25)
            _96 <= _93;
        else
            _96 <= _6;
    end
    always @* begin
        case (_71)
        0:
            _99 <= _94;
        1:
            _99 <= _96;
        2:
            _99 <= _98;
        3:
            _99 <= _66;
        default:
            _99 <= _60;
        endcase
    end
    assign _92 = 4'b0100;
    assign _100 = _92 < _99;
    assign _103 = _100 ? _102 : _99;
    assign _89 = _85 & _83;
    assign _88 = _85 & _81;
    assign _87 = _85 & _78;
    assign _85 = ~ _72;
    assign _86 = _85 & _75;
    assign _83 = _80 & _77;
    assign _84 = _72 & _83;
    assign _80 = ~ _73;
    assign _81 = _80 & _74;
    assign _82 = _72 & _81;
    assign _77 = ~ _74;
    assign _78 = _73 & _77;
    assign _79 = _72 & _78;
    assign _74 = _71[0:0];
    assign _73 = _71[1:1];
    assign _75 = _73 & _74;
    assign _72 = _71[2:2];
    assign _76 = _72 & _75;
    assign _90 = { _76,
                   _79,
                   _82,
                   _84,
                   _86,
                   _87,
                   _88,
                   _89 };
    assign _166 = _90[0:0];
    assign _167 = _166 ? _103 : _94;
    assign _133 = 17'b00000000000000000;
    assign _136 = 1'b0;
    assign _135 = _134[15:0];
    assign _137 = { _135,
                    _136 };
    assign _132 = { gnd,
                    switches };
    always @* begin
        case (_56)
        2'b00:
            _138 <= _132;
        2'b01:
            _138 <= _137;
        default:
            _138 <= _134;
        endcase
    end
    assign _7 = _138;
    always @(posedge clock_100) begin
        if (_25)
            _134 <= _133;
        else
            _134 <= _7;
    end
    assign _164 = _134[16:16];
    assign _163 = _94[2:0];
    assign _165 = { _163,
                    _164 };
    assign _162 = _58 ? _93 : _94;
    assign _55 = 2'b00;
    assign _157 = 3'b100;
    assign _70 = 3'b000;
    assign _140 = 3'b001;
    assign _141 = _71 + _140;
    always @* begin
        case (_56)
        2'b01:
            _142 <= _70;
        2'b10:
            _142 <= _141;
        default:
            _142 <= _71;
        endcase
    end
    assign _8 = _142;
    always @(posedge clock_100) begin
        if (_25)
            _71 <= _70;
        else
            _71 <= _8;
    end
    assign _158 = _71 == _157;
    assign _159 = _158 ? _69 : _56;
    assign _105 = 2'b10;
    assign _154 = 5'b10000;
    assign _144 = 5'b00000;
    assign _146 = 5'b00001;
    assign _147 = _145 + _146;
    always @* begin
        case (_56)
        2'b00:
            _148 <= _144;
        2'b01:
            _148 <= _147;
        default:
            _148 <= _145;
        endcase
    end
    assign _9 = _148;
    always @(posedge clock_100) begin
        if (_25)
            _145 <= _144;
        else
            _145 <= _9;
    end
    assign _155 = _145 == _154;
    assign _156 = _155 ? _55 : _105;
    assign _69 = 2'b01;
    assign vdd = 1'b1;
    assign gnd = 1'b0;
    assign _149 = 17'b01100001101010000;
    assign _150 = _27 == _149;
    assign _152 = _150 ? vdd : gnd;
    assign _10 = _152;
    always @(posedge clock_100) begin
        if (_25)
            _58 <= _136;
        else
            _58 <= _10;
    end
    assign _153 = _58 ? _69 : _56;
    always @* begin
        case (_56)
        2'b00:
            _160 <= _153;
        2'b01:
            _160 <= _156;
        2'b10:
            _160 <= _159;
        default:
            _160 <= _56;
        endcase
    end
    assign _11 = _160;
    always @(posedge clock_100) begin
        if (_25)
            _56 <= _55;
        else
            _56 <= _11;
    end
    always @* begin
        case (_56)
        2'b00:
            _168 <= _162;
        2'b01:
            _168 <= _165;
        2'b10:
            _168 <= _167;
        default:
            _168 <= _94;
        endcase
    end
    assign _12 = _168;
    always @(posedge clock_100) begin
        if (_25)
            _94 <= _93;
        else
            _94 <= _12;
    end
    assign _172 = _33 + _140;
    assign _170 = _33 == _157;
    assign _174 = _170 ? _70 : _172;
    assign _175 = _29 ? _174 : _33;
    assign _13 = _175;
    always @(posedge clock_100) begin
        if (_25)
            _33 <= _70;
        else
            _33 <= _13;
    end
    always @* begin
        case (_33)
        0:
            _185 <= _94;
        1:
            _185 <= _96;
        2:
            _185 <= _98;
        3:
            _185 <= _66;
        default:
            _185 <= _60;
        endcase
    end
    always @* begin
        case (_185)
        0:
            _196 <= _186;
        1:
            _196 <= _187;
        2:
            _196 <= _188;
        3:
            _196 <= _189;
        4:
            _196 <= _190;
        5:
            _196 <= _191;
        6:
            _196 <= _192;
        7:
            _196 <= _193;
        8:
            _196 <= _194;
        default:
            _196 <= _195;
        endcase
    end
    assign _197 = ~ _196;
    assign _28 = 17'b11000011010011111;
    assign _22 = 16'b1111111111111111;
    assign _176 = _23[14:0];
    assign _178 = { _176,
                    _136 };
    assign _15 = _178;
    always @(posedge clock_100 or negedge reset_n) begin
        if (reset_n == 0)
            _23 <= _22;
        else
            _23 <= _15;
    end
    assign _24 = _23[15:15];
    always @(posedge clock_100) begin
        _25 <= _24;
    end
    assign _179 = 17'b00000000000000001;
    assign _180 = _27 + _179;
    assign _182 = _29 ? _133 : _180;
    assign _17 = _182;
    always @(posedge clock_100) begin
        if (_25)
            _27 <= _133;
        else
            _27 <= _17;
    end
    assign _29 = _27 == _28;
    assign _198 = _29 ? _197 : _184;
    assign _18 = _198;
    always @(posedge clock_100) begin
        if (_25)
            _184 <= _30;
        else
            _184 <= _18;
    end
    assign leds = switches;
    assign seven_seg_set = _184;
    assign seven_seg_sel_n = _31;

endmodule
module nexys_a7_100t_top
(
  input [15:0] switches,
  input clock_100,
  input reset_n,
  output [15:0] leds,
  output [7:0] seven_seg_set,
  output [7:0] seven_seg_sel_n
);

  nexys_a7_100t _7
  (
    .switches(switches), 
    .clock_100(clock_100), 
    .reset_n(reset_n), 
    .leds(leds), 
    .seven_seg_set(seven_seg_set), 
    .seven_seg_sel_n(seven_seg_sel_n)
  );
endmodule
