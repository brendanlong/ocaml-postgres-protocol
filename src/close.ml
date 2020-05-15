open Angstrom

type t =
  { type_ : char
  ; name : string
  }

let parser =
  lift3 (fun _ length type_ -> length, type_) (char 'C') BE.any_int32 any_char
  >>= (fun (_length, type_) ->
        Types.any_null_terminated_string >>| fun name -> { type_; name })
  <?> "Close"
;;
