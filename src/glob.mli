val glob :
  ?recursive:bool ->
  ?root_dir:Fpath.t ->
  Fpath.t ->
  (Fpath.t list, [> `Msg of string ]) result
