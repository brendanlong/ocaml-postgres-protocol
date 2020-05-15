open Angstrom

type t =
  { process_id : int32
  ; secret_key : int32
  }

let parser =
  lift4
    (fun _ _ process_id secret_key -> `Backend_key_data { process_id; secret_key })
    (char 'K')
    (BE.int32 12l)
    BE.any_int32
    BE.any_int32
  <?> "BackendKeyData"
;;
