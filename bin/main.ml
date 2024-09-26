let glob pattern =
  match Glob.glob ~recursive:true pattern with
  | Error (`Msg err) -> failwith err
  | Ok results ->
      Format.printf "@[<hov>%a@]@."
        (Format.pp_print_list
           ~pp_sep:(fun fmt () -> Format.fprintf fmt "@;")
           Fpath.pp)
        results

let cli =
  let open Cmdliner in
  let fpath = ((fun str -> `Ok (Fpath.v str)), Fpath.pp) in
  let pattern =
    let doc = "Glob pattern" in
    Arg.(required & pos 0 (some fpath) None & info [] ~doc)
  in
  let info = Cmd.info "glob" ~version:"%%VERSION%%" in
  Cmd.v info Term.(const glob $ pattern)

let () =
  match Cmdliner.Cmd.eval_value' cli with `Ok () -> exit 0 | `Exit n -> exit n
