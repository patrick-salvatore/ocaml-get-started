let print_list (lst : 'a list) : unit =
  print_string "[ ";
  List.iter (fun x -> print_string (x ^ " ; ")) lst;
  print_string "]";
  print_newline ()

let print_list_of_tuples (lst : ('a * 'b) list) : unit =
  let print_tuple (x, y) =
    print_string "(";
    print_int x;
    print_string ", ";
    print_string y;
    print_string "),";
  in
  print_string "[";
  List.iter print_tuple lst;
  print_endline "]";
;;

let print_function_result (f : 'a list -> ('a * 'a) option) (lst : 'a list) :
    unit =
  match f lst with
  | Some (x, y) ->
      print_string "Result: ";
      print_string "(";
      print_string x;
      print_string ", ";
      print_string y;
      print_string ")";
      print_newline ()
  | None -> Printf.printf "None \n"

let print_function_option_result (f : 'a list -> 'a option) (lst : 'a list) :
    unit =
  match f lst with
  | Some x -> print_endline ("Some value " ^ x)
  | None -> print_endline "None"

let rec get_last_element = function
  | [ x ] -> x
  | _ :: tail -> get_last_element tail
  | [] -> failwith "Empty list"
