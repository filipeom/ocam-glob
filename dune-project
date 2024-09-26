(lang dune 3.16)

(name glob)

(generate_opam_files true)

(source
 (github filipeom/ocaml-glob))

(authors "Filipe Marques <filipe.s.marques@tecnico.ulisboa.pt>")

(maintainers "Filipe Marques <filipe.s.marques@tecnico.ulisboa.pt>")

(license "MIT")

(package
 (name glob)
 (synopsis "Unix style pathname pattern expansion")
 (description "Unix style pathname pattern expansion inspired by python's glob library")
 (depends ocaml dune dune-glob)
 (tags
  (topics glob python ocaml unix)))
