(lang dune 1.11)

(using fmt 1.1)

(name postgres-protocol)

(generate_opam_files true)

(license "Unlicense")

(maintainers "Brendan Long <self@brendanlong.com>")

(authors "Brendan Long <self@brendanlong.com>")

(source
 (github brendanlong/ocaml-postgres-protocol))

(documentation "https://brendanlong.github.io/postgres-protocol")

(package
 (name postgres-protocol)
 (synopsis "Serializers and deserializers for the PostgreSQL protocol")
 (depends
  (alcotest (and :with-test (>= 1.0.0)))
  (angstrom (>= 0.14.0))
  (bisect_ppx (and :dev (>= 2.0.0)))
  (dune (>= 1.11.0))
  (odoc :with-doc)
  (ppx_assert :with-test)))
