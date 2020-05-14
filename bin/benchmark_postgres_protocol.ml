open Postgres_protocol
open Async

let () =
  Thread_safe.block_on_async_exn
  @@ fun () ->
  let string = "R\x00\x00\x00\x08\x00\x00\x00\x00" in
  let bigstring = Base_bigstring.of_string string in
  let%bind reader =
    Pipe.unfold ~init:() ~f:(fun () -> return (Some (string, ())))
    |> Reader.of_pipe (Core.Info.of_string "pipe")
  in
  In_thread.run
  @@ fun () ->
  Core_bench.(
    Bench.make_command
      [ Bench.Test.create ~name:"Authentication_ok (string)" (fun () ->
            string |> Angstrom.parse_string ~consume:All Authentication_ok.parser)
      ; Bench.Test.create ~name:"Authentication_ok (bigstring)" (fun () ->
            bigstring |> Angstrom.parse_bigstring ~consume:All Authentication_ok.parser)
      ; Bench.Test.create ~name:"Authentication_ok_int_lift.parse (async)" (fun () ->
            Async.Thread_safe.block_on_async_exn (fun () ->
                reader |> Angstrom_async.parse Authentication_ok.parser))
      ])
  |> Core.Command.run
;;
