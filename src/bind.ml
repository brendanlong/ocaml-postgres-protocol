open Angstrom
open Types

type t =
  { destination_portal : string
  ; source_prepared_statement : string
  ; format_codes : int list
  ; parameter_values : string option list
  ; result_codes : int list
  }

let parser =
  lift2 (fun _ length -> length) (char 'B') BE.any_int32
  (* TODO: Validate length *)
  >>= fun _length ->
  any_null_terminated_string
  >>= fun destination_portal ->
  any_null_terminated_string
  >>= fun source_prepared_statement ->
  BE.any_int16
  >>= fun num_format_codes ->
  count num_format_codes BE.any_int16
  >>= fun format_codes ->
  BE.any_int16
  >>= fun num_parameter_values ->
  count
    num_parameter_values
    (BE.any_int32
    >>= function
    | -1l -> return None
    | parameter_length -> take (Int32.to_int parameter_length) >>| fun value -> Some value
    )
  >>= fun parameter_values ->
  BE.any_int16
  >>= fun num_result_codes ->
  count num_result_codes BE.any_int16
  >>| fun result_codes ->
  `Bind
    { destination_portal
    ; source_prepared_statement
    ; format_codes
    ; parameter_values
    ; result_codes
    }
;;
