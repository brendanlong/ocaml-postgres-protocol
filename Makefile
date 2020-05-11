build:
	@dune build @install

clean:
	@dune clean

doc:
	@dune build @doc

test:
	@dune runtest

.PHONY: build clean doc test