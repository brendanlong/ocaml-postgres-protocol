open Angstrom

let parser =
  lift3
    (fun _ _ _ -> `Authentication_cleartext_password)
    (char 'R')
    (BE.int32 8l)
    (BE.int32 3l)
  <?> "AuthenticationCleartextPassword"
;;
