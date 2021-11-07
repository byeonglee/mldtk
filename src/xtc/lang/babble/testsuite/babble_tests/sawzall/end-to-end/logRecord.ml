open Printf;;

module LogRecord = struct
  type logRecord = {
    origin:string;
    target:string;
    }
end;;

let log_items =
  [
    {LogRecord.origin = "196.0.0.1"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.1"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.1"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.1"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.1"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.2"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.3"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.4"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.5"; LogRecord.target = "196.0.0.2"}; 
    {LogRecord.origin = "196.0.0.6"; LogRecord.target = "196.0.0.2"} 
  ] ;;

let oc = open_out "/tmp/logRecord.data" in
  List.iter (function (x) -> Marshal.to_channel oc x [Marshal.No_sharing]) log_items ;
  close_out oc;;

