open Angstrom
open Types

let parser = lift2 (fun _ _ -> `Bind_complete) (char '2') (BE.int32 4l) <?> "BindComplete"
