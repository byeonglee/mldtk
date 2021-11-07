open Printf;;

module Union_in = struct
  type union_in = {
    origin : string;
    target : string;
    }
end;;

module Union_out = struct
  type union_out = {
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

let print_union_port_buffer list =
  List.iter (function (tuple) -> print_union_data_item tuple ) list ;;

let print_union_window list_of_list_refs =
  List.iter (function (list) -> print_union_port_buffer !list ) list_of_list_refs ;;

(**************** end test code helper *********************)

let union_window : (int * Union_in.union_in list * Union_in.union_in list) list ref list ref =
  let n = 2 in    
  let rec build_window count list =
    match count with
      | 1 -> list@[ref []]
      | _ -> build_window (count-1) list@[ref []] in
    ref (build_window n []);;


let ocaml_wrap_output ptr port data = 
  Printf.printf "Tetris!\n";
  Printf.printf "sending to %d\n" port;
  print_union_data_item data
  (*print_union_window !union_window;; *) 
    
let union1 ptr tup port =
  let get_tau (tau, _, _) = tau in
    let port_buffer = List.nth !union_window port in    
      port_buffer := !port_buffer@[tup];       
      let tetris = 
        let tau = get_tau (tup) in
          List.for_all (fun x -> if (0 = List.length !x) then false else tau = get_tau (List.hd !x) ) !union_window
      in
      if (tetris) then
        let heads = 
          List.map (fun x -> (List.hd !x)) !union_window
        in 
        let unioned = 
          List.fold_left (fun lhs rhs -> 
                            let (t1, i1, d1) = lhs 
                            and (t2, i2, d2) = rhs in
                              (t1, i1@i2, d1@d2)) (get_tau tup, [], []) heads in     
          (ocaml_wrap_output ptr 0 unioned);
          List.iter (fun x -> (x := List.tl !x)) !union_window ;;

let ocaml_wrap_union1 ptr buffer port = 
  let tup = Marshal.from_string buffer 0 in        
    union1 ptr tup port;;


(**************** test code helper *********************)

let data_item1 = (1, [{Union_in.origin = "1"; Union_in.target = "0"} ], [ ] );;
(* let data_item2 = (1, [{Union_in.origin = "1"; Union_in.target = "1"} ], [ ] );; *)
let data_item2 = (1, [ ], [ ] );;
let data_item3 = (2, [{Union_in.origin = "2"; Union_in.target = "0"} ], [ ] );;
let data_item4 = (2, [{Union_in.origin = "2"; Union_in.target = "1"} ], [ ] );;
let data_item5 = (3, [{Union_in.origin = "3"; Union_in.target = "0"} ], [ ] );;
let data_item6 = (3, [{Union_in.origin = "3"; Union_in.target = "1"} ], [ ] );;
let data_item7 = (4, [{Union_in.origin = "4"; Union_in.target = "0"} ], [ ] );;
let data_item8 = (4, [{Union_in.origin = "4"; Union_in.target = "1"} ], [ ] );;
let data_item9 = (5, [{Union_in.origin = "5"; Union_in.target = "0"} ], [ ] );;
let data_item10 = (5, [{Union_in.origin = "5"; Union_in.target = "1"} ], [ ] );;

let _ =  
try
  (ocaml_wrap_union1 0 (Marshal.to_string data_item1 [Marshal.No_sharing]) 0);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item2 [Marshal.No_sharing]) 1);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item3 [Marshal.No_sharing]) 0);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item4 [Marshal.No_sharing]) 1);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item5 [Marshal.No_sharing]) 0);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item6 [Marshal.No_sharing]) 1);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item7 [Marshal.No_sharing]) 0);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item8 [Marshal.No_sharing]) 1);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item9 [Marshal.No_sharing]) 0);    
  (ocaml_wrap_union1 0 (Marshal.to_string data_item10 [Marshal.No_sharing]) 1)    
with e -> Printf.printf "fail"

