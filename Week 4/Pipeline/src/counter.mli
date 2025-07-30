open! Core
open Hardcaml

module I : sig
  type 'a t =
    { clock : 'a
    ; reset : 'a
    ; clear : 'a
    ; enable : 'a
    ; d : 'a
    }
  [@@deriving hardcaml]
end

module O : sig
  type 'a t = { q : 'a } [@@deriving hardcaml]
end

val create : Interface.Create_fn(I)(O).t

(* Construct top level board design. *)
val board : unit -> Hardcaml_hobby_boards.Board.t
