open Base
open Postgres_protocol

let test_authentication_ok () =
  "R\x00\x00\x00\x08\x00\x00\x00\x00"
  |> Angstrom.parse_string ~consume:All Authentication_ok.parser
  |> [%test_result: ([ `Authentication_ok ], string) Result.t]
       ~expect:(Ok `Authentication_ok)
;;

let () =
  [ "all", [ "authentication ok", `Quick, test_authentication_ok ] ]
  |> Alcotest.run "postgres protocol"
;;
