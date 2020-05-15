open Angstrom

let parser =
  lift3 (fun _ _ _ -> `Authentication_gss) (char 'R') (BE.int32 8l) (BE.int32 7l)
  <?> "AuthenticationGSS"
;;
