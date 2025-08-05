open! Core
open Hardcaml
open Signal

include struct
  open Hardcaml_hobby_boards
  module Board = Board
  module Utils = Utils
  include Nexys_a7_100t
end

module Make (Digits : sig
    val num_digits : int
  end) =
struct
  open Digits

  (* Bits required to represent [999...999] *)
  let binary_bits = num_bits_to_represent (Int.pow 10 num_digits - 1)

  module State = struct
    type t =
      | Start
      | Double
      | Dabble
    [@@deriving sexp_of, compare, enumerate]
  end

  let dd ~clock ~clear ~start ~binary_in =
    let spec = Reg_spec.create ~clock ~clear () in
    (* Registers to latch the input binary value and count through it's bits. *)
    let binary = Always.Variable.reg spec ~width:binary_bits in
    let bit_count = Always.Variable.reg spec ~width:(Int.ceil_log2 binary_bits) in
    (* Register to count through digits while dabbling. *)
    let digit_count = Always.Variable.reg spec ~width:(Int.ceil_log2 num_digits) in
    (* One digit count to use as a register write enable for the bcd digits *)
    let digit_count_one_hot = binary_to_onehot digit_count.value in
    (* Registers for the BCD digit *)
    let bcd = Array.init num_digits ~f:(fun _ -> Always.Variable.reg spec ~width:4) in
    (* Dabbling logic - look up the current bcd digit and perform dabble operation if
       greater than 4 *)
    let bcd_dabbled =
      let digit =
        mux digit_count.value (List.map (Array.to_list bcd) ~f:(fun bcd -> bcd.value))
      in
      mux2 (digit >:. 4) (digit +:. 3) digit
    in
    (* Statemachine *)
    let sm = Always.State_machine.create (module State) spec in
    Always.(
      compile
        [ sm.switch
            [ ( Start
              , [ (* Wait for start *)
                  bit_count <--. 0
                ; binary <-- binary_in
                ; when_
                    start
                    [ proc (List.init num_digits ~f:(fun digit -> bcd.(digit) <--. 0))
                    ; sm.set_next Double
                    ]
                ] )
            ; ( Double
              , [ (* Shift in the next binary bit through all the BCD registers. *)
                  binary <-- sll binary.value ~by:1
                ; proc
                    (List.init num_digits ~f:(fun digit ->
                       bcd.(digit)
                       <-- lsbs bcd.(digit).value
                           @:
                           if digit = 0
                           then msb binary.value
                           else msb bcd.(digit - 1).value))
                ; digit_count <--. 0
                ; bit_count <-- bit_count.value +:. 1
                ; (* Count through all the input binary bits *)
                  if_
                    (bit_count.value ==:. binary_bits - 1)
                    [ sm.set_next Start ]
                    [ sm.set_next Dabble ]
                ] )
            ; ( Dabble
              , [ (* Iterate through each digit and perform the dabble operation. *)
                  digit_count <-- digit_count.value +:. 1
                ; proc
                    (List.init num_digits ~f:(fun digit ->
                       when_ digit_count_one_hot.:(digit) [ bcd.(digit) <-- bcd_dabbled ]))
                ; when_ (digit_count.value ==:. num_digits - 1) [ sm.set_next Double ]
                ] )
            ]
        ]);
    sm.is Start, Array.map bcd ~f:(fun bcd -> bcd.value)
  ;;
end

module BCD = Make (struct
    let num_digits = 5
  end)

let to_ssd_code v =
  mux
    v
    (Hardcaml_hobby_boards.Seven_segment_display.numeric_codes
     |> Array.to_list
     |> List.map ~f:Hardcaml_hobby_boards.Seven_segment_display.to_signal)
;;

let decimal_display ~spec ~switches =
  let start = Always.Variable.reg spec ~width:1 in
  let _, bcd =
    BCD.dd
      ~clock:(Reg_spec.clock spec)
      ~clear:(Reg_spec.clear_exn spec)
      ~start:start.value
      ~binary_in:(gnd @: switches)
  in
  let set_n = Always.Variable.reg spec ~clear_to:(ones 8) ~width:8 in
  let select_n = Always.Variable.reg spec ~clear_to:(ones 8) ~width:8 in
  let digit = Always.Variable.reg spec ~width:3 in
  let enable_count = Always.Variable.reg spec ~width:17 in
  Always.(
    compile
      [ enable_count <-- enable_count.value +:. 1
      ; start <-- gnd
      ; when_ (enable_count.value ==:. 50_000) [ start <-- vdd ]
      ; when_
          (enable_count.value ==:. 99_999)
          [ enable_count <--. 0
          ; digit <-- digit.value +:. 1
          ; when_ (digit.value ==:. 4) [ digit <--. 0 ]
          ; set_n <-- ~:(mux digit.value (Array.to_list bcd) |> to_ssd_code)
          ; select_n <-- ~:(binary_to_onehot digit.value)
          ]
      ]);
  set_n.value, select_n.value
;;

module I = struct
  type 'a t =
    { clock : 'a
    ; enable : 'a
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t = { q : 'a [@bits 32] } [@@deriving hardcaml]
end

module State = struct
  type t =
    | S0
    | S1
    | S2
    | S3
  [@@deriving sexp_of, compare ~localize, enumerate]
end

let myFSM ~clock ~clear ~ta ~tb =
  let spec = Reg_spec.create ~clock ~clear () in
  let la = Always.Variable.reg spec ~width:2 in
  let lb = Always.Variable.reg spec ~width:2 in
  let sm = Always.State_machine.create (module State) spec in
  Always.(
    compile
      [ sm.switch
          [ S0, [ la <--. 0; lb <--. 2; if_ ta [ sm.set_next S0 ] [ sm.set_next S1 ] ]
          ; S1, [ la <--. 1; lb <--. 2; sm.set_next S2 ]
          ; S2, [ la <--. 2; lb <--. 0; if_ tb [ sm.set_next S2 ] [ sm.set_next S3 ] ]
            (* ; S110, [ if_ d [ sm.set_next S1 ] [ sm.set_next S0 ] ] *)
          ; S3, [ la <--. 2; lb <--. 1; sm.set_next S0 ]
          ]
      ]);
  la.value, lb.value
;;

let create (i : _ I.t) =
  { O.q =
      reg_fb (Reg_spec.create ~clock:i.clock ()) ~enable:i.enable ~width:39 ~f:(fun d ->
        d +:. 1)
  }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let switches = Nexys_a7_100t.Switches.create board in
  let clocking = Nexys_a7_100t.Clock_and_reset.create board in
  let%tydi { clock_100 = clock; _ } = clocking in
  let counterResult = (create { I.clock; enable = vdd }).q.:[38, 23] in
  let spec = Utils.sync_reg_spec clocking in
  let set_n, select_n = decimal_display ~spec ~switches:counterResult in
  let lighta, lightb =
    myFSM ~clock ~clear:gnd ~ta:switches.:[0, 0] ~tb:switches.:[1, 1]
  in
  let resized = uresize (concat_msb [ counterResult; lighta; lightb ]) ~width:16 in
  Nexys_a7_100t.Leds.complete board resized;
  Nexys_a7_100t.Seven_segment_display.complete board { set_n; select_n };
  board
;;
