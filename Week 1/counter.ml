open! Core
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { a : 'a [@bits 8]
    ; b : 'a [@bits 8]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t = { y : 'a [@bits 8] } [@@deriving hardcaml]
end

let create (i : _ I.t) : _ O.t = { y = i.a &: i.b }
