build:
	ocamlfind ocamlopt -package batteries -linkpkg -o football lanczos.ml bessel.ml skellam.ml

clean:
	rm *.cm* *.o football 
