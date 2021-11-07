open Printf;;

module Now_in = struct
  type now_in = {
    low : int;
    ticker : string;
    }
end;;

module Now_out = struct
  type now_out = {
    low : int;
    ticker : string;
    }
end;;


let port0_window : (int * Now_in.now_in list * Now_in.now_in list) list ref  = ref [] ;;

let now port0_tup =
  let (in_tau, in_inserts, in_deletes) = port0_tup in
    if (List.length !port0_window) = 0 then
      let _ = port0_window := !port0_window@[port0_tup] in          
        (in_tau, in_inserts, [])
    else
      let (old_tau, old_inserts, old_deletes) = List.hd !port0_window
      in let _ = port0_window := [port0_tup] in          
        (in_tau, in_inserts, old_inserts);;         

let ocaml_wrap_now1 buffer port = 
  assert (port = 0);
  let tup = Marshal.from_string buffer 0 in
    Marshal.to_string (now tup) [Marshal.No_sharing] ;;         
    

