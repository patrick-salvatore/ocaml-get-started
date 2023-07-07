(*
  tail of a list
  Write a function last : 'a list -> 'a option that returns the last element of a list
  
  # last ["a" ; "b" ; "c" ; "d"];;
  - : string option = Some "d"
  # last [];;
  - : 'a option = None
*)
let rec last l =
  match l with [] -> None | [ x ] -> Some x | _ :: tl -> last tl

(*
   Last Two Elements of a List

   # last_two ["a"; "b"; "c"; "d"];;
   - : (string * string) option = Some ("c", "d")
   # last_two ["a"];;
   - : (string * string) option = None
*)
let rec last2 l =
  match l with
  | [] -> None
  | [ _ ] -> None
  | [ a; b ] -> Some (a, b)
  | _ :: tl -> last2 tl

(*
     Find the N'th element of a list.
     # List.nth ["a"; "b"; "c"; "d"; "e"] 2;;
     - : string = "c"
     # List.nth ["a"] 2;;
     Exception: Failure "nth".
  *)

let at (l : string list) (n : int) =
  let rec at_rec l n =
    match l with [] -> "None" | h :: t -> if n = 0 then h else at_rec t (n - 1)
  in
  at_rec l n

(*
  Length of a List
  Find the number of elements of a list.
  
  OCaml standard library has List.length but we ask that you reimplement it.
  Bonus for a tail recursive solution
*)

let list_length l =
  let rec list_count (l : 'a list) (c : int) =
    match l with [] -> c | _ :: t -> list_count t (c + 1)
  in
  list_count l 0

(*
   Reverse a list.

   OCaml standard library has List.rev but we ask that you reimplement it.
*)

let rev l =
  let rec rev_aux (l : 'a list) (acc : 'a list) =
    match l with [] -> acc | h :: t -> rev_aux t (h :: acc)
  in
  rev_aux l []

(*
   Find out whether a list is a palindrome.

   Hint: A palindrome is its own reverse.
*)
let is_palindrome (l : string list) =
  let a = String.concat "" l in
  let b = String.concat "" (rev l) in
  if a = b then "True" else "False"

(*
  If you need so, refresh your memory about (run-length encoding)[http://en.wikipedia.org/wiki/Run-length_encoding].
  Here is an example:

  # encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
  - : (int * string) list =
  [(4, "a"); (1, "b"); (2, "c"); (2, "a"); (1, "d"); (4, "e")]
*)

let run_length_ecoding (l : string list) =
  let rec encode_aux l c acc =
    match l with
    | h :: (n :: _ as t) ->
        if h = n then encode_aux t (c + 1) acc
        else encode_aux (n :: t) 0 ((c + 1, h) :: acc)
    | [ x ] -> (c + 1, x) :: acc
    | [] -> []
  in
  encode_aux l 0 []
