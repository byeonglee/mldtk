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
  Printf.printf "submitting to : %d\n" port;
  print_union_data_item data;; 


let parallelism = ref 2

let hashsplit ptr port tup =
  let (tau, inserts, deletes) = tup in
  let get_inserts (_,inserts,_) = inserts in
  let get_deletes (_,_,deletes) = deletes in
  let deref (tau,inserts,deletes) =  (tau, !inserts, !deletes) in
  let outputs =  Array.init !parallelism  (fun x -> (tau, ref [], ref [])) in
  let filter list f = 
    List.iter (fun x -> 
                 let ir = (f (Array.get outputs ((Hashtbl.hash x.Union_in.origin) mod !parallelism))) in 
                   ir := x::!ir ) list 
  in
    filter inserts get_inserts;
    filter deletes get_deletes;
    for i = 0 to !parallelism-1 do
      ocaml_wrap_output ptr i (deref (Array.get outputs i))
    done


let ocaml_wrap_hashsplit ptr buffer port =
  let data =
    Marshal.from_string buffer 0 in
    hashsplit ptr 0 data;;


(******** Testing Code *********)


let _ =  
  let size = 10 in
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
