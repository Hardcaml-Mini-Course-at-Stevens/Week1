open! Core
open Hardcaml
open Signal

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
    | S11
    | S110
  [@@deriving sexp_of, compare ~localize, enumerate]
end

let myFSM ~clock ~clear ~d =
  let spec = Reg_spec.create ~clock ~clear () in
  let sm = Always.State_machine.create (module State) spec in
  Always.(
    compile
      [ sm.switch
          [ S0, [ if_ d [ sm.set_next S1 ] [ sm.set_next S0 ] ]
          ; S1, [ if_ d [ sm.set_next S11 ] [ sm.set_next S1 ] ]
          ; S11, [ if_ d [ sm.set_next S11 ] [ sm.set_next S110 ] ]
            (* ; S110, [ if_ d [ sm.set_next S1 ] [ sm.set_next S0 ] ] *)
          ; S110, [ sm.set_next S110 ]
          ]
      ]);
  reg spec (sm.is S110)
;;

let create (i : _ I.t) =
  { O.q =
      reg_fb (Reg_spec.create ~clock:i.clock ()) ~enable:i.enable ~width:32 ~f:(fun d ->
        d +:. 1)
  }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let%tydi { clock_100 = clock; _ } = Nexys_a7_100t.Clock_and_reset.create board in
  let counterResult = (create { I.clock; enable = vdd }).q.:[31, 31] in
  let fsmResult = myFSM ~clock ~clear:gnd ~d:counterResult in
  let resized = uresize fsmResult ~width:16 in
  Nexys_a7_100t.Leds.complete board resized;
  board
;;
