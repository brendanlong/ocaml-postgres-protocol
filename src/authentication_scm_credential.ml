open Angstrom

let parser =
  lift3
    (fun _ _ _ -> `Authentication_scm_credential)
    (char 'R')
    (BE.int32 12l)
    (BE.int32 6l)
  <?> "AuthenticationSCMCredential"
;;
