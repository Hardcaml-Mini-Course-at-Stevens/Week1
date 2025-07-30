open! Core
open Hardcaml
open Signal

let mySystem ~input1 ~input2 ~clock ~clear =
  let spec = Reg_spec.create ~clock ~clear () in
  let reg1 = Always.Variable.reg spec ~width:5 in
  let reg2 = Always.Variable.reg spec ~width:5 in
  Always.(compile [ reg1 <-- (input1 |: reg2.value); reg2 <-- (input2 &: reg1.value) ]);
  reg2.value
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let%tydi { clock_100 = clock; _ } = Nexys_a7_100t.Clock_and_reset.create board in
  let switches = Nexys_a7_100t.Switches.create board in
  let result =
    mySystem
      ~input1:switches.:[5, 1]
      ~input2:switches.:[10, 6]
      ~clock
      ~clear:switches.:[0, 0]
  in
  let resized = uresize result ~width:16 in
  Nexys_a7_100t.Leds.complete board resized;
  board
;;
