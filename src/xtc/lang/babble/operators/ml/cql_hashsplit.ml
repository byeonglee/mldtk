open Printf;;

module Union_in = struct
  type union_in = {
    origin : string;
    target : string;
    }
end;;

(**************** test code helper *********************)

let print_union_data_item tuple =
  let (tau, inserts, deletes) = tuple in
    Printf.printf "(%d, [" tau;
    List.iter (function (x) -> Printf.printf "{low=%s;ticker=%s}" x.Union_in.origin x.Union_in.target ) inserts;
    Printf.printf "],[";
    List.iter (function (x) -> Printf.printf "{low=%s;ticker=%s}" x.Union_in.origin x.Union_in.target ) deletes;
    Printf.printf "])\n";;

(**************** end test code helper *********************)


let ocaml_wrap_output ptr port data =
()
(*
  Printf.printf "submitting to : %d\n" port;
  print_union_data_item data;; 
*)

let hashsplit ptr tup =
  let n = 2 in   
  let (tau, inserts, deletes) = tup in
  let myfilter list index =
    List.filter (fun x -> (Hashtbl.hash x.Union_in.origin) mod n = index-1) list in
  let outputs = 
    let rec build_output count list =   
      match count with
        | 1 ->  list@[(tau,(myfilter inserts count), (myfilter deletes count))]
        | _ ->  build_output (count-1) list@[(tau,(myfilter inserts count), (myfilter deletes count))] in      
      build_output n [] in    
  let rec submit count list =
    match count with
      | 1 -> ocaml_wrap_output ptr (n-count) (List.hd list)
      | _ -> ocaml_wrap_output ptr (n-count) (List.hd list); submit (count-1) (List.tl list)
  in submit n outputs;;
    



let ocaml_wrap_hashsplit ptr buffer port =
  let data =
    Marshal.from_string buffer 0 in
    hashsplit ptr data;;


(******** Testing Code *********)

(*
let data_item1 = (1, 
                 [{Union_in.origin = "0"; Union_in.target = "IBM"} ],
                 [{Union_in.origin = "0"; Union_in.target = "IBM"} ] );;

let data_item2 = (2, 
                 [{Union_in.origin = "1"; Union_in.target = "XYZ"} ],
                 [{Union_in.origin = "1"; Union_in.target = "XYZ"} ] );;

let data_item3 = (3, 
                 [{Union_in.origin = "2"; Union_in.target = "1bc"} ],
                 [{Union_in.origin = "3"; Union_in.target = "1bc"} ] );;

*)

let _ =  
  let size = 1000000 in
  let t1 = Sys.time() in 
    for i=1 to size do
      let data_item1 = (i, [{Union_in.origin = "0"; Union_in.target = "IBM"} ], [ {Union_in.origin = "0"; Union_in.target = "IBM"} ] ) in
        ( ocaml_wrap_hashsplit 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) 0) ;
    done;
    let t2 = Sys.time() in 
      Printf.printf "completed %d tuples in %f seconds\n" size (t2 -. t1)


(*

let _ = 
  ocaml_wrap_hashsplit 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string data_item2 [Marshal.No_sharing]) 0 ;
  ocaml_wrap_hashsplit 0 (Marshal.to_string data_item3 [Marshal.No_sharing]) 0 

*)
