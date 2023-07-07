open Lib.Helpers
open Lib.Beginner

let () =
  print_endline "Results of exercise 1: last";
  print_function_option_result last [ "a"; "b"; "c"; "d" ];
  print_function_option_result last [];
  print_endline "------------------------";

  print_endline "Results of exercise 2: last2";
  print_function_result last2 [ "a"; "b"; "c"; "d" ];
  print_function_result last2 [];
  print_endline "------------------------";

  print_endline "Results of exercise 3: N'th Element ";
  print_endline (at [ "a"; "b"; "c"; "d"; "e" ] 2);
  print_endline "------------------------";

  print_endline "Results of exercise 4: Length of a List";
  print_endline (string_of_int (list_length [ "a"; "b"; "c" ]));
  print_endline (string_of_int (list_length []));
  print_endline "------------------------";

  print_endline "Results of exercise 5: Rev List";
  print_list (rev [ "a"; "b"; "c" ]);
  print_list (rev []);
  print_endline "------------------------";

  print_endline "Results of exercise 6: Is Palindrome";
  print_endline (is_palindrome [ "x"; "a"; "m"; "a"; "x" ]);
  print_endline (is_palindrome [ "a"; "b" ]);
  print_endline "------------------------";

  print_endline "Results of exercise 7: Run-Length Encoding";
  print_list_of_tuples
    (run_length_ecoding
       [ "a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e" ]);
  print_endline "------------------------"
