open Core
open Hardcaml
open Hardcaml_waveterm
open Hardcaml_example
(* open Hardcaml.Bits *)

let test_counter () =
  let module Sim = Cyclesim.With_interface (Counter.I) (Counter.O) in
  let sim = Sim.create Counter.create in
  let waves, sim = Waveform.create sim in
  let inputs = Cyclesim.inputs sim in
  inputs.a := Bits.of_string "11110000";
  inputs.b := Bits.of_unsigned_int ~width:8 40;
  Cyclesim.cycle ~n:2 sim;
  inputs.a := Bits.of_string "00001111";
  inputs.b := Bits.of_unsigned_int ~width:8 40;
  Cyclesim.cycle sim;
  (* inputs.enable := Bits.vdd;
  Cyclesim.cycle ~n:3 sim; *)
  waves
;;

let%expect_test "test counter" =
  Waveform.print (test_counter ());
  [%expect
    {|
    ┌Signals────────┐┌Waves──────────────────────────────────────────────┐
    │               ││────────────────┬───────                           │
    │a              ││ F0             │0F                                │
    │               ││────────────────┴───────                           │
    │               ││────────────────────────                           │
    │b              ││ 28                                                │
    │               ││────────────────────────                           │
    │               ││────────────────┬───────                           │
    │y              ││ 20             │08                                │
    │               ││────────────────┴───────                           │
    └───────────────┘└───────────────────────────────────────────────────┘
    |}]
;;
