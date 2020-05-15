open Angstrom

let any_null_terminated_string : string t =
  take_while (function
      | '\x00' -> false
      | _ -> true)
  >>= fun str -> char '\x00' >>| fun _ -> str
;;
