build:
	ocamlfind ocamlopt -package batteries -linkpkg -o football lanczos.mli bessel.mli lanczos.ml bessel.ml skellam.ml

clean:
	rm *.cm* *.o football 
