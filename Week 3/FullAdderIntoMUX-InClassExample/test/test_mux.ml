open Core
open Hardcaml
open Hardcaml_waveterm
open Mux_example

let test_counter () =
  let module Sim = Cyclesim.With_interface (Mux.I) (Mux.O) in
  let sim = Sim.create Mux.create in
  let waves, sim = Waveform.create sim in
  let inputs = Cyclesim.inputs sim in
  inputs.a := Bits.vdd;
  inputs.b := Bits.vdd;
  inputs.c := Bits.vdd;
  inputs.d := Bits.vdd;
  inputs.s0 := Bits.vdd;
  inputs.s1 := Bits.vdd;
  Cyclesim.cycle ~n:2 sim;
  (* inputs.enable := Bits.gnd;
  Cyclesim.cycle sim;
  inputs.enable := Bits.vdd;
  Cyclesim.cycle ~n:3 sim; *)
  waves
;;

let%expect_test "test counter" =
  Waveform.print (test_counter ());
  [%expect
    {|
    ┌Signals────────┐┌Waves──────────────────────────────────────────────┐
    │a              ││────────────────                                   │
    │               ││                                                   │
    │b              ││────────────────                                   │
    │               ││                                                   │
    │c              ││────────────────                                   │
    │               ││                                                   │
    │d              ││────────────────                                   │
    │               ││                                                   │
    │s0             ││────────────────                                   │
    │               ││                                                   │
    │s1             ││────────────────                                   │
    │               ││                                                   │
    │y              ││────────────────                                   │
    │               ││                                                   │
    └───────────────┘└───────────────────────────────────────────────────┘
    |}]
;;
