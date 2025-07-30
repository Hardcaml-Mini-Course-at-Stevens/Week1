open Core
open Hardcaml
open Hardcaml_waveterm
open Dff_example

let test_counter () =
  let module Sim = Cyclesim.With_interface (Dflipflop.I) (Dflipflop.O) in
  let sim = Sim.create Dflipflop.myDFlipFlop in
  let waves, sim = Waveform.create sim in
  let inputs = Cyclesim.inputs sim in
  inputs.enable := Bits.vdd;
  inputs.clear := Bits.gnd;
  Cyclesim.cycle ~n:2 sim;
  inputs.d := Bits.of_string "1111000000000";
  Cyclesim.cycle ~n:3 sim;
  Cyclesim.reset sim;
  Cyclesim.cycle sim;
  waves
;;

let%expect_test "test counter" =
  Waveform.print (test_counter ());
  [%expect
    {|
    ┌Signals────────┐┌Waves──────────────────────────────────────────────┐
    │clock          ││┌───┐   ┌───┐   ┌───┐   ┌───┐   ┌───┐   ┌───┐   ┌──│
    │               ││    └───┘   └───┘   └───┘   └───┘   └───┘   └───┘  │
    │reset          ││                                        ┌───────┐  │
    │               ││────────────────────────────────────────┘       └──│
    │clear          ││                                                   │
    │               ││───────────────────────────────────────────────────│
    │enable         ││───────────────────────────────────────────────────│
    │               ││                                                   │
    │               ││────────────────┬──────────────────────────────────│
    │d              ││ 0000           │1E00                              │
    │               ││────────────────┴──────────────────────────────────│
    │               ││────────────────────────┬───────────────────────┬──│
    │q              ││ 0000                   │1E00                   │00│
    │               ││────────────────────────┴───────────────────────┴──│
    └───────────────┘└───────────────────────────────────────────────────┘
    |}]
;;
