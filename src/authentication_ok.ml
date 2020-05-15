open Angstrom

let parser =
  lift3 (fun _ _ _ -> `Authentication_ok) (char 'R') (BE.int32 8l) (BE.int32 0l)
  <?> "AuthenticationOk"
;;
