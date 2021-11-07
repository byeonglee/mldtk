open Printf;;

let rec remove_dup l = match l with 
| [] -> []
| x :: xs -> [x] @ (remove_dup (List.filter (fun y->y<>x) xs));;

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
