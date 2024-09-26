let has_star str = String.exists (function '*' -> true | _ -> false) str

let rec find_glob_parent p =
  let parent = Fpath.parent p in
  let parent_base = Fpath.basename parent in
  if has_star parent_base then find_glob_parent parent else parent

let glob pattern =
  (* FIXME: this is probably very inefficient *)
  let matcher = Dune_glob.V1.of_string @@ Fpath.to_string pattern in
  Bos.OS.Dir.fold_contents ~elements:`Any ~traverse:`Any
    (fun p acc ->
      let path = Fpath.to_string p in
      if Dune_glob.V1.test matcher path then p :: acc else acc)
    [] (find_glob_parent pattern)
