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
      reg_fb (Reg_spec.create ~clock:i.clock ()) ~enable:i.enable ~width:32 ~f:(fun d ->
        d +:. 1)
  }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let switches = Nexys_a7_100t.Switches.create board in
  let%tydi { clock_100 = clock; _ } = Nexys_a7_100t.Clock_and_reset.create board in
  let counterResult = (create { I.clock; enable = vdd }).q.:[31, 31] in
  let lighta, lightb =
    myFSM ~clock ~clear:gnd ~ta:switches.:[0, 0] ~tb:switches.:[1, 1]
  in
  let resized = uresize (concat_msb [ counterResult; lighta; lightb ]) ~width:16 in
  Nexys_a7_100t.Leds.complete board resized;
  board
;;
