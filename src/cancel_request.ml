open Angstrom

type t =
  { process_id : int32
  ; secret_key : int32
  }

let parser =
  lift4
    (fun _ _ process_id secret_key -> `Cancel_request { process_id; secret_key })
    (BE.int32 16l)
    (BE.int32 80877102l)
    BE.any_int32
    BE.any_int32
  <?> "CancelRequest"
;;
