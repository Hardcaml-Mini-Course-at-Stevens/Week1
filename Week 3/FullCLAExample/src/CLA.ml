open! Core
open Hardcaml
open Signal

module I = struct
  type 'a t =
    { a : 'a [@bits 4]
    ; b : 'a [@bits 4]
    ; cin : 'a [@bits 1]
    }
  [@@deriving hardcaml]
end

module O = struct
  type 'a t =
    { co : 'a [@bits 1]
    ; sum : 'a [@bits 4]
    }
  [@@deriving hardcaml]
end

let create (i : _ I.t) : _ O.t =
  let a = Array.init 4 ~f:(fun j -> select i.a ~high:j ~low:j) in
  let b = Array.init 4 ~f:(fun j -> select i.b ~high:j ~low:j) in
  let p = Array.init 4 ~f:(fun j -> a.(j) ^: b.(j)) in
  let g = Array.init 4 ~f:(fun j -> a.(j) &: b.(j)) in
  let c0 = i.cin in
  let c1 = g.(0) |: (p.(0) &: c0) in
  let c2 = g.(1) |: (p.(1) &: g.(0)) |: (p.(1) &: p.(0) &: c0) in
  let c3 =
    g.(2)
    |: (p.(2) &: g.(1))
    |: (p.(2) &: p.(1) &: g.(0))
    |: (p.(2) &: p.(1) &: p.(0) &: c0)
  in
  let c4 =
    g.(3)
    |: (p.(3) &: g.(2))
    |: (p.(3) &: p.(2) &: g.(1))
    |: (p.(3) &: p.(2) &: p.(1) &: g.(0))
    |: (p.(3) &: p.(2) &: p.(1) &: p.(0) &: c0)
  in
  (* Compute sum bits: sum[i] = p[i] ^ c[i] *)
  let c = [| c0; c1; c2; c3 |] in
  let sum_bits = Array.init 4 ~f:(fun j -> p.(j) ^: c.(j)) in
  let sum = concat_lsb (Array.to_list sum_bits) in
  { co = c4; sum }
;;

let board () =
  let open Hardcaml_hobby_boards in
  let board = Board.create () in
  let switches = Nexys_a7_100t.Switches.create board in
  let result1 =
    create { a = switches.:[9, 5]; b = switches.:[4, 1]; cin = switches.:[0, 0] }
  in
  let result2 = concat_msb [ result1.co; result1.sum ] in
  Nexys_a7_100t.Leds.complete board (uresize result2 ~width:16);
  board
;;
