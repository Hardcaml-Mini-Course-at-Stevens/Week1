open! Core
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; clear : 'a
    ; enable : 'a
    ; d : 'a
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t = { q : 'a } [@@deriving hardcaml]
end

let create (i : _ I.t) =
  { O.q =
      reg
        (Reg_spec.create ~clock:i.clock ~reset:i.reset ~clear:i.clear ())
        ~enable:i.enable
        i.d
  }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let switches = Nexys_a7_100t.Switches.create board in
  let%tydi { clock_100 = clock; _ } = Nexys_a7_100t.Clock_and_reset.create board in
  let result1 =
    (create
       { I.clock
       ; reset = switches.:[0, 0]
       ; clear = switches.:[1, 1]
       ; enable = switches.:[2, 2]
       ; d = switches.:[7, 3]
       })
      .q
  in
  let result2 = result1 &: switches.:[12, 8] in
  let result3 =
    (create
       { I.clock
       ; reset = switches.:[0, 0]
       ; clear = switches.:[1, 1]
       ; enable = switches.:[2, 2]
       ; d = result2
       })
      .q
  in
  let result4 = concat_msb [ result3; result2; result1 ] in
  let resized = uresize result4 ~width:16 in
  Nexys_a7_100t.Leds.complete board resized;
  board
;;
