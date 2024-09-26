let has_star str = String.exists (function '*' -> true | _ -> false) str

let rec find_glob_parent p =
  let parent = Fpath.parent p in
  let parent_base = Fpath.basename parent in
  if has_star parent_base then find_glob_parent parent else parent

let glob ?(recursive = false) ?root_dir pattern =
  let root_dir =
    match root_dir with Some root -> root | None -> find_glob_parent pattern
  in
  let matcher = Dune_glob.V1.of_string @@ Fpath.to_string pattern in
  let traverse = if recursive then `Any else `None in
  (* FIXME: this is probably very inefficient *)
  Bos.OS.Dir.fold_contents ~elements:`Any ~traverse
    (fun p acc ->
      let path = Fpath.to_string p in
      if Dune_glob.V1.test matcher path then p :: acc else acc)
    [] root_dir
