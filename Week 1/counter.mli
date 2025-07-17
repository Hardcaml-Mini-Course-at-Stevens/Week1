open! Core
open Hardcaml

module I : sig
  type 'a t =
    { a : 'a [@bits 8]
    ; b : 'a [@bits 8]
    }
  [@@deriving hardcaml]
end

module O : sig
  type 'a t = { y : 'a [@bits 8] } [@@deriving hardcaml]
end

val create : Interface.Create_fn(I)(O).t
