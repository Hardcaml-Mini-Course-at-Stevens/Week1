open! Core
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { a : 'a [@bits 1]
    ; b : 'a [@bits 1]
    ; cin : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { s : 'a [@bits 1]
    ; cout : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

let full_adder (i : _ I.t) : _ O.t =
  { s = i.a ^: i.b ^: i.cin; cout = i.a &: i.b |: (i.a &: i.cin) |: (i.b &: i.cin) }
;;
