open Angstrom

let parser =
  lift3 (fun _ _ _ -> `Authentication_kerberos_v5) (char 'R') (BE.int32 8l) (BE.int32 2l)
  <?> "AuthenticationKerberosV5"
;;
