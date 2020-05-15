open Angstrom

type t = { salt : int32 }

let parser =
  lift4
    (fun _ _ _ salt -> `Authentication_md5_password { salt })
    (char 'R')
    (BE.int32 12l)
    (BE.int32 5l)
    BE.any_int32
  <?> "AuthenticationMD5Password"
;;
