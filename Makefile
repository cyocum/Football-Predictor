build:
	ocamlfind ocamlopt -package batteries,csv -linkpkg -o football lanczos.mli bessel.mli lanczos.ml bessel.ml skellam.mli skellam.ml football.mli football.ml configure.mli configure.ml main.ml

infer:
	ocamlfind ocamlopt -package batteries,csv -linkpkg -o football -i lanczos.mli bessel.mli lanczos.ml bessel.ml skellam.mli skellam.ml football.mli football.ml configure.ml main.ml

clean:
	rm *.cm* *.o football 
