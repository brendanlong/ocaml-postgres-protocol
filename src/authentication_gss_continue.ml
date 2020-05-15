open Angstrom

type t = { auth_data : string }

let parser =
  lift3 (fun _ length _ -> length) (char 'R') BE.any_int32 (BE.int32 8l)
  >>= (fun length ->
        take (Int32.to_int length)
        >>| fun auth_data -> `Authentication_gss_continue { auth_data })
  <?> "AuthenticationGSSContinue"
;;
