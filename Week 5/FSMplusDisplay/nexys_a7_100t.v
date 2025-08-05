module nexys_a7_100t (
    reset_n,
    switches,
    clock_100,
    leds,
    seven_seg_set,
    seven_seg_sel_n
);

    input reset_n;
    input [15:0] switches;
    input clock_100;
    output [15:0] leds;
    output [7:0] seven_seg_set;
    output [7:0] seven_seg_sel_n;

    wire [7:0] _34;
    wire _55;
    wire _54;
    wire _53;
    wire _51;
    wire _52;
    wire _49;
    wire _50;
    wire _46;
    wire _47;
    wire _48;
    wire _43;
    wire _44;
    wire _45;
    wire _40;
    wire _39;
    wire _41;
    wire _38;
    wire _42;
    wire [7:0] _56;
    wire [7:0] _57;
    wire [7:0] _58;
    wire [7:0] _1;
    reg [7:0] _35;
    wire [7:0] _201;
    wire [7:0] _200;
    wire [7:0] _199;
    wire [7:0] _198;
    wire [7:0] _197;
    wire [7:0] _196;
    wire [7:0] _195;
    wire [7:0] _194;
    wire [7:0] _193;
    wire [7:0] _192;
    wire [3:0] _97;
    wire [3:0] _105;
    wire [3:0] _106;
    wire _95;
    wire [3:0] _108;
    wire _71;
    wire [2:0] _68;
    wire [3:0] _72;
    wire [3:0] _66;
    reg [3:0] _110;
    wire [3:0] _3;
    reg [3:0] _64;
    wire _116;
    wire [3:0] _117;
    wire _114;
    wire [2:0] _113;
    wire [3:0] _115;
    wire [3:0] _112;
    reg [3:0] _118;
    wire [3:0] _4;
    reg [3:0] _70;
    wire _124;
    wire [3:0] _125;
    wire _122;
    wire [2:0] _121;
    wire [3:0] _123;
    wire [3:0] _120;
    reg [3:0] _126;
    wire [3:0] _5;
    reg [3:0] _102;
    wire _132;
    wire [3:0] _133;
    wire _130;
    wire [2:0] _129;
    wire [3:0] _131;
    wire [3:0] _128;
    reg [3:0] _134;
    wire [3:0] _6;
    reg [3:0] _100;
    reg [3:0] _103;
    wire [3:0] _96;
    wire _104;
    wire [3:0] _107;
    wire _93;
    wire _92;
    wire _91;
    wire _89;
    wire _90;
    wire _87;
    wire _88;
    wire _84;
    wire _85;
    wire _86;
    wire _81;
    wire _82;
    wire _83;
    wire _78;
    wire _77;
    wire _79;
    wire _76;
    wire _80;
    wire [7:0] _94;
    wire _172;
    wire [3:0] _173;
    wire [16:0] _139;
    wire _142;
    wire [15:0] _141;
    wire [16:0] _143;
    wire [16:0] _138;
    reg [16:0] _144;
    wire [16:0] _7;
    reg [16:0] _140;
    wire _170;
    wire [2:0] _169;
    wire [3:0] _171;
    wire [3:0] _168;
    wire [1:0] _59;
    wire [2:0] _163;
    wire [2:0] _74;
    wire [2:0] _146;
    wire [2:0] _147;
    reg [2:0] _148;
    wire [2:0] _8;
    reg [2:0] _75;
    wire _164;
    wire [1:0] _165;
    wire [1:0] _109;
    wire [4:0] _160;
    wire [4:0] _150;
    wire [4:0] _152;
    wire [4:0] _153;
    reg [4:0] _154;
    wire [4:0] _9;
    reg [4:0] _151;
    wire _161;
    wire [1:0] _162;
    wire [1:0] _73;
    wire vdd;
    wire [16:0] _155;
    wire _156;
    wire _158;
    wire _10;
    reg _62;
    wire [1:0] _159;
    reg [1:0] _166;
    wire [1:0] _11;
    (* fsm_encoding="one_hot" *)
    reg [1:0] _60;
    reg [3:0] _174;
    wire [3:0] _12;
    reg [3:0] _98;
    wire [2:0] _178;
    wire _176;
    wire [2:0] _180;
    wire [2:0] _181;
    wire [2:0] _13;
    reg [2:0] _37;
    reg [3:0] _191;
    reg [7:0] _202;
    wire [7:0] _203;
    wire [16:0] _32;
    wire [15:0] _26;
    wire [14:0] _182;
    wire [15:0] _184;
    wire [15:0] _15;
    reg [15:0] _27;
    wire _28;
    reg _29;
    wire [16:0] _185;
    wire [16:0] _186;
    wire [16:0] _188;
    wire [16:0] _16;
    reg [16:0] _31;
    wire _33;
    wire [7:0] _204;
    wire [7:0] _17;
    reg [7:0] _190;
    reg [1:0] _217;
    wire [1:0] _19;
    reg [1:0] _216;
    wire gnd;
    wire [1:0] _214;
    wire _220;
    wire [1:0] _221;
    wire _218;
    wire [1:0] _219;
    reg [1:0] _222;
    wire [1:0] _21;
    (* fsm_encoding="one_hot" *)
    reg [1:0] _206;
    reg [1:0] _229;
    wire [1:0] _22;
    reg [1:0] _228;
    wire [38:0] _230;
    wire [38:0] _231;
    wire [38:0] _24;
    reg [38:0] _136;
    wire [15:0] _137;
    wire [19:0] _232;
    wire [15:0] _233;
    assign _34 = 8'b11111111;
    assign _55 = _51 & _49;
    assign _54 = _51 & _47;
    assign _53 = _51 & _44;
    assign _51 = ~ _38;
    assign _52 = _51 & _41;
    assign _49 = _46 & _43;
    assign _50 = _38 & _49;
    assign _46 = ~ _39;
    assign _47 = _46 & _40;
    assign _48 = _38 & _47;
    assign _43 = ~ _40;
    assign _44 = _39 & _43;
    assign _45 = _38 & _44;
    assign _40 = _37[0:0];
    assign _39 = _37[1:1];
    assign _41 = _39 & _40;
    assign _38 = _37[2:2];
    assign _42 = _38 & _41;
    assign _56 = { _42,
                   _45,
                   _48,
                   _50,
                   _52,
                   _53,
                   _54,
                   _55 };
    assign _57 = ~ _56;
    assign _58 = _33 ? _57 : _35;
    assign _1 = _58;
    always @(posedge clock_100) begin
        if (_29)
            _35 <= _34;
        else
            _35 <= _1;
    end
    assign _201 = 8'b01100111;
    assign _200 = 8'b01111111;
    assign _199 = 8'b00000111;
    assign _198 = 8'b01111101;
    assign _197 = 8'b01101101;
    assign _196 = 8'b01100110;
    assign _195 = 8'b01001111;
    assign _194 = 8'b01011011;
    assign _193 = 8'b00000110;
    assign _192 = 8'b00111111;
    assign _97 = 4'b0000;
    assign _105 = 4'b0011;
    assign _106 = _103 + _105;
    assign _95 = _94[4:4];
    assign _108 = _95 ? _107 : _64;
    assign _71 = _70[3:3];
    assign _68 = _64[2:0];
    assign _72 = { _68,
                   _71 };
    assign _66 = _62 ? _97 : _64;
    always @* begin
        case (_60)
        2'b00:
            _110 <= _66;
        2'b01:
            _110 <= _72;
        2'b10:
            _110 <= _108;
        default:
            _110 <= _64;
        endcase
    end
    assign _3 = _110;
    always @(posedge clock_100) begin
        if (_29)
            _64 <= _97;
        else
            _64 <= _3;
    end
    assign _116 = _94[3:3];
    assign _117 = _116 ? _107 : _70;
    assign _114 = _102[3:3];
    assign _113 = _70[2:0];
    assign _115 = { _113,
                    _114 };
    assign _112 = _62 ? _97 : _70;
    always @* begin
        case (_60)
        2'b00:
            _118 <= _112;
        2'b01:
            _118 <= _115;
        2'b10:
            _118 <= _117;
        default:
            _118 <= _70;
        endcase
    end
    assign _4 = _118;
    always @(posedge clock_100) begin
        if (_29)
            _70 <= _97;
        else
            _70 <= _4;
    end
    assign _124 = _94[2:2];
    assign _125 = _124 ? _107 : _102;
    assign _122 = _100[3:3];
    assign _121 = _102[2:0];
    assign _123 = { _121,
                    _122 };
    assign _120 = _62 ? _97 : _102;
    always @* begin
        case (_60)
        2'b00:
            _126 <= _120;
        2'b01:
            _126 <= _123;
        2'b10:
            _126 <= _125;
        default:
            _126 <= _102;
        endcase
    end
    assign _5 = _126;
    always @(posedge clock_100) begin
        if (_29)
            _102 <= _97;
        else
            _102 <= _5;
    end
    assign _132 = _94[1:1];
    assign _133 = _132 ? _107 : _100;
    assign _130 = _98[3:3];
    assign _129 = _100[2:0];
    assign _131 = { _129,
                    _130 };
    assign _128 = _62 ? _97 : _100;
    always @* begin
        case (_60)
        2'b00:
            _134 <= _128;
        2'b01:
            _134 <= _131;
        2'b10:
            _134 <= _133;
        default:
            _134 <= _100;
        endcase
    end
    assign _6 = _134;
    always @(posedge clock_100) begin
        if (_29)
            _100 <= _97;
        else
            _100 <= _6;
    end
    always @* begin
        case (_75)
        0:
            _103 <= _98;
        1:
            _103 <= _100;
        2:
            _103 <= _102;
        3:
            _103 <= _70;
        default:
            _103 <= _64;
        endcase
    end
    assign _96 = 4'b0100;
    assign _104 = _96 < _103;
    assign _107 = _104 ? _106 : _103;
    assign _93 = _89 & _87;
    assign _92 = _89 & _85;
    assign _91 = _89 & _82;
    assign _89 = ~ _76;
    assign _90 = _89 & _79;
    assign _87 = _84 & _81;
    assign _88 = _76 & _87;
    assign _84 = ~ _77;
    assign _85 = _84 & _78;
    assign _86 = _76 & _85;
    assign _81 = ~ _78;
    assign _82 = _77 & _81;
    assign _83 = _76 & _82;
    assign _78 = _75[0:0];
    assign _77 = _75[1:1];
    assign _79 = _77 & _78;
    assign _76 = _75[2:2];
    assign _80 = _76 & _79;
    assign _94 = { _80,
                   _83,
                   _86,
                   _88,
                   _90,
                   _91,
                   _92,
                   _93 };
    assign _172 = _94[0:0];
    assign _173 = _172 ? _107 : _98;
    assign _139 = 17'b00000000000000000;
    assign _142 = 1'b0;
    assign _141 = _140[15:0];
    assign _143 = { _141,
                    _142 };
    assign _138 = { gnd,
                    _137 };
    always @* begin
        case (_60)
        2'b00:
            _144 <= _138;
        2'b01:
            _144 <= _143;
        default:
            _144 <= _140;
        endcase
    end
    assign _7 = _144;
    always @(posedge clock_100) begin
        if (_29)
            _140 <= _139;
        else
            _140 <= _7;
    end
    assign _170 = _140[16:16];
    assign _169 = _98[2:0];
    assign _171 = { _169,
                    _170 };
    assign _168 = _62 ? _97 : _98;
    assign _59 = 2'b00;
    assign _163 = 3'b100;
    assign _74 = 3'b000;
    assign _146 = 3'b001;
    assign _147 = _75 + _146;
    always @* begin
        case (_60)
        2'b01:
            _148 <= _74;
        2'b10:
            _148 <= _147;
        default:
            _148 <= _75;
        endcase
    end
    assign _8 = _148;
    always @(posedge clock_100) begin
        if (_29)
            _75 <= _74;
        else
            _75 <= _8;
    end
    assign _164 = _75 == _163;
    assign _165 = _164 ? _73 : _60;
    assign _109 = 2'b10;
    assign _160 = 5'b10000;
    assign _150 = 5'b00000;
    assign _152 = 5'b00001;
    assign _153 = _151 + _152;
    always @* begin
        case (_60)
        2'b00:
            _154 <= _150;
        2'b01:
            _154 <= _153;
        default:
            _154 <= _151;
        endcase
    end
    assign _9 = _154;
    always @(posedge clock_100) begin
        if (_29)
            _151 <= _150;
        else
            _151 <= _9;
    end
    assign _161 = _151 == _160;
    assign _162 = _161 ? _59 : _109;
    assign _73 = 2'b01;
    assign vdd = 1'b1;
    assign _155 = 17'b01100001101010000;
    assign _156 = _31 == _155;
    assign _158 = _156 ? vdd : gnd;
    assign _10 = _158;
    always @(posedge clock_100) begin
        if (_29)
            _62 <= _142;
        else
            _62 <= _10;
    end
    assign _159 = _62 ? _73 : _60;
    always @* begin
        case (_60)
        2'b00:
            _166 <= _159;
        2'b01:
            _166 <= _162;
        2'b10:
            _166 <= _165;
        default:
            _166 <= _60;
        endcase
    end
    assign _11 = _166;
    always @(posedge clock_100) begin
        if (_29)
            _60 <= _59;
        else
            _60 <= _11;
    end
    always @* begin
        case (_60)
        2'b00:
            _174 <= _168;
        2'b01:
            _174 <= _171;
        2'b10:
            _174 <= _173;
        default:
            _174 <= _98;
        endcase
    end
    assign _12 = _174;
    always @(posedge clock_100) begin
        if (_29)
            _98 <= _97;
        else
            _98 <= _12;
    end
    assign _178 = _37 + _146;
    assign _176 = _37 == _163;
    assign _180 = _176 ? _74 : _178;
    assign _181 = _33 ? _180 : _37;
    assign _13 = _181;
    always @(posedge clock_100) begin
        if (_29)
            _37 <= _74;
        else
            _37 <= _13;
    end
    always @* begin
        case (_37)
        0:
            _191 <= _98;
        1:
            _191 <= _100;
        2:
            _191 <= _102;
        3:
            _191 <= _70;
        default:
            _191 <= _64;
        endcase
    end
    always @* begin
        case (_191)
        0:
            _202 <= _192;
        1:
            _202 <= _193;
        2:
            _202 <= _194;
        3:
            _202 <= _195;
        4:
            _202 <= _196;
        5:
            _202 <= _197;
        6:
            _202 <= _198;
        7:
            _202 <= _199;
        8:
            _202 <= _200;
        default:
            _202 <= _201;
        endcase
    end
    assign _203 = ~ _202;
    assign _32 = 17'b11000011010011111;
    assign _26 = 16'b1111111111111111;
    assign _182 = _27[14:0];
    assign _184 = { _182,
                    _142 };
    assign _15 = _184;
    always @(posedge clock_100 or negedge reset_n) begin
        if (reset_n == 0)
            _27 <= _26;
        else
            _27 <= _15;
    end
    assign _28 = _27[15:15];
    always @(posedge clock_100) begin
        _29 <= _28;
    end
    assign _185 = 17'b00000000000000001;
    assign _186 = _31 + _185;
    assign _188 = _33 ? _139 : _186;
    assign _16 = _188;
    always @(posedge clock_100) begin
        if (_29)
            _31 <= _139;
        else
            _31 <= _16;
    end
    assign _33 = _31 == _32;
    assign _204 = _33 ? _203 : _190;
    assign _17 = _204;
    always @(posedge clock_100) begin
        if (_29)
            _190 <= _34;
        else
            _190 <= _17;
    end
    always @* begin
        case (_206)
        2'b00:
            _217 <= _109;
        2'b01:
            _217 <= _109;
        2'b10:
            _217 <= _59;
        2'b11:
            _217 <= _73;
        default:
            _217 <= _216;
        endcase
    end
    assign _19 = _217;
    always @(posedge clock_100) begin
        if (gnd)
            _216 <= _59;
        else
            _216 <= _19;
    end
    assign gnd = 1'b0;
    assign _214 = 2'b11;
    assign _220 = switches[1:1];
    assign _221 = _220 ? _109 : _214;
    assign _218 = switches[0:0];
    assign _219 = _218 ? _59 : _73;
    always @* begin
        case (_206)
        2'b00:
            _222 <= _219;
        2'b01:
            _222 <= _109;
        2'b10:
            _222 <= _221;
        2'b11:
            _222 <= _59;
        default:
            _222 <= _206;
        endcase
    end
    assign _21 = _222;
    always @(posedge clock_100) begin
        if (gnd)
            _206 <= _59;
        else
            _206 <= _21;
    end
    always @* begin
        case (_206)
        2'b00:
            _229 <= _59;
        2'b01:
            _229 <= _73;
        2'b10:
            _229 <= _109;
        2'b11:
            _229 <= _109;
        default:
            _229 <= _228;
        endcase
    end
    assign _22 = _229;
    always @(posedge clock_100) begin
        if (gnd)
            _228 <= _59;
        else
            _228 <= _22;
    end
    assign _230 = 39'b000000000000000000000000000000000000001;
    assign _231 = _136 + _230;
    assign _24 = _231;
    always @(posedge clock_100) begin
        _136 <= _24;
    end
    assign _137 = _136[38:23];
    assign _232 = { _137,
                    _228,
                    _216 };
    assign _233 = _232[15:0];
    assign leds = _233;
    assign seven_seg_set = _190;
    assign seven_seg_sel_n = _35;

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
