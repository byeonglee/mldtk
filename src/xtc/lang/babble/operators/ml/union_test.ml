open Printf;;

module Union_in = struct
  type union_in = {
    low : int;
    ticker : string;
    }
end;;

module Union_out = struct
  type union_out = {
    low : int;
    ticker : string;
    }
end;;

(**************** test code helper *********************)

let print_union_window tuple =
  let (tau, inserts, deletes) = tuple in 
    Printf.printf "(%d, [" tau; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Union_in.low x.Union_in.ticker ) inserts; 
    Printf.printf "],["; 
    List.iter (function (x) -> Printf.printf "{low=%d;ticker=%s}" x.Union_in.low x.Union_in.ticker ) deletes; 
    Printf.printf "])\n";;

(**************** end test code helper *********************)

exception No_union;;

let port0_window : (int * Union_in.union_in list * Union_in.union_in list) list ref  = ref [] ;;
let port1_window : (int * Union_in.union_in list * Union_in.union_in list) list ref  = ref [] ;;

let get_tau (tau, _, _) = tau;;

let union port0_tup port1_tup =
    let (port0_tau, port0_inserts, port0_deletes) = port0_tup and
        (port1_tau, port1_inserts, port1_deletes) = port1_tup in     
      (port0_tau, port0_inserts@port1_inserts, port0_deletes@port1_deletes);;

let ocaml_wrap_union1 buffer port = 
  let _ = 
    if port = 0 then
      try 
        let tup = Marshal.from_string buffer 0 in        
          port0_window := !port0_window@[tup] ;
      with x -> raise No_union
    else
      try 
        let tup = Marshal.from_string buffer 0 in        
          port1_window := !port1_window@[tup] ;          
      with x -> raise No_union;
  in
  try
    let port0_tup = List.hd !port0_window
    and port1_tup = List.hd !port1_window 
    in
      if (get_tau port0_tup = get_tau port1_tup)
      then
        try        
          port0_window := List.tl !port0_window ; 
          port1_window := List.tl !port1_window  ;
          Marshal.to_string (union port0_tup port1_tup) [Marshal.No_sharing] ;         
        with x -> raise No_union
      else
        raise No_union 
  with e -> raise No_union ;;

(**************** test code helper *********************)

let data_item1 = (1, 
                 [{Union_in.low = 500; Union_in.ticker = "IBM"} ],
                 [{Union_in.low = 500; Union_in.ticker = "IBM"} ] );;

let data_item2 = (1, 
                 [{Union_in.low = 500; Union_in.ticker = "XYZ"} ],
                 [{Union_in.low = 500; Union_in.ticker = "XYZ"} ] );;

let _ =
  try 
    (ocaml_wrap_union1 (Marshal.to_string data_item1 [Marshal.No_sharing]) 0)    
  with e -> "bad";
  try 
    (ocaml_wrap_union1 (Marshal.to_string data_item2 [Marshal.No_sharing]) 1)    
  with e -> "bad";
