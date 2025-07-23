open! Core
open Hardcaml
open Signal
open Fa

module I = struct
  type 'a t =
    { a : 'a [@bits 1]
    ; b : 'a [@bits 1]
    ; c : 'a [@bits 1]
    ; d : 'a [@bits 1]
    ; s0 : 'a [@bits 1]
    ; s1 : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t = { y : 'a [@bits 1] } [@@deriving hardcaml]
end

let create (i : _ I.t) : _ O.t =
  { y =
      i.a
      &: ~:(i.s1)
      &: ~:(i.s0)
      |: (i.b &: ~:(i.s1) &: i.s0)
      |: (i.c &: i.s1 &: ~:(i.s0))
      |: (i.d &: i.s1 &: i.s0)
  }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let switches = Nexys_a7_100t.Switches.create board in
  let result0 =
    full_adder { a = switches.:[0, 0]; b = switches.:[1, 1]; cin = switches.:[2, 2] }
  in
  let result1 =
    create
      { a = result0.cout
      ; b = result0.s
      ; c = switches.:[3, 3]
      ; d = switches.:[4, 4]
      ; s0 = switches.:[6, 6]
      ; s1 = switches.:[5, 5]
      }
  in
  let result2 = uresize result1.y ~width:16 in
  Nexys_a7_100t.Leds.complete board result2;
  board
;;
