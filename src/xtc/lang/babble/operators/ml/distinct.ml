open Printf;;

module Distinct_in = struct
  type distinct_in = {
    i : int;
    k : string;
    }
end;;

let print_distinct_in_tuple tuple =
  let (tau, inserts, deletes) = tuple in
    Printf.printf "(%d, [" tau;
    List.iter (function (x) -> Printf.printf "{i=%d;k=%s}" x.Distinct_in.i x.Distinct_in.k ) inserts;
    Printf.printf "],[";
    List.iter (function (x) -> Printf.printf "{i=%d;k=%s}" x.Distinct_in.i x.Distinct_in.k ) deletes;
    Printf.printf "])\n";;

let submit ptr buffer port =
  Printf.printf "Submit called port %d\n" port;;


let ocaml_wrap_distinct ptr buffer port =
  assert (port = 0);
  let uniq lst =
    let unique_set = Hashtbl.create (List.length lst) in
      List.iter (fun x -> Hashtbl.replace unique_set x ()) lst;
      Hashtbl.fold (fun x () xs -> x :: xs) unique_set [] in
  let (tau, inserts, deletes) = Marshal.from_string buffer 0 in
  let t = (tau, (uniq inserts), (uniq deletes)) in
    print_distinct_in_tuple t;
    (submit ptr (Marshal.to_string t [Marshal.No_sharing]) 0) ;;


let item = (1, [{Distinct_in.i=3; Distinct_in.k="IBM"}; {Distinct_in.i=3; Distinct_in.k="IBM"}; {Distinct_in.i=3; Distinct_in.k="IBM"}; {Distinct_in.i=4; Distinct_in.k="IBM"};], []) ;;

let _ =
  let buffer = Marshal.to_string item [Marshal.No_sharing] in
    ocaml_wrap_distinct 0 buffer 0;
