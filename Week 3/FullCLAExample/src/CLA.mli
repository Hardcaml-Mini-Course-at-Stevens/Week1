open! Core
open Hardcaml

module I : sig
  type 'a t =
    { a : 'a [@bits 4]
    ; b : 'a [@bits 4]
    ; cin : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

module O : sig
  type 'a t =
    { co : 'a [@bits 1]
    ; sum : 'a [@bits 4]
    }
  [@@deriving hardcaml]
end

val create : Interface.Create_fn(I)(O).t

(* Construct top level board design. *)
val board : unit -> Hardcaml_hobby_boards.Board.t
