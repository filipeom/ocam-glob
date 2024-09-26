(lang dune 3.16)

(name glob)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license "MIT")

(documentation https://url/to/documentation)

(package
 (name glob)
 (synopsis "Unix style pathname pattern expansion")
 (description "Unix style pathname pattern expansion inspired by python's glob library")
 (depends ocaml dune dune-glob)
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
