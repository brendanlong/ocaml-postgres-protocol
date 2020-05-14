open Angstrom
open Types

let parser = lift3 (fun _ _ _ -> ()) (char 'R') (uint32 8L) (uint32 0L)
