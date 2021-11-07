
type quote = {
  ticker : string;
  price : int;
};;

let project tau inserts deletes port =
   assert (port = 1);
   (tau,
    List.map (function (x:quote) -> {ticker=x.ticker;price=x.price +1}) inserts,
    List.map (function (x:quote) -> {ticker=x.ticker;price=x.price +1}) deletes)

let istream tau inserts deletes port =
   assert (port = 1);
   (tau, inserts, [])

let ocaml_wrap_project buffer =
  let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
   Marshal.to_string (project tau inserts deletes 1) [Marshal.No_sharing]

let ocaml_wrap_istream buffer =
  let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
   Marshal.to_string (istream tau inserts deletes 1) [Marshal.No_sharing]

let ocaml_source port =
  assert (port = 1);
  let dataItem = (1, [{ticker = "IBM"; price = 2}], [{ticker = "XYZ"; price = 35}] ) in
  Marshal.to_string dataItem [Marshal.No_sharing]

let ocaml_sink buffer =
  let ((tau:int), inserts, deletes) = Marshal.from_string buffer 0 in
  Printf.printf "Tau:\n    %d" tau;
  Printf.printf "Inserts:\n";
  Printf.printf "Deletes.\n";
  List.map (function (x:quote) -> Printf.printf "    %s %d.\n" x.ticker x.price; x=x) deletes;   
  flush stdout 
  
(* On program initialisation, register functions to be called from C. *)
let () =
    Callback.register "ocaml_wrap_project" ocaml_wrap_project ;
    Callback.register "ocaml_wrap_istream" ocaml_wrap_istream ;
    Callback.register "ocaml_source" ocaml_source ;
    Callback.register "ocaml_sink" ocaml_sink 
