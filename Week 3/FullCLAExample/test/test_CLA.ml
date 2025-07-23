open Core
open Hardcaml
open Hardcaml_waveterm
open CLA_example

let test_counter () =
  let module Sim = Cyclesim.With_interface (CLA.I) (CLA.O) in
  let sim = Sim.create CLA.create in
  let waves, sim = Waveform.create sim in
  let inputs = Cyclesim.inputs sim in
  inputs.a := Bits.of_string "1111";
  inputs.b := Bits.of_string "0000";
  inputs.cin := Bits.vdd;
  (* Cyclesim.cycle ~n:2 sim;
  inputs.enable := Bits.gnd;
  Cyclesim.cycle sim;
  inputs.enable := Bits.vdd;
  Cyclesim.cycle ~n:3 sim; *)
  waves
;;

let%expect_test "test counter" =
  Waveform.print (test_counter ());
  [%expect.unreachable]
[@@expect.uncaught_exn
  {|
  (* CR expect_test_collector: This test expectation appears to contain a backtrace.
     This is strongly discouraged as backtraces are fragile.
     Please change this test to not include a backtrace. *)
  ("Index into waveform is out of bounds" (index -1) (length 0))
  Raised at Base__Error.raise in file "src/error.ml", line 9, characters 21-37
  Called from Base__Error.raise_s in file "src/error.ml" (inlined), line 18, characters 35-47
  Called from Hardcaml__Wave_data.raise_index_out_of_bounds in file "src/wave_data.ml", line 453, characters 2-88
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.draw_values.(fun) in file "kernel/render.ml", line 696, characters 18-47
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.draw_iter in file "kernel/render.ml", line 525, characters 8-34
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.draw_values in file "kernel/render.ml", lines 685-700, characters 6-847
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.with_border in file "kernel/render.ml", line 542, characters 14-44
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.with_border in file "kernel/render.ml" (inlined), lines 535-551, characters 6-450
  Called from Hardcaml_waveterm_kernel__Render.Make.Make.draw_ui in file "kernel/render.ml", lines 746-753, characters 9-205
  Called from Hardcaml_waveterm_kernel__Render.Make.Static.draw in file "kernel/render.ml", line 858, characters 6-60
  Called from Hardcaml_waveterm_kernel__Waveform.Make.print in file "kernel/waveform.ml", lines 238-248, characters 6-228
  Called from Hardcaml_example_test__Test_counter.(fun) in file "test/test_counter.ml", line 23, characters 2-34
  Called from Ppx_expect_runtime__Test_block.Configured.dump_backtrace in file "runtime/test_block.ml", line 264, characters 10-25
  |}]
;;
