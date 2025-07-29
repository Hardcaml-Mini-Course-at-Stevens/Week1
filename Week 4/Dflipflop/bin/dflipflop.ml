open Core
open Hardcaml
open Dff_example

let generate rtl =
  Command.basic
    ~summary:
      ("Generate "
       ^
       match rtl with
       | Rtl.Language.Verilog -> "Verilog"
       | Vhdl -> "VHDL")
    [%map_open.Command
      let () = return () in
      fun () ->
        let module Circuit = Circuit.With_interface (Dflipflop.I) (Dflipflop.O) in
        let circuit = Circuit.create_exn ~name:"dff" Dflipflop.myDFlipFlop in
        Rtl.print rtl circuit]
;;

let simulate =
  Command.basic
    ~summary:"Run simulation"
    [%map_open.Command
      let () = return () in
      fun () ->
        Hardcaml_waveterm_interactive.run
          (Dff_example_test.Test_dflipflop.test_counter ())]
;;

let nexys17_100t =
  Command.basic
    ~summary:"Generate top level code for Nexys A7 board"
    [%map_open.Command
      let () = return () in
      fun () -> Hardcaml_hobby_boards.Nexys_a7_100t.generate_top (Dflipflop.board ())]
;;

let () =
  Command_unix.run
    (Command.group
       ~summary:"simulate or generate rtl for counter design."
       [ "simulate", simulate
       ; "verilog", generate Verilog
       ; "vhdl", generate Vhdl
       ; "nexys-a7", nexys17_100t
       ])
;;
