val glob :
  ?recursive:bool ->
  Fpath.t ->
  (Fpath.t list, [> `Msg of string ]) result
