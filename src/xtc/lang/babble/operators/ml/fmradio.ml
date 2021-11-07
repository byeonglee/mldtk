open Printf;;

let coeff =
  let pi = 4.0 *. atan 1.0
  and rate = 250000000.0
  and cutoff = 108000000.0
  and taps = 64 in
  let m = taps - 1 in 
  let w = 2.0 *. pi *. cutoff /. rate in 
  ref (Array.init taps ( fun t ->  if (t - m/2 == 0) then w /. pi
      else
        (sin (w *. ((float_of_int t) -. (float_of_int m) /. 2.0))) /.
        pi /.
        ((float_of_int t) -. (float_of_int m) /. 2.0) *.
        (0.54 -. 0.46 *. (cos 2.0 *. pi *. (float_of_int t) /. (float_of_int m)))));; 


let ocaml_wrap_output_float_printer18 ptr port data  = 
  Printf.printf "ocaml_wrap_output_float_printer18 data: %.4f \n" data;;

let float_printer18 ptr port data = 
  ocaml_wrap_output_float_printer18 ptr port data ;;

let ocaml_wrap_float_printer18 ptr port data  = 
  float_printer18 ptr port data ;;

let dup_split ptr port data  = ()
let rr_join ptr port data  = ()

let ocaml_wrap_output_eq_filter17 ptr port data  = 
  Printf.printf "ocaml_wrap_output_eq_filter17 data: %.4f \n" data;
  ocaml_wrap_float_printer18 ptr port data ;;

let eq_filter17_buffer : float Queue.t ref = ref (Queue.create ()) ;;

let eq_filter17 ptr port data  =
  let bands = 2 in (* 11 in the example app *)
    Queue.add data !eq_filter17_buffer;
    match (Queue.length !eq_filter17_buffer) with
      | 2 -> let sum = Queue.fold (+.) 0.0 !eq_filter17_buffer in
          Queue.clear !eq_filter17_buffer;
          ocaml_wrap_output_eq_filter17 ptr port sum 
      | _ -> ()

let ocaml_wrap_eq_filter17 ptr port data  = 
  eq_filter17 ptr port data ;;

let ocaml_wrap_output_joinroundrobin16  ptr port data  =
  Printf.printf "ocaml_wrap_output_joinroundrobin16  data: %.4f \n" data;
  ocaml_wrap_eq_filter17 ptr port data ;;

let ocaml_wrap_output_amplify15 ptr port data  = 
  Printf.printf "ocaml_wrap_output_amplify15 data: %.4f \n" data;
  ocaml_wrap_eq_filter17 ptr port data ;;

let amplify15 ptr port data  = 
  let gain = 10.0 in
    ocaml_wrap_output_amplify15 ptr port (data +. gain) ;;    
  
let ocaml_wrap_amplify15 ptr port data  = 
  amplify15 ptr port data  ;;  

let ocaml_wrap_output_subtractor14 ptr port data  = 
  Printf.printf "ocaml_wrap_output_subtractor14 data: %.4f \n" data;
  ocaml_wrap_amplify15 ptr port data ;;

let subtractor14_buffer = ref (Array.make 2 0.0) ;;
let subtractor14_buffer_first = ref 0 ;;
let subtractor14_buffer_last = ref (-1) ;;

let subtractor14 ptr port data = 
  let size = 2 in
    subtractor14_buffer_last := (!subtractor14_buffer_last + 1) mod size;
    Array.set !subtractor14_buffer !subtractor14_buffer_last data;
    if ( ((!subtractor14_buffer_last + 1) mod size)
         == !subtractor14_buffer_first) then
      let temp = 
        (Array.get !subtractor14_buffer ((!subtractor14_buffer_first + 1) mod size)) -.      
          (Array.get !subtractor14_buffer !subtractor14_buffer_first) in
        subtractor14_buffer_first := (!subtractor14_buffer_first + 1) mod size;
        ocaml_wrap_output_subtractor14 ptr port temp             
      

let ocaml_wrap_subtractor14 ptr port data = 
  subtractor14 ptr port data;;

let ocaml_wrap_joinroundrobin13  ptr port data =
  Printf.printf "ocaml_wrap_output_joinroundrobin13  data: %.4f \n" data;
  ocaml_wrap_subtractor14 ptr port data;;

let ocaml_wrap_output_low_pass_filter12 ptr port data =
  Printf.printf "ocaml_wrap_output_low_pass_filter12 data: %.4f \n" data;
  ocaml_wrap_joinroundrobin13 ptr port data;;


let low_pass_filter12_buffer = ref (Array.make 64 0.0) ;;
let low_pass_filter12_buffer_first = ref 0 ;;
let low_pass_filter12_buffer_last = ref (-1) ;;

let low_pass_filter12 ptr port data =
  let rate = 250000000
  and cutoff = 108000000
  and taps = 64
  and decimation = 4 in    
    low_pass_filter12_buffer_last := (!low_pass_filter12_buffer_last + 1) mod taps;
    Array.set !low_pass_filter12_buffer !low_pass_filter12_buffer_last data;
    if ( ((!low_pass_filter12_buffer_last + 1) mod taps)
      == !low_pass_filter12_buffer_first) then
      let sum = ref 0.0 in
        Array.iteri ( fun i a -> sum := !sum +. a +. (Array.get !low_pass_filter12_buffer ((!low_pass_filter12_buffer_first + i) mod taps))) !coeff;        
        low_pass_filter12_buffer_first := (!low_pass_filter12_buffer_first + decimation) mod taps;
        ocaml_wrap_output_low_pass_filter12 ptr port !sum  ;;


let ocaml_wrap_low_pass_filter12 ptr port data = low_pass_filter12 ptr port data ;;

let ocaml_wrap_output_low_pass_filter11 ptr port data =
  Printf.printf "ocaml_wrap_output_low_pass_filter11 data: %.4f \n" data;
  ocaml_wrap_subtractor14 ptr port data;;


let low_pass_filter11_buffer = ref (Array.make 64 0.0) ;;
let low_pass_filter11_buffer_first = ref 0 ;;
let low_pass_filter11_buffer_last = ref (-1) ;;

let low_pass_filter11 ptr port data =
  let rate = 250000000
  and cutoff = 108000000
  and taps = 64
  and decimation = 4 in    
    low_pass_filter11_buffer_last := (!low_pass_filter11_buffer_last + 1) mod taps;
    Array.set !low_pass_filter11_buffer !low_pass_filter11_buffer_last data;
    if ( ((!low_pass_filter11_buffer_last + 1) mod taps)
      == !low_pass_filter11_buffer_first) then
      let sum = ref 0.0 in
        Array.iteri ( fun i a -> sum := !sum +. a +. (Array.get !low_pass_filter11_buffer ((!low_pass_filter11_buffer_first + i) mod taps))) !coeff;        
        low_pass_filter11_buffer_first := (!low_pass_filter11_buffer_first + decimation) mod taps;
        ocaml_wrap_output_low_pass_filter11 ptr port !sum  ;;


let ocaml_wrap_low_pass_filter11 ptr port data = low_pass_filter11 ptr port data ;;

let ocaml_wrap_splitduplicate10 ptr port data =
  Printf.printf "ocaml_wrap_output_splitduplicate10 data: %.4f \n" data;
  ocaml_wrap_low_pass_filter11  ptr port data;
  ocaml_wrap_low_pass_filter12 ptr port data;;

let ocaml_wrap_output_amplify9 ptr port data = 
  Printf.printf "ocaml_wrap_output_amplify9 data: %.4f \n" data;
  ocaml_wrap_eq_filter17 ptr port data;;

let amplify9 ptr port data = 
  let gain = 10.0 in
    ocaml_wrap_output_amplify9 ptr port (data +. gain) ;;    
  
let ocaml_wrap_amplify9 ptr port data = 
  amplify9 ptr port data ;;  

let ocaml_wrap_output_subtractor8 ptr port data = 
  Printf.printf "ocaml_wrap_output_subtractor8 data: %.4f \n" data;
  ocaml_wrap_amplify9 ptr port data;;


let subtractor8_buffer = ref (Array.make 2 0.0) ;;
let subtractor8_buffer_first = ref 0 ;;
let subtractor8_buffer_last = ref (-1) ;;

let subtractor8 ptr port data = 
  let size = 2 in
    subtractor8_buffer_last := (!subtractor8_buffer_last + 1) mod size;
    Array.set !subtractor8_buffer !subtractor8_buffer_last data;
    if ( ((!subtractor8_buffer_last + 1) mod size)
         == !subtractor8_buffer_first) then
      let temp = 
        (Array.get !subtractor8_buffer ((!subtractor8_buffer_first + 1) mod size)) -.      
          (Array.get !subtractor8_buffer !subtractor8_buffer_first) in
        subtractor8_buffer_first := (!subtractor8_buffer_first + 1) mod size;
        ocaml_wrap_output_subtractor8 ptr port temp             
      
let ocaml_wrap_subtractor8 ptr port data = 
  subtractor8 ptr port data;;
  
let ocaml_wrap_joinroundrobin7 ptr port data =
  Printf.printf "ocaml_wrap_output_joinroundrobin7 data: %.4f \n" data;
  ocaml_wrap_output_subtractor8 ptr port data;;

let ocaml_wrap_output_low_pass_filter6 ptr port data =
  Printf.printf "ocaml_wrap_output_low_pass_filter6 data: %.4f \n" data;
  ocaml_wrap_joinroundrobin7 ptr port data;;


let low_pass_filter6_buffer = ref (Array.make 64 0.0) ;;
let low_pass_filter6_buffer_first = ref 0 ;;
let low_pass_filter6_buffer_last = ref (-1) ;;

let low_pass_filter6 ptr port data =
  let rate = 250000000
  and cutoff = 108000000
  and taps = 64
  and decimation = 4 in    
    low_pass_filter6_buffer_last := (!low_pass_filter6_buffer_last + 1) mod taps;
    Array.set !low_pass_filter6_buffer !low_pass_filter6_buffer_last data;
    if ( ((!low_pass_filter6_buffer_last + 1) mod taps)
      == !low_pass_filter6_buffer_first) then
      let sum = ref 0.0 in
        Array.iteri ( fun i a -> sum := !sum +. a +. (Array.get !low_pass_filter6_buffer ((!low_pass_filter6_buffer_first + i) mod taps))) !coeff;        
        low_pass_filter6_buffer_first := (!low_pass_filter6_buffer_first + decimation) mod taps;
        ocaml_wrap_output_low_pass_filter6 ptr port !sum  ;;

let ocaml_wrap_low_pass_filter6 ptr port data = low_pass_filter6 ptr port data ;;

let ocaml_wrap_output_low_pass_filter5 ptr port data =
  Printf.printf "ocaml_wrap_output_low_pass_filter5 data: %.4f \n" data;
  ocaml_wrap_joinroundrobin7 ptr port data;;


let low_pass_filter5_buffer = ref (Array.make 64 0.0) ;;
let low_pass_filter5_buffer_first = ref 0 ;;
let low_pass_filter5_buffer_last = ref (-1) ;;

let low_pass_filter5 ptr port data =
  let rate = 250000000
  and cutoff = 108000000
  and taps = 64
  and decimation = 4 in    
    low_pass_filter5_buffer_last := (!low_pass_filter5_buffer_last + 1) mod taps;
    Array.set !low_pass_filter5_buffer !low_pass_filter5_buffer_last data;
    if ( ((!low_pass_filter5_buffer_last + 1) mod taps)
      == !low_pass_filter5_buffer_first) then
      let sum = ref 0.0 in
        Array.iteri ( fun i a -> sum := !sum +. a +. (Array.get !low_pass_filter5_buffer ((!low_pass_filter5_buffer_first + i) mod taps))) !coeff;        
        low_pass_filter5_buffer_first := (!low_pass_filter5_buffer_first + decimation) mod taps;
        ocaml_wrap_output_low_pass_filter5 ptr port !sum  ;;

let ocaml_wrap_low_pass_filter5 ptr port data = low_pass_filter5 ptr port data ;;

let ocaml_wrap_splitduplicate4 ptr port data =
  Printf.printf "ocaml_wrap_output_splitduplicate4 data: %.4f \n" data;
  ocaml_wrap_low_pass_filter5  ptr port data;
  ocaml_wrap_low_pass_filter6 ptr port data;;

let ocaml_wrap_splitduplicate3 ptr port data =
  Printf.printf "ocaml_wrap_output_splitduplicate3 data: %.4f \n" data;
  ocaml_wrap_splitduplicate4 ptr port data;
  ocaml_wrap_splitduplicate10 ptr port data;;


(**** fm radio core *****)

let ocaml_wrap_output_fm_demodulator2 ptr port data =
  Printf.printf "ocaml_wrap_output_fm_demodulator2 data: %.4f \n" data;
  ocaml_wrap_splitduplicate3 ptr port data ;; 


let fm_demodulator2_buffer = ref (Array.make 2 0.0) ;;
let fm_demodulator2_buffer_first = ref 0 ;;
let fm_demodulator2_buffer_last = ref (-1) ;;

let fm_demodulator2 ptr port data =
  let pi = 4.0 *. atan 1.0
  and sampRate = 250000000.0
  and max = 27000.0
  and bandwidth = 10000.0 
  and size = 2
  in
    fm_demodulator2_buffer_last := (!fm_demodulator2_buffer_last + 1) mod size;
    Array.set !fm_demodulator2_buffer !fm_demodulator2_buffer_last data;
    if ( ((!fm_demodulator2_buffer_last + 1) mod size)
         == !fm_demodulator2_buffer_first) then
      let mGain = max *. (sampRate/.(bandwidth*.pi)) in
      let temp2 = 
        let temp1 = (Array.get !fm_demodulator2_buffer !fm_demodulator2_buffer_first) *.
          (Array.get !fm_demodulator2_buffer ((!fm_demodulator2_buffer_first + 1) mod size)) in
          mGain *. (atan temp1) in     
        fm_demodulator2_buffer_first := (!fm_demodulator2_buffer_first + 1) mod size;
        ocaml_wrap_output_fm_demodulator2 ptr port temp2 


let ocaml_wrap_fm_demodulator2 ptr port data =
  fm_demodulator2 ptr port data ;;

(**** float_one_source0 *****)

let ocaml_wrap_output_low_pass_filter1 ptr port data =
  Printf.printf "ocaml_wrap_output_low_pass_filter1 data: %.4f \n" data;
  ocaml_wrap_fm_demodulator2 ptr port data;;

let low_pass_filter1_buffer = ref (Array.make 64 0.0) ;;
let low_pass_filter1_buffer_first = ref 0 ;;
let low_pass_filter1_buffer_last = ref (-1) ;;

let low_pass_filter1 ptr port data =
  let rate = 250000000
  and cutoff = 108000000
  and taps = 64
  and decimation = 4 in    
    low_pass_filter1_buffer_last := (!low_pass_filter1_buffer_last + 1) mod taps;
    Array.set !low_pass_filter1_buffer !low_pass_filter1_buffer_last data;
    if ( ((!low_pass_filter1_buffer_last + 1) mod taps)
      == !low_pass_filter1_buffer_first) then
      let sum = ref 0.0 in
        Array.iteri ( fun i a -> sum := !sum +. a +. (Array.get !low_pass_filter1_buffer ((!low_pass_filter1_buffer_first + i) mod taps))) !coeff;        
        low_pass_filter1_buffer_first := (!low_pass_filter1_buffer_first + decimation) mod taps;
        ocaml_wrap_output_low_pass_filter1 ptr port !sum  ;;

let ocaml_wrap_low_pass_filter1 ptr port data =
  low_pass_filter1 ptr port data ;;

(**** float_one_source0 *****)
let ocaml_wrap_output_float_one_source0 ptr port data =
  ocaml_wrap_low_pass_filter1 ptr port data ;;

let float_one_source0 ptr port = 
  let f = 0.0 in
  Printf.printf "ocaml_wrap_output_float_one_source0 \n";
    for i = 1 to 1000 do
      ocaml_wrap_output_float_one_source0 0 0 (f +. (float_of_int i)) 
      (* ocaml_wrap_output_float_one_source0 0 0 1.0  *)
    done;;

let ocaml_wrap_float_one_source0 ptr port =
  float_one_source0 ptr port ;;

(**** main line ****)
let _ = 
  ocaml_wrap_float_one_source0 0 0;;
