open Angstrom

let any_uint32 : int64 t =
  lift4
    (fun a b c d ->
      let ( + ) = Int64.add in
      Int64.(
        shift_left (of_int a) 24
        + shift_left (of_int b) 16
        + shift_left (of_int c) 8
        + of_int d))
    any_uint8
    any_uint8
    any_uint8
    any_uint8
;;

let uint32 expect =
  any_uint32
  >>= function
  | value when value = expect -> return value
  | value -> fail (Printf.sprintf "Expected %Ld but got %Ld" expect value)
;;
