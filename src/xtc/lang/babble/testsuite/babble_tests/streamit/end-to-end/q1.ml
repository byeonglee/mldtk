open Printf;;

let _ = 
  let num_tuples = 100000000 in
    let oc = open_out "/tmp/q1.data" in
    for i = 1 to num_tuples do
      let data = float_of_int i in
        Marshal.to_channel oc data [Marshal.No_sharing]
    done;
    close_out oc
