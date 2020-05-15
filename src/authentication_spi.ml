open Angstrom

let parser =
  lift3 (fun _ _ _ -> `Authentication_spi) (char 'R') (BE.int32 8l) (BE.int32 9l)
  <?> "AuthenticationSPI"
;;
