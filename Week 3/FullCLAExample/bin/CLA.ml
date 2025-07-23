open Core
open Hardcaml
open CLA_example

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
        let module Circuit = Circuit.With_interface (CLA.I) (CLA.O) in
        let circuit = Circuit.create_exn ~name:"counter" CLA.create in
        Rtl.print rtl circuit]
;;

let simulate =
  Command.basic
    ~summary:"Run simulation"
    [%map_open.Command
      let () = return () in
      fun () ->
        Hardcaml_waveterm_interactive.run (CLA_example_test.Test_CLA.test_counter ())]
;;

let nexys17_100t =
  Command.basic
    ~summary:"Generate top level code for Nexys A7 board"
    [%map_open.Command
      let () = return () in
      fun () -> Hardcaml_hobby_boards.Nexys_a7_100t.generate_top (CLA.board ())]
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
