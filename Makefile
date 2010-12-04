build:
	ocamlfind ocamlopt -package batteries -linkpkg -o football lanczos.mli bessel.mli lanczos.ml bessel.ml skellam.mli skellam.ml main.ml

clean:
	rm *.cm* *.o football 
