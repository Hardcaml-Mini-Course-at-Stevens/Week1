module nexys_a7_100t (
    switches,
    clock_100,
    leds
);

    input [15:0] switches;
    input clock_100;
    output [15:0] leds;

    wire [1:0] _19;
    wire [1:0] _17;
    wire [1:0] _13;
    reg [1:0] _21;
    wire [1:0] _1;
    reg [1:0] _20;
    wire gnd;
    wire [1:0] _18;
    wire _24;
    wire [1:0] _25;
    wire _22;
    wire [1:0] _23;
    reg [1:0] _26;
    wire [1:0] _3;
    (* fsm_encoding="one_hot" *)
    reg [1:0] _10;
    reg [1:0] _33;
    wire [1:0] _4;
    reg [1:0] _32;
    wire [31:0] _35;
    wire [31:0] _36;
    wire [31:0] _6;
    reg [31:0] _34;
    wire _38;
    wire [4:0] _39;
    wire [10:0] _37;
    wire [15:0] _40;
    assign _19 = 2'b00;
    assign _17 = 2'b01;
    assign _13 = 2'b10;
    always @* begin
        case (_10)
        2'b00:
            _21 <= _13;
        2'b01:
            _21 <= _13;
        2'b10:
            _21 <= _19;
        2'b11:
            _21 <= _17;
        default:
            _21 <= _20;
        endcase
    end
    assign _1 = _21;
    always @(posedge clock_100) begin
        if (gnd)
            _20 <= _19;
        else
            _20 <= _1;
    end
    assign gnd = 1'b0;
    assign _18 = 2'b11;
    assign _24 = switches[1:1];
    assign _25 = _24 ? _13 : _18;
    assign _22 = switches[0:0];
    assign _23 = _22 ? _19 : _17;
    always @* begin
        case (_10)
        2'b00:
            _26 <= _23;
        2'b01:
            _26 <= _13;
        2'b10:
            _26 <= _25;
        2'b11:
            _26 <= _19;
        default:
            _26 <= _10;
        endcase
    end
    assign _3 = _26;
    always @(posedge clock_100) begin
        if (gnd)
            _10 <= _19;
        else
            _10 <= _3;
    end
    always @* begin
        case (_10)
        2'b00:
            _33 <= _19;
        2'b01:
            _33 <= _17;
        2'b10:
            _33 <= _13;
        2'b11:
            _33 <= _13;
        default:
            _33 <= _32;
        endcase
    end
    assign _4 = _33;
    always @(posedge clock_100) begin
        if (gnd)
            _32 <= _19;
        else
            _32 <= _4;
    end
    assign _35 = 32'b00000000000000000000000000000001;
    assign _36 = _34 + _35;
    assign _6 = _36;
    always @(posedge clock_100) begin
        _34 <= _6;
    end
    assign _38 = _34[31:31];
    assign _39 = { _38,
                   _32,
                   _20 };
    assign _37 = 11'b00000000000;
    assign _40 = { _37,
                   _39 };
    assign leds = _40;

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
