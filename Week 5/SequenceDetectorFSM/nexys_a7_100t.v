module nexys_a7_100t (
    clock_100,
    leds
);

    input clock_100;
    output [15:0] leds;

    wire _22;
    wire [1:0] _9;
    wire gnd;
    wire [1:0] _18;
    wire [1:0] _15;
    wire [1:0] _16;
    wire [1:0] _13;
    wire [31:0] _6;
    wire [31:0] _7;
    wire [31:0] _2;
    reg [31:0] _5;
    wire _11;
    wire [1:0] _14;
    reg [1:0] _19;
    wire [1:0] _3;
    (* fsm_encoding="one_hot" *)
    reg [1:0] _10;
    wire [1:0] _17;
    wire _21;
    reg _23;
    wire [14:0] _20;
    wire [15:0] _24;
    assign _22 = 1'b0;
    assign _9 = 2'b00;
    assign gnd = 1'b0;
    assign _18 = _11 ? _15 : _17;
    assign _15 = 2'b10;
    assign _16 = _11 ? _15 : _13;
    assign _13 = 2'b01;
    assign _6 = 32'b00000000000000000000000000000001;
    assign _7 = _5 + _6;
    assign _2 = _7;
    always @(posedge clock_100) begin
        _5 <= _2;
    end
    assign _11 = _5[31:31];
    assign _14 = _11 ? _13 : _9;
    always @* begin
        case (_10)
        2'b00:
            _19 <= _14;
        2'b01:
            _19 <= _16;
        2'b10:
            _19 <= _18;
        2'b11:
            _19 <= _17;
        default:
            _19 <= _10;
        endcase
    end
    assign _3 = _19;
    always @(posedge clock_100) begin
        if (gnd)
            _10 <= _9;
        else
            _10 <= _3;
    end
    assign _17 = 2'b11;
    assign _21 = _17 == _10;
    always @(posedge clock_100) begin
        if (gnd)
            _23 <= _22;
        else
            _23 <= _21;
    end
    assign _20 = 15'b000000000000000;
    assign _24 = { _20,
                   _23 };
    assign leds = _24;

endmodule
module nexys_a7_100t_top
(
  input clock_100,
  input reset_n,
  output [15:0] leds
);

  nexys_a7_100t _4
  (
    .clock_100(clock_100), 
    .leds(leds)
  );
endmodule
